package chapter08.inherit;

public class CarMain {

	public static void main(String[] args) {
		
		Car car = new Car("k5",2000);
		car.run();
		
		CarAmbulance am = new CarAmbulance();
		am.run();
		am.siren();
		
		Car car2 = new CarAmbulance();
//		car2.siren();

	}

}
