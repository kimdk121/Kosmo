package chapter07;

import java.util.Scanner;

public class Morse {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		String[] morse = {
				".-","-...","-.-.","-..",".","..-.","--.",
				"....","..",".---","-.-",".-..","--","-.",
				"---",".--.","--.-",".-.","...","-","..-",
				"...-",".--","-..-","-.--","--.."
				} ;
		String result = "";
		System.out.println("대문자로 입력하세요");
		String str = sc.next();
		for (int i =0; i <str.length(); i++) {
			result += morse[str.charAt(i)-'A']+" ";
		}
		System.out.println("모스부호 : " + result);
		

	}

}
