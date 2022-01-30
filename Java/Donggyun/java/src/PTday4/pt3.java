package PTday4;

import java.util.Scanner;

public class pt3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("숫자를 입력하세요");
		int num1 = sc.nextInt();
		System.out.println("숫자를 입력하세요");
		int num2 = sc.nextInt();
		System.out.println("숫자를 입력하세요");
		int num3 = sc.nextInt();
		
		
		
		if ((num1 <= 0) || (num2 <=0) || (num3 <=0)) {
			System.out.println("안녕~");
		}
		else {
			System.out.println("sum : "+(num1+num2+num3));
			System.out.println("avg : "+(num1+num2+num3)/3);
		}
		

	}

}
