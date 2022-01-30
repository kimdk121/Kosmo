package exam0518;
import java.util.Scanner;
public class Q2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		
		System.out.println("단을 입력하세요.");
		int num1 = sc.nextInt();
		
		for ( int i = 1; i <= 9; i++ ) {
			if(num1 % 2 == 0) {
				System.out.println(num1 + " * " + i + " = " + (num1 * i));
				continue;
			}
		}

	}

}