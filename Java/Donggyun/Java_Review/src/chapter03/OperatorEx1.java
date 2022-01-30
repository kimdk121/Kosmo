package chapter03;

public class OperatorEx1 {
	
	// 자바의 항
	// 단항 : ++,--자료형--,++
	// 이항 : 인수 [+/*-] 인수
	// 삼항 : 조건 ? 참값 : 거짓값

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 대입연산자 : 왼쪽 변수에 값을 대입
		int i = 0;
		int j;
		j = 10;
		j = i * 1000;
		
		// 부호연산자 : +, -
		j = 10;
		j = -10;
		
		// 삼항연산자 : 조건 ? 참값 : 거짓값
		// 조건식 : 대소 <, >, 동등 <=, >=
		int score = 90;
		int grade = (score > 80) ? 1 : 2;
		
		grade = (score > 80) ? 1 : (score < 70) ? 4 : 3;
		System.out.println("Score : " + score + " -> grade : " + grade);
		
		// 산술연산자
		System.out.println("+" + (3+3)); //출력문안에 연산은 괄호로
		System.out.println("3+3=" + 3+3);
		System.out.println("3*3=" + 3*3);
		System.out.println("3/3=" + 3/3);
//		System.out.println("3/0=" + 3/0);
		System.out.println("0/3=" + 0/3);
		System.out.println("92%3=" + 92%3);
		
		// 증감연산자
		score = 150; //증가 후 대입
		System.out.println("++score : " + (++score));
		score = 150; //대입 후 증가
		System.out.println("score++ : " + (score++));
		
		score = 150; 
		int r = ++score;
		System.out.println("score : " + (score) + "-> r : " + r);
		
		score = 150; 
		r = score++;
		System.out.println("score : " + (score) + "-> r : " + r);
		
		// 관계연산자
		// >, <, >=, <=, ==, !=
		// 비교 -> 결과가 참 / 거짓 boolean
		// 조건식 작성
		System.out.println(" 1 > 0 " + (1 > 0));
		System.out.println(" 1 < 0 " + (1 < 0));
		
		// 대등연산자 ==
		System.out.println(" 1 == 0 " + (1 == 0));
		
		// 객체의 대등
		System.out.println(" 홍 : " + System.identityHashCode("홍"));
		System.out.println(" 홍 == 홍 " + ( "홍" == "홍"));
		
		// 논리연산자
		// &&, ||, !
		
		System.out.println((5>3) && (5>2));
		System.out.println((5<3) && (5>2));
		
		System.out.println((5<3) || (5>2));
		
		System.out.println( !(5<3) );
		System.out.println( !true );
		
		// 복합대입.
		// 대입 + 연산자 : +=, -=, *=, /=, %=...
		// 시프트 복합 : >>=, <<=, >>>=,
		
		
	}

}
