package chapter15;

import java.util.Scanner;

public class ScannerTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		
		//java.lang : 패키지
		String s = new String();
		
		System.out.println("이름:");
		String name = scanner.nextLine();
		System.out.println("직업:");
		String job = scanner.nextLine();
		System.out.println("사번:");
		int num = scanner.nextInt();
		
		System.out.println(name);
		System.out.println(job);
		System.out.println(num);
		

	}

}
