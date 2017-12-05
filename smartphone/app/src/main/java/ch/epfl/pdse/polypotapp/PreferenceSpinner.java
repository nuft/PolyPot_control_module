package ch.epfl.pdse.polypotapp;

import android.content.Context;
import android.content.res.TypedArray;
import android.support.v7.preference.DialogPreference;
import android.support.v7.preference.PreferenceViewHolder;
import android.util.AttributeSet;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Spinner;

import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;

public class PreferenceSpinner extends DialogPreference implements AdapterView.OnItemSelectedListener {
    private Spinner mSpinner;

    private final int mArray;
    private String mPreviousValue;
    private String mValue;

    public PreferenceSpinner(Context context) {
        // Delegate to other constructor
        this(context, null);
    }

    public PreferenceSpinner(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public PreferenceSpinner(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        //setLayoutResource(R.layout.layout_preference);
        setWidgetLayoutResource(R.layout.preference_spinner);

        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.PreferenceSpinner);
        mArray = a.getResourceId(R.styleable.PreferenceSpinner_array, R.array.empty);
        a.recycle();
    }

    @Override
    public void onBindViewHolder(PreferenceViewHolder holder) {
        super.onBindViewHolder(holder);

        holder.itemView.setClickable(false);

        mSpinner = (Spinner) holder.findViewById(R.id.spinner);

        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(getContext(), mArray, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        mSpinner.setAdapter(adapter);

        mSpinner.setSelection(adapter.getPosition(mValue));

        mSpinner.setOnItemSelectedListener(this);
    }

    @Override
    public void onItemSelected(AdapterView<?> adapterView, View view, int pos, long id) {
        //TODO: more fluid experience
        View focus = view.findFocus();
        mSpinner.setFocusable(true);
        mSpinner.setFocusableInTouchMode(true);
        if(focus != null) {
            focus.requestFocus();
        }

        if(mPreviousValue == null) {
            mPreviousValue = mValue;
        }

        mValue = (String) adapterView.getItemAtPosition(pos);
        persistString(mValue);
    }

    @Override
    public void onNothingSelected(AdapterView<?> adapterView) {
    }

    @Override
    protected Object onGetDefaultValue(TypedArray a, int index) {
        return a.getString(index);
    }

    @Override
    protected void onSetInitialValue(boolean restorePersistedValue, Object defaultValue) {
        if (restorePersistedValue) {
            // Restore existing state
            mValue = this.getPersistedString("");
        } else {
            // Set default state from the XML attribute
            mValue = (String) defaultValue;
            persistString(mValue);
        }
    }

    @Override
    public void onAttached() {
        super.onAttached();
        EventBus.getDefault().register(this);
    }

    @Override
    public void onDetached() {
        super.onDetached();
        EventBus.getDefault().unregister(this);
    }

    @Subscribe
    public void handlePreferenceChange(ActivityMain.PreferenceChanged event) {
        if(event.key.equals(getKey())) {
            if(event.failed && mPreviousValue != null) {
                mValue = mPreviousValue;
                persistString(mValue);

                mPreviousValue = null;
                notifyChanged();
            } else if(!event.failed) {
                mPreviousValue = null;
            }
        }
    }
}