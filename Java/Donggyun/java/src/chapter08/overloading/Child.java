package chapter08.overloading;

public class Child extends Parent {
	private int id;
	
	public Child(String name, int id) {
		super(name);
		this.name = name;
		this.id = id;
	}
	

	public void info() {
		System.out.println(super.name + "가족의 "
				+ this.name + " 입니다.");
	}

}