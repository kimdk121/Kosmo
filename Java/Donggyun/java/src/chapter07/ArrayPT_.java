package chapter07;

import java.util.Scanner;

public class ArrayPT_ {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		Scanner sc = new Scanner(System.in);
		String str = sc.nextLine();
		String[] strs = str.split(",");
		
		int big = 0;
		
		for(int i=0; i < strs.length; i++) {
			if( big < Integer.parseInt(strs[i])) {
				big = Integer.parseInt(strs[i]);
			}
		}
		System.out.println("Big : "+ big);
	}
}