package ch.epfl.pdse.polypotapp;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.design.widget.Snackbar;
import android.support.design.widget.TabLayout;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;

import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.TimeZone;

public class ActivityMain extends AppCompatActivity implements SharedPreferences.OnSharedPreferenceChangeListener {

    /**
     * The {@link android.support.v4.view.PagerAdapter} that will provide
     * fragments for each of the sections. We use a
     * {@link FragmentPagerAdapter} derivative, which will keep every
     * loaded fragment in memory. If this becomes too memory intensive, it
     * may be best to switch to a
     * {@link android.support.v4.app.FragmentStatePagerAdapter}.
     */
    private SectionsPagerAdapter mSectionsPagerAdapter;

    /**
     * The {@link ViewPager} that will host the section contents.
     */
    private ViewPager mViewPager;

    private TabLayout mTabLayout;

    private MenuItem mPreviousDay;
    private MenuItem mCurrentDay;
    private MenuItem mNextDay;

    private SimpleDateFormat mDateFormat;
    private Calendar mDate;
    private Calendar mWaterDate;

    private boolean mFirstDateChange;
    private boolean mFirstConfigLoad;

    private CommunicationManager mCommunicationManager;
    private HashMap<String, String> mServerConfig;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mDateFormat = new SimpleDateFormat(getResources().getString(R.string.date_format));

        mFirstDateChange = true;
        mFirstConfigLoad = true;

        mServerConfig = new HashMap<>();
        mServerConfig.put("target_soil_moisture", "int");
        mServerConfig.put("water_volume_pumped", "string");
        mServerConfig.put("logging_interval", "string");
        mServerConfig.put("sending_interval", "string");

        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        // Create the adapter that will return a fragment for each of the three
        // primary sections of the activity.
        mSectionsPagerAdapter = new SectionsPagerAdapter(getSupportFragmentManager());

        // Set up the ViewPager with the sections adapter.
        mViewPager = findViewById(R.id.container);
        mViewPager.setAdapter(mSectionsPagerAdapter);

        mTabLayout = findViewById(R.id.tabs);

        // Make icons in tab independent from other same icons
        for(int i=0; i < mSectionsPagerAdapter.getCount(); i++) {
            mTabLayout.getTabAt(i).getIcon().mutate();
        }

        mViewPager.addOnPageChangeListener(new TabLayout.TabLayoutOnPageChangeListener(mTabLayout));
    }

    @Override
    public void onRestoreInstanceState(Bundle savedInstanceState) {
        // Always call the superclass so it can restore the view hierarchy
        super.onRestoreInstanceState(savedInstanceState);

        // Restore date
        mDate = GregorianCalendar.getInstance();
        mDate.setTimeInMillis(savedInstanceState.getLong("date"));

        // Restore first date change and config load state
        mFirstDateChange = savedInstanceState.getBoolean("firstDateChange");
        mFirstConfigLoad = savedInstanceState.getBoolean("firstConfigLoad");

        // Restore tab
        mViewPager.setCurrentItem(savedInstanceState.getInt("activeTab"));
    }

    @Override
    public void onResume() {
        super.onResume();  // Always call the superclass method first

        PreferenceManager.getDefaultSharedPreferences(this).registerOnSharedPreferenceChangeListener(this);

        // If mDate is not null, we are restoring the activity and can skip that section
        if(mDate == null) {
            // Use today by default
            mDate = GregorianCalendar.getInstance();

            // Set everything more specific than day to zero
            mDate.set(Calendar.HOUR_OF_DAY, 0);
            mDate.set(Calendar.MINUTE, 0);
            mDate.set(Calendar.SECOND, 0);
            mDate.set(Calendar.MILLISECOND, 0);
        }

        // Register to EventBus
        EventBus.getDefault().register(this);

        mCommunicationManager = new CommunicationManager(this, mDate);

        EventBus.getDefault().post(new CommunicationManager.Request(CommunicationManager.RequestType.GET_LATEST));
        EventBus.getDefault().post(new CommunicationManager.Request(CommunicationManager.RequestType.GET_DATA));
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onPrepareOptionsMenu(Menu menu)
    {
        // Save reference to items in toolbar
        mPreviousDay = menu.findItem(R.id.previous_day);
        mCurrentDay = menu.findItem(R.id.current_day);
        mNextDay = menu.findItem(R.id.next_day);

        // Update date in toolbar
        mCurrentDay.setTitle(mDateFormat.format(mDate.getTime()));

        // Hide date if on Summary and Configuration tabs, update icons transparency
        updateToolbarAndTablayout(mViewPager.getCurrentItem());

        // Same thing, but on tab change
        mTabLayout.addOnTabSelectedListener(new TabLayout.ViewPagerOnTabSelectedListener(mViewPager){
            @Override
            public void onTabSelected(TabLayout.Tab tab) {
                super.onTabSelected(tab);

                // Hide date if on Summary and Configuration tabs, update icons transparency
                updateToolbarAndTablayout(tab.getPosition());
            }
        });
        return true;
    }

    @Override
    public void onSaveInstanceState(Bundle savedInstanceState) {
        // Save the current tab
        savedInstanceState.putInt("activeTab", mViewPager.getCurrentItem());

        // Save first date change and config load state
        savedInstanceState.putBoolean("firstDateChange", mFirstDateChange);
        savedInstanceState.putBoolean("firstConfigLoad", mFirstConfigLoad);

        // Save the date
        savedInstanceState.putLong("date", mDate.getTimeInMillis());

        // Always call the superclass so it can save the view hierarchy state
        super.onSaveInstanceState(savedInstanceState);
    }

    @Override
    protected void onPause() {
        super.onPause();

        mCommunicationManager.stop();

        PreferenceManager.getDefaultSharedPreferences(this).unregisterOnSharedPreferenceChangeListener(this);

        EventBus.getDefault().unregister(this);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        switch (item.getItemId()) {
            case R.id.previous_day:
                // Remove one day
                mDate.add(Calendar.DAY_OF_MONTH, -1);

                // Update date in toolbar
                mCurrentDay.setTitle(mDateFormat.format(mDate.getTime()));

                // Update data and graphs
                EventBus.getDefault().post(new CommunicationManager.Request(CommunicationManager.RequestType.GET_DATA));

                return true;

            case R.id.current_day:
                // Let the user pick the date
                FragmentDatePicker datePicker = new FragmentDatePicker();
                datePicker.configure(mCurrentDay, mDate, mDateFormat);
                datePicker.show(getSupportFragmentManager(), "datePicker");

                return true;

            case R.id.next_day:
                // Add one day
                mDate.add(Calendar.DAY_OF_MONTH, 1);

                // Update date in toolbar
                mCurrentDay.setTitle(mDateFormat.format(mDate.getTime()));

                // Update data and graphs
                EventBus.getDefault().post(new CommunicationManager.Request(CommunicationManager.RequestType.GET_DATA));

                return true;

            default:
                // If we got here, the user's action was not recognized.
                // Invoke the superclass to handle it.
                return super.onOptionsItemSelected(item);
        }
    }

    @Override
    public void onBackPressed() {
        // If not on summary, get back to it, else let superclass handle it
        if(mViewPager.getCurrentItem() != Tabs.SUMMARY) {
            mViewPager.setCurrentItem(Tabs.SUMMARY);
        } else {
            super.onBackPressed();
        }
    }

    @Subscribe
    public void handleLatestData(CommunicationManager.LatestDataReady event) {
        if(mFirstDateChange) {
            try {
                JSONObject data = event.response.getJSONObject("data");

                // Switch to latest data date
                SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
                inputDateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
                mDate.setTime(inputDateFormat.parse(data.getString("datetime")));
                mDate.setTimeZone(TimeZone.getDefault());

                // Set everything more specific than day to zero
                mDate.set(Calendar.HOUR_OF_DAY, 0);
                mDate.set(Calendar.MINUTE, 0);
                mDate.set(Calendar.SECOND, 0);
                mDate.set(Calendar.MILLISECOND, 0);

                // Update date in toolbar
                if (mCurrentDay != null) {
                    // May be null if called before onPrepareOptionsMenu, onPrepareOptionsMenu will update
                    // the date for us in this case
                    mCurrentDay.setTitle(mDateFormat.format(mDate.getTime()));
                }

                // Only switch the toolbar date once
                mFirstDateChange = false;

                // Update graphs
                EventBus.getDefault().post(new CommunicationManager.Request(CommunicationManager.RequestType.GET_DATA));
            } catch (NullPointerException | JSONException | ParseException e) {
                Snackbar.make(mViewPager, getString(R.string.reception_summary_error), Snackbar.LENGTH_LONG).show();
            }
        }

        if(mFirstConfigLoad) {
            try {
                // Parse and store configuration from the server
                JSONObject config = event.response.getJSONObject("configuration");

                SharedPreferences sharedPreferences = PreferenceManager.getDefaultSharedPreferences(this);
                SharedPreferences.Editor editor = sharedPreferences.edit();

                Iterator<String> it = config.keys();
                while (it.hasNext()) {
                    String key = it.next();

                    switch (mServerConfig.get(key)) {
                        case "int":
                            editor.putInt(key, config.getInt(key));
                            break;
                        case "string":
                            editor.putString(key, config.getString(key));
                            break;
                    }
                }
                editor.apply();

                // Only update the local configuration once
                mFirstConfigLoad = false;
            } catch (NullPointerException | JSONException e) {
                Snackbar.make(mViewPager, getString(R.string.reception_summary_error), Snackbar.LENGTH_LONG).show();
            }
        }

        try {
            JSONArray commands = event.response.getJSONArray("commands");

            // Search last watering
            for(int i = 0; i < commands.length(); i++) {
                JSONObject command = commands.getJSONObject(i);
                if(command.getString("type").equals("water")) {
                    // Date and Time
                    SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
                    inputDateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));

                    mWaterDate = GregorianCalendar.getInstance();
                    mWaterDate.setTime(mDateFormat.parse(command.getString("datetime")));
                    mWaterDate.setTimeZone(TimeZone.getDefault());

                    // Set everything more specific than day to zero
                    mWaterDate.set(Calendar.HOUR_OF_DAY, 0);
                    mWaterDate.set(Calendar.MINUTE, 0);
                    mWaterDate.set(Calendar.SECOND, 0);
                    mWaterDate.set(Calendar.MILLISECOND, 0);
                }
            }
        } catch (NullPointerException | JSONException | ParseException e) {
            Snackbar.make(mViewPager, getString(R.string.reception_summary_error), Snackbar.LENGTH_LONG).show();
        }
    }

    class Tabs {
        public static final int SUMMARY = 0;
        public static final int WATER_LEVEL = 1;
        public static final int TEMPERATURE = 2;
        public static final int SOIL_MOISTURE = 3;
        public static final int LUMINOSITY = 4;
        public static final int CONFIGURATION = 5;
    }

    /**
     * A {@link FragmentPagerAdapter} that returns a fragment corresponding to
     * one of the sections/tabs/pages.
     */
    public class SectionsPagerAdapter extends FragmentPagerAdapter {
        public SectionsPagerAdapter(FragmentManager fm) {
            super(fm);
        }

        @Override
        public Fragment getItem(int position) {
            // getItem is called to instantiate the fragment for the given page.
            switch (position) {
                case Tabs.SUMMARY:
                    return new TabFragmentSummary();
                case Tabs.WATER_LEVEL:
                    return new TabFragmentWaterLevel();
                case Tabs.TEMPERATURE:
                    return new TabFragmentTemperature();
                case Tabs.SOIL_MOISTURE:
                    return new TabFragmentSoilMoisture();
                case Tabs.LUMINOSITY:
                    return new TabFragmentLuminosity();
                case Tabs.CONFIGURATION:
                    return new TabFragmentConfiguration();
                default:
                    return null;
            }
        }

        @Override
        public int getCount() {
            // Show 5 total pages.
            return 6;
        }
    }

    // Hide date if on Summary and Configuration tabs, update icons transparency
    private void updateToolbarAndTablayout(int position) {
        if(position == Tabs.SUMMARY || position == Tabs.CONFIGURATION) {
            // Hide date on Summary and Configuration tabs
            mPreviousDay.setVisible(false);
            mCurrentDay.setVisible(false);
            mNextDay.setVisible(false);
        } else {
            // Show date on others
            mPreviousDay.setVisible(true);
            mCurrentDay.setVisible(true);
            mNextDay.setVisible(true);
        }

        for(int i=0; i < mSectionsPagerAdapter.getCount(); i++) {
            if(i == position) {
                mTabLayout.getTabAt(i).getIcon().setAlpha(255);
            } else {
                mTabLayout.getTabAt(i).getIcon().setAlpha(160);
            }
        }
    }

    // Switch to the good tab when the user press on a CardView
    public void cardClick(View v) {
        switch(v.getId()) {
            case R.id.water_level_card:
                mViewPager.setCurrentItem(Tabs.WATER_LEVEL);
                break;
            case R.id.temperature_card:
                mViewPager.setCurrentItem(Tabs.TEMPERATURE);
                break;
            case R.id.soil_moisture_card:
                mViewPager.setCurrentItem(Tabs.SOIL_MOISTURE);
                break;
            case R.id.luminosity_card:
                mViewPager.setCurrentItem(Tabs.LUMINOSITY);
                break;
            case R.id.last_watering_card:
                if(mWaterDate != null) {
                    mDate.setTime(mWaterDate.getTime());

                    // Update date in toolbar
                    mCurrentDay.setTitle(mDateFormat.format(mDate.getTime()));

                    // Update data and graphs
                    EventBus.getDefault().post(new CommunicationManager.Request(CommunicationManager.RequestType.GET_DATA));
                }
                mViewPager.setCurrentItem(Tabs.SOIL_MOISTURE);
                break;
        }
    }

    // Water plant
    public void waterPlant(View v) {
        SharedPreferences sharedPreferences = PreferenceManager.getDefaultSharedPreferences(this);
        long time = (sharedPreferences.getLong("block_water_command_until", 0) - Calendar.getInstance().getTimeInMillis())/1000;

        if(time > 0) {
            long hours = time / 3600;
            long minutes = (time % 3600 ) / 60;
            long seconds = (time % 3600 ) % 60;

            Snackbar.make(mViewPager, String.format(getString(R.string.command_water_wait), hours, minutes, seconds), Snackbar.LENGTH_LONG).show();
            return;
        }

        SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");

        Calendar datetime = Calendar.getInstance();
        datetime.setTimeZone(TimeZone.getTimeZone("UTC"));

        HashMap<String, Object> command = new HashMap<>();
        command.put("type", "water");
        command.put("status", "new");
        command.put("datetime", outputDateFormat.format(datetime.getTime()));

        HashMap<String, Object> commands = new HashMap<>();
        commands.put("commands", command);

        JSONObject jsonRequest = new JSONObject(commands);
        EventBus.getDefault().post(new CommunicationManager.Request(CommunicationManager.RequestType.POST_CONF_AND_COMMANDS, jsonRequest, "command.water"));
    }

    // Send configuration change to server if needed
    public void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String key) {
        if(mServerConfig.containsKey(key)) {
            HashMap<String, Object> option = new HashMap<>();
            switch(mServerConfig.get(key)) {
                case "int":
                    option.put(key, sharedPreferences.getInt(key, 0));
                    break;
                case "string":
                    option.put(key, sharedPreferences.getString(key, ""));
                    break;
            }

            HashMap<String, Object> configuration = new HashMap<>();
            configuration.put("configuration", option);

            JSONObject jsonRequest = new JSONObject(configuration);
            EventBus.getDefault().post(new CommunicationManager.Request(CommunicationManager.RequestType.POST_CONF_AND_COMMANDS, jsonRequest, "configuration." + key));
        }
    }


    @Subscribe
    public void handleConfAndCommandsData(CommunicationManager.ConfAndCommandsDataReady event) {
        if (event.hint.startsWith("configuration")) {
            if (event.response != null) {
                Snackbar.make(mViewPager, getString(R.string.configuration_updated), Snackbar.LENGTH_LONG).show();
            } else {
                Snackbar.make(mViewPager, getString(R.string.configuration_update_error), Snackbar.LENGTH_LONG).show();
            }
        } else if(event.hint.equals("command.water")) {
            if (event.response != null) {
                SharedPreferences sharedPreferences = PreferenceManager.getDefaultSharedPreferences(this);
                int time = Integer.decode(sharedPreferences.getString("sending_interval", "0"));

                SharedPreferences.Editor editor = sharedPreferences.edit();
                editor.putLong("block_water_command_until", Calendar.getInstance().getTimeInMillis() + time*1000);
                editor.apply();

                int hours = time / 3600;
                int minutes = (time % 3600 ) / 60;
                int seconds = (time % 3600 ) % 60;

                Snackbar.make(mViewPager, String.format(getString(R.string.command_water_sent), hours, minutes, seconds), Snackbar.LENGTH_LONG).show();
            } else {
                Snackbar.make(mViewPager, getString(R.string.command_water_error), Snackbar.LENGTH_LONG).show();
            }
        }
    }
}
