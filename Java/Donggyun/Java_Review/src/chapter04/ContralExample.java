package chapter04;

public class ContralExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int age = 10;
		
		System.out.println((age >= 6));
		System.out.println((age <= 6));
		System.out.println((age & 6));
		
		if (age >= 6) {
			System.out.println("나이가 " + age);
		}
		if (age < 6) {
			System.out.println("나이가 " + age);			
		}
		else {
			System.out.println("다시");			
		}

		// p95
		char gender = 'F';
		System.out.println(gender);
		
		//F인지?
		if ( gender == 'F') {
			System.out.println("여성");
		}
		else {
			System.out.println("남성");
		}
		
		
		if ( gender == 70) {
			System.out.println("여성");
		}
		else {
			System.out.println("남성");
		}
		
		
		if ( gender != 70) {
			System.out.println("여성");
		}
		else {
			System.out.println("남성");
		}
		
		//조건식 : 이항 관계연산자 : <,>,<=,>=
		// 삼항연산자
		// 조건식 ? 참 : 거짓값
		System.out.println( (gender != 70 ? "남성" : "여성"));
		
		
		
		
		
		
		// 복합 if-else if-else
		age = 8;
		int charge = 0;
		
		if (age<8) {
			charge = 1000;
		}
		else if (age<14) {
			charge = 2000;
		}
		else if (age<20) {
			charge = 2500;
		}
		else {
			charge = 2500;
		}
			
		System.out.println( (age < 8 ? 1000 : (age < 14 ? 2000 : 2500)));
		
		// p100
		int score = 60;
		char grade = 'z';
		
		if (score > 90) {
			grade = 'A';			
		}
		else if (score > 80) {
			grade = 'B';
		}
		else if (score > 70) {
			grade = 'C';
		}
		else if (score > 60) {
			grade = 'D';
		}
		else {
			grade = 'F';
		}
		
		if (score >= 60 && score < 70) {
			grade = 'D';
		}
		else if (score >= 70 && score < 80) {
			grade = 'C';
		}
		else if (score >= 80 && score < 90) {
			grade = 'B';
		}
		else if (score >= 90 && score <= 100) {
			grade = 'A';
		}
		else {
			grade = 'F';
		}
		System.out.println("score : " + score + " -> " + grade);
		
		
		//Nested if
		// 95: A+ 90>: A
		String grd = "";
		
		if(score >= 90) {
			if(score >=95) {
				grd = "A+";
			}
			else {
				grd = "A";
			}
		}
		else {
			if(score>=85) {
				grd = "B+";
			}
			else {
				grd = "B";
			}
		}
		
		//switch-case
		int rank = 30;
		
		switch (rank) { // key값 : 숫자형(int,char) jdk 1.8 이상에선 string
			case 10:
				System.out.println("10");
				break;
			case 20:
				break;
			case 30:
				break;
			default:
				break;
		}
		
		//switch char
		grade = 'D';
		
		switch(grade) {
			case 'A':
			case 'a':
				System.out.println("AAAAA");
				break;
			case 'B':
			case 'b':
				System.out.println("BBBBB");
				break;
			default :
				System.out.println("FFFFF");
		}
		
		
		String position = "이사";
		switch (position) {
		case "과장":
			break;
		case "차장":
			break;
		case "이사":
			break;
		default:
			break;
		}
		
		
		int month = 1;
		String season = "";
		switch (month) {
			case 1 :
			case 2 :
			case 12 :
				season = "겨울";
				break;
			
			case 3 :
			case 4 :
			case 5 :
				season = "봄";
				break;
			
			case 6 :
			case 7 :
			case 8 :
				season = "여름";
				break;
				
			case 9 :
			case 10 :
			case 11 :
				season = "가을";
				break;
		}
		System.out.println(month + "월 계절은 " + season);
		
		
		
	}
	

}
