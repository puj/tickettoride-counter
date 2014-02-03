package com.puj.tickettoride;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.app.ActionBarActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

public class MainActivity extends ActionBarActivity {

	private PlaceholderFragment placeholderFragment;

	@Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        if (savedInstanceState == null) {
			placeholderFragment = new PlaceholderFragment();
			getSupportFragmentManager().beginTransaction()
                    .add(R.id.container, placeholderFragment)
                    .commit();
        }
    }


	public void onClick(View v) {
		placeholderFragment.onClick(v);
	}

    /**
     * A placeholder fragment containing a simple view.
     */
    public static class PlaceholderFragment extends Fragment  {

		private TextView mainScoreView;
		private TextView mainTrainCarCountView;
		private TextView mainTrainCountView;
		private TextView mainCellUndo;

		public PlaceholderFragment() {
        }

        @Override
        public View onCreateView(LayoutInflater inflater, ViewGroup container,
                Bundle savedInstanceState) {
            View rootView = inflater.inflate(R.layout.fragment_main, container, false);

			mainScoreView = (TextView) rootView.findViewById(R.id.mainScore);
			mainTrainCarCountView = (TextView) rootView.findViewById(R.id.mainTrainCarCount);
			mainTrainCountView = (TextView) rootView.findViewById(R.id.mainTrainCount);
			mainCellUndo = (TextView) rootView.findViewById(R.id.mainCellUndo);

            return rootView;
        }

		public void onClick(View v) {
			TicketToRideScoreKeeper scoreKeeper = TicketToRideScoreKeeper.getInstance();
			switch(v.getId()){
				case R.id.mainCell1:
					scoreKeeper.add(1);
					break;
				case R.id.mainCell2:
					scoreKeeper.add(2);
					break;
				case R.id.mainCell3:
					scoreKeeper.add(3);
					break;
				case R.id.mainCell4:
					scoreKeeper.add(4);
					break;
				case R.id.mainCell5:
					scoreKeeper.add(5);
					break;
				case R.id.mainCell6:
					scoreKeeper.add(6);
					break;
				case R.id.mainCellUndo:
					scoreKeeper.undo();
					break;
				case R.id.mainCellClear:
					scoreKeeper.clear();
					break;
			}
			updateViews();
		}

		private void updateViews() {
			TicketToRideScoreKeeper scoreKeeper = TicketToRideScoreKeeper.getInstance();
			mainScoreView.setText(String.format("%d Points", scoreKeeper.getTotalNumPoints()));
			mainTrainCountView.setText(String.format("%d trains", scoreKeeper.getNumLaidTrains()));
			int laidCars = scoreKeeper.getNumLaidCars();
			mainTrainCarCountView.setText(String.format("%d train cars (%d left)", laidCars, 45-laidCars));
		}
	}

}
