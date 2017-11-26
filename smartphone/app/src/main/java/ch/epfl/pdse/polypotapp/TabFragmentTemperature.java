package ch.epfl.pdse.polypotapp;

import android.icu.util.Calendar;
import android.os.Bundle;
import android.support.design.widget.Snackbar;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.github.mikephil.charting.charts.LineChart;

import org.json.JSONArray;
import org.json.JSONException;

public class TabFragmentTemperature extends Fragment{
    CommunicationManager.DataReadyListener mListener;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_temperature, container, false);
        return rootView;
    }

    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        final LineChart chart = (LineChart) view.findViewById(R.id.graph_temperature);
        final int color = getResources().getColor(android.R.color.holo_red_light);

        GraphHelper.configureChart(chart, color, 0, 30);

        CommunicationManager communicationManager = CommunicationManager.getInstance(getContext());
        mListener = new CommunicationManager.DataReadyListener() {
            public void onDataReady(JSONArray data, Calendar fromDate, Calendar toDate) {
                try {
                    GraphHelper.updateChartWithData(chart, color, "temperature", data, fromDate, toDate);
                } catch (final JSONException e) {
                    Snackbar.make(getView(), getString(R.string.error_reception_data), Snackbar.LENGTH_LONG).show();
                }
            }
        };

        communicationManager.addDataReadyListener("temperatureListener", mListener);
        communicationManager.getData();
    }
}

