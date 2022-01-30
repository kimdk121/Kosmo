package exam0518;
import java.util.Scanner;

public class calc {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		System.out.println("숫자를 입력하세요");
		int num1 = sc.nextInt();
		System.out.println("연산자를 입력하세요");
		String operator = sc.next();
		System.out.println("숫자를 입력하세요");
		int num2 = sc.nextInt();
		
		switch(operator) {
			case "+" : 
					 System.out.println(num1 + " + " + num2 + " = " + (num1+num2));
					 break;
			
			case "-" : 
			 		 System.out.println(num1 + " - " + num2 + " = " + (num1-num2));
			 		 break;
				
			case "*" : 
			 		 System.out.println(num1 + " * " + num2 + " = " + (num1*num2));
	 		  		 break;
				
			case "/" :
			  		 System.out.println(num1 + " / " + num2 + " = " + (num1/num2));
	 		  		 break;
	 		
	 		default : System.out.println("다시 입력하세요"); 
	 				  break;
		

		}

	}
}
