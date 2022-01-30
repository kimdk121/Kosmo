package chapter02;

public class CharacterEx1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		char ch1 = 'A';					//char = 2byte  =  int
		System.out.println(ch1);		//문자출력
		System.out.println((int)ch1);	//문자에 해당하는 정수 값 출력
		
		char ch2 = 66;					//정수 값 대입
		System.out.println(ch2);		//정수 값에 해당하는 문자 출력
		
		int ch3 = 67;
		System.out.println(ch3);		//문자 정수 값 출력
		System.out.println((char)ch3);	//정수 값에 해당하는 문자 출력
		
		int ch4 = 7;
		System.out.println(ch4);		//문자 정수 값 출력
		System.out.println((char)ch4);	//정수 값에 해당하는 문자 출력

	}

}
