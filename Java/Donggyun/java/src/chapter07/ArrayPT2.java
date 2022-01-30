package chapter07;

import java.util.Scanner;

public class ArrayPT2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		String str = sc.nextLine();
		String[] strs = str.split(" ");
				
		for(int i =(strs.length -1); i>=0 ; i--) {
			System.out.print(strs[i]+ " ");

		}

	}

}
