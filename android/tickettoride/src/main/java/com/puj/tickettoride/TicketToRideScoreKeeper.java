package com.puj.tickettoride;

import java.util.LinkedList;

/**
 * Created by van on 2/3/14.
 */
public class TicketToRideScoreKeeper {
	private static TicketToRideScoreKeeper instance;

	private LinkedList<Integer> turns = new LinkedList<Integer>();
	private LinkedList<Integer> savedTurns = new LinkedList<Integer>();


	public static TicketToRideScoreKeeper getInstance(){
		if(instance == null){
			instance = new TicketToRideScoreKeeper();
		}
		return instance;
	}

	public void add(int numCars){
		if(45 - getNumLaidCars() - numCars >= 0){
			turns.addLast(numCars);
		}
	}

	public void undo(){
		if(turns.isEmpty()){
			if(savedTurns != null){
				turns = savedTurns;
				savedTurns = null;
			}
		}else{
			turns.removeLast();
		}
	}

	public void clear(){
		savedTurns = new LinkedList<Integer>();
		savedTurns.addAll(turns);
		turns.clear();
	}

	public int getTotalNumPoints(){
		int sum = 0;
		for(Integer i : turns){
			sum+=getScoreForNumCars(i);
		}
		return sum;
	}

	private static int getScoreForNumCars(Integer i) {
		switch (i){
			case 1:
				return 1;
			case 2:
				return 2;
			case 3:
				return 4;
			case 4:
				return 7;
			case 5:
				return 10;
			case 6:
				return 15;
		}
		return 0;
	}

	public int getNumLaidCars(){
		int sum = 0;
		for(Integer i : turns){
			sum+=i;
		}
		return sum;
	}

	public int getNumLaidTrains(){
		return turns.size();
	}
}
