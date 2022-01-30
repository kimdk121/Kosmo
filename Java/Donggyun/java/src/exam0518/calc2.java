package exam0518;
import java.util.Scanner;

public class calc2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		
		String str = sc.nextLine();
		
		String[] cal = str.split(" ");
		
		for (int i =0; i< cal.length; i++) {
			System.out.print(cal[i]+" ");

		}
		
		int num1 = Integer.parseInt(cal[0]);
		int num2 = Integer.parseInt(cal[2]);
		System.out.println();
		
		switch(cal[1]) {
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
