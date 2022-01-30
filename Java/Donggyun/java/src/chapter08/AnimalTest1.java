package chapter08;

class Animal {
	public void move() {
		System.out.println("동물이 움직입니다.");
	}
}

class Human extends Animal {
	@Override
	public void move() {
		System.out.println("사람이 두 발로 걷습니다. ");
	}

	public void readBook() {
		System.out.println("사람이 책을 읽습니다. ");
	}
}

class Tiger extends Animal {
	@Override
	public void move() {
		System.out.println("호랑이가 네 발로 뜁니다. ");
	}

	public void hunting() {
		System.out.println("호랑이가 사냥을 합니다. ");
	}
}

class Eagle extends Animal {
	@Override
	public void move() {
		System.out.println("독수리가 하늘을 납니다 ");
	}

	public void flying() {
		System.out.print("독수리가 날개를 쭉 펴고 멀리 날아갑니다");
	}
}

public class AnimalTest1 {

	public static void main(String[] args) {
		AnimalTest1 aTest = new AnimalTest1();
		aTest.moveAnimal(new Human());  // Up - Casting
		aTest.moveAnimal(new Tiger());
		aTest.moveAnimal(new Eagle());

		aTest.moveAnimal(new Animal());

//		new Tiger().move();
//		new Human().move();
		
//		new Tiger().move();
//		
//		Tiger t = new Tiger();
//		t.move();
		
		
		
		
		Animal h1 = new Human();
		Animal a1 = new Animal();
		
		if( h1 instanceof Human) {
			System.out.println("Oh Human!");
		}
		
		if( h1 instanceof Animal) {
			System.out.println("Oh Animal!");
		}
		
		if( h1 instanceof Tiger ) {
			System.out.println("Oh Tiger!");
		}
		//
		if( a1 instanceof Human ) {
			System.out.println("Oh Human!");
		}
		
		if( a1 instanceof Animal ) {
			System.out.println("Oh Animal!");
		}
		
		
//		Animal a2 = new Tiger();
//		Human h2 = (Human)a2;
//		
		
		
		
	}

	public void moveAnimal(Animal animal) { // 매개 변수의 자료형이 상위 클래스
		animal.move(); // 재정의 된 메서드 호출
	}

}