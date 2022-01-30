package chapter03;

import java.util.Scanner;

public class ScannerOperationPt {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner scanner = new Scanner(System.in);
		
		int num1 = scanner.nextInt();
		int num2 = scanner.nextInt();
		int num3 = scanner.nextInt();
		
		int a = (num1 + num2 + num3);
		int b = (num1 + num2 + num3)/3 ;
		
		System.out.println("sum : " + a);
		System.out.println("avg : " + b);

	}

}
