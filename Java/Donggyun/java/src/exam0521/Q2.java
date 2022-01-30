package exam0521;

import java.util.Scanner;

public class Q2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		int Array[] = new int[100];
		int len = 0;
		
		for(int i = 0; i < 100; i++) {
			int n = sc.nextInt();
			
			if (n == 0)
				break;
			
			Array[i] = n;
			len++;
		}
		
		for(int i = len -1; i>=0; i--) {
			System.out.print(Array[i] + " ");
		}

	}

}
