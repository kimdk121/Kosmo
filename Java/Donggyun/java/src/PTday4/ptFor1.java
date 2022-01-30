package PTday4;

import java.util.Scanner;

public class ptFor1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("단을 입력해주세요");
		int dan = sc.nextInt();
		
		for (int i =1; i <10; i++) {
			System.out.println(dan + " * " + i + " = "+ (dan*i));
		}

	}

}
