package exam0518;

import java.util.Scanner;

public class pt {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		int s = sc.nextInt();
		int check = 0;
		for (int i =2; i<=s; i++) {
			for(int j=2; j<=i; j++) {
				if(i%j == 0) {
					check++;
				}
			}
			if(check ==1) {
				System.out.print (i + " ");
				check = 0;
			}
			else {
				check = 0;
			}
		}

			
	}
}