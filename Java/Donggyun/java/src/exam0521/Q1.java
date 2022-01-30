package exam0521;

import java.util.Scanner;


public class Q1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("자연수 3~10을 입력해주세요.");
		int n = sc.nextInt();
		
		char alphabet = 'A';
		
		for (int i= n; i > 0; i--) {
			if ((n <3) || (n >10)) {
				System.out.println("입력한 자연수는 범위를 벗어났습니다.");
				break;
			}
			for(int j=i; j>=1; j--) {
				System.out.print(alphabet);
				alphabet++;
				if(alphabet == 'Z'+1) alphabet = 'A';
			}
			System.out.println();
		}

	}

}
