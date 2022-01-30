package exam0518;

import java.util.Scanner;

public class Fat {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		String exit = " ";
	
		while(true) {
		
		if(exit.equals("q") || exit.equals("-1")) {
			System.out.println("종료합니다");
			break;
		}
		
		System.out.println("키를 입력하세요");
		int cm = sc.nextInt();
		System.out.println("몸무게를 입력하세요");
		int kg = sc.nextInt();
		
		int sum = kg + 100 - cm ;
		
		if (sum>0) {
			System.out.println("비만수치 비만");
		}
		else 
			System.out.println("비만이 아닙니다.");
		}
		System.out.println("종료하려면 q 또는 -1");
		exit = sc.nextLine();
		
	}

}
	