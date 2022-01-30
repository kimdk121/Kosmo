package ex.java.input;

public class InputParameter2 {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//System.out.println("program " + args.length);
		
		int a = Integer.parseInt(args[0]);
		int b = Integer.parseInt(args[1]);
		int c = Integer.parseInt(args[2]);
		
		System.out.println("sum : "+(a+b+c));
		System.out.println("avg : "+(a+b+c) /3);
		
		
		
		
	}	
}
