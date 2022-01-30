package exam0521;

import java.util.Scanner;

public class Q3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		System.out.println("숫자를 입력하세요");
		
		int n = sc.nextInt();
		
		for(int i=0; i < n; i++) {
			int num = 1;
			
			for(int z = n - 1 - i; z > 0; z--) {
				System.out.print("  ");
			}
			for(int j = 0; j < i + 1; j++) {
				System.out.print(num + " ");
				num++;
			}
			System.out.println();
		}
		
		

	}

}
