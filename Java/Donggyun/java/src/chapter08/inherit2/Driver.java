package chapter08.inherit2;

public class Driver {
	
	public void drive(Vehicle vehicle) {
		vehicle.run();
		
		((Bus)vehicle).info();
	}
}
