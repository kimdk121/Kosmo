
package chapter04;


import java.util.Scanner;

public class InputIfEx2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("숫자를 입력하세요");
		int a = scanner.nextInt();
		
		System.out.println("숫자를 입력하세요");
		int b = scanner.nextInt();
		
		System.out.println("숫자를 입력하세요");
		int c = scanner.nextInt();
				
		if ( ( a <= 0 ) || ( b <= 0 ) || ( c <= 0 ) ) {
			
			System.out.println("안녕");
		}
		else {
			System.out.println("sum : " + (a + b + c));
			System.out.println("avg : " + (a + b + c)/3);
		}
		
		

	}

}
