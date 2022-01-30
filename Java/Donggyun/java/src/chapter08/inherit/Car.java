package chapter08.inherit;

public class Car {
	
	
	protected String name;
	protected int cc;
	
	public Car() {
		this("이름없음",0);
	}
	
	public Car(String name, int cc) {
		this.name = name;
		this.cc = cc;
	}
	
	public void run() {
		System.out.println(this.name + " 달린다!");
	}

}
