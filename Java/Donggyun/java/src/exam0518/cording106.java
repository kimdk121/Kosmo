package exam0518;

import java.util.Scanner;

public class cording106 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		System.out.println("층을 입력하세요");
		int a = sc.nextInt();

		switch (a) {
				case 1 : 
					System.out.println(a+"층 약국입니다.");
						break;
				case 2 :
					System.out.println(a+"층 정형외과입니다.");
						break;
				case 3 :
					System.out.println(a+"층 피부과입니다.");
						break;
				case 4 :
					System.out.println(a+"층 치과입니다.");
						break;
				case 5 :
					System.out.println(a+"층 헬스 클럽입니다.");
						break;
				default : System.out.println("입력이 잘못되었습니다.") ;
		}

	}

}
