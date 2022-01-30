package PTday4;

import java.util.Scanner;

public class pt2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		int num = sc.nextInt();
		if((num == 0) || num <0 ) {
			System.out.println("양수를 입력하세요");
		}
		else {
			System.out.println(num);
		}

	}

}
