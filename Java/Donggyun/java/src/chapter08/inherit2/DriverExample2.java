package chapter08.inherit2;

import java.util.ArrayList;

public class DriverExample2 {
	public static void main(String[] args) {
		ArrayList<Vehicle> list = new ArrayList<Vehicle>();
		
		list.add(new Bus());
		list.add(new Taxi());
		list.add(new Bus());
		list.add(new Taxi());
		list.add(new Bus());
		
		Driver driver = new Driver();
		
		for (Vehicle vehicle : list) {
			driver.drive(vehicle);
		}
	}
}