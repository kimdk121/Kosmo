package PTday4;

import java.util.Scanner;

public class ptWhile1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		System.out.println("단을 입력하세요");
		int dan = sc.nextInt();
		int i = 1;
		while(i <10) {
			System.out.println(dan + " * "+ i + " = " + (dan*i));
			i++;
		}

	}

}
