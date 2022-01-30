package exam0521;

import java.util.Scanner;

public class Q4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		int Array[] = new int[10];
		
		while(true) {
			int n = sc.nextInt();
			
			if (n == 0)
				break;			
			Array[n/10] += 1;
		}
		for (int i = 0; i < Array.length; i++) {
			if(Array[i] == 0)
				continue;
			System.out.println(i + " : " + Array[i]);
			
		}
		
	}

}
