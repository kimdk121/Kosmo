package exam0518;
public class Q1e2 {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int num1 = 10;
		int num2 = 2;
		char operator = '+';
		
		switch(operator) {
			case '+' : 
					 System.out.println(num1 + " + " + num2 + " = " + (num1+num2));
					 break;
			
			case '-' : 
			 		 System.out.println(num1 + " - " + num2 + " = " + (num1-num2));
			 		 break;
				
			case '*' : 
			 		 System.out.println(num1 + " * " + num2 + " = " + (num1*num2));
	 		  		 break;
				
			case '/' :
			  		 System.out.println(num1 + " / " + num2 + " = " + (num1/num2));
	 		  		 break;
	 		
	 		default : break;
		}
	}
}