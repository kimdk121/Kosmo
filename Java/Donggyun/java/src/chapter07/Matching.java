package chapter07;

import java.util.Scanner;

public class Matching {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		String[] Array = {"곰돌이","복돌이","흰둥이","깨소금","까만콩"} ;
		String[] Match = {"Bear","Gift","White","Sesami","Black"} ;
		System.out.println("곰돌이,복돌이,흰둥이,깨소금,까만콩");
		String str = sc.next();
		
		for (int i = 0; i < Array.length; i++) {
			if (str.equals(Array[i])) {
				System.out.println(Match[i]);
				
			}
		}
	}

}
