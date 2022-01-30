package chapter06;

public class Person {
	
	String name;
	String job;
	int age;
	String gender;
	String blood;
	
//	Person() {
//		this("이름없음",1,"ㅇ","ㅇ","ㅇ");		
//	}
	Person() {
		this("최승희",45,"여","A","의사");
	}

	
	Person(String name, int age) {
		this.name = name;
		this.age = age;
	}
	
	Person(String name, int age, String gender, String blood, String job) {
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.blood = blood;
		this.job = job;
	}
	public void play() {
		String play = "";
		if(this.job.equals("의사")) {
			play = "진료한다";
		} else {
			play = " ... ";
		}
		System.out.println(this.job + "는 " + play);

	}
}
