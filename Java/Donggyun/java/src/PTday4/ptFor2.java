package PTday4;

import java.util.Scanner;

public class ptFor2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		while(true) {
			System.out.println("단을 입력해주세요 -1은 종료");
			int dan = sc.nextInt();
			
			if(dan == -1) {
				System.out.println("끝~");
				break;
			}
			for (int i =1; i<10; i++) {
				System.out.println(dan + " * " + i + " = " + (dan*i));
			}
			
		}
			
			

	}

}
