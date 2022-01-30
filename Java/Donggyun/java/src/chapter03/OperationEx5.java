package chapter03;

public class OperationEx5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int n1 = 5;
		int n2 = -5;
		
		System.out.println("5 << 2 = " + (n1 << 2) );
		System.out.println("5 << 3 = " + (n1 << 3) );
		
		System.out.println("5 >> 1 = " + (n1 >> 1) );
		System.out.println("5 >> 2 = " + (n1 >> 2) );
		System.out.println("5 >> 3 = " + (n1 >> 3) );
		
		System.out.println("-5 << 2 = " + (n2 << 2) );
		System.out.println("-5 << 3 = " + (n2 << 3) );
		
		System.out.println("-5 >> 1 = " + (n2 >> 1) );
		System.out.println("-5 >> 2 = " + (n2 >> 2) );
		System.out.println("-5 >> 3 = " + (n2 >> 3) );
		
		System.out.println("5 >>> 1 = " + (n1 >>> 1) );
		System.out.println("5 >>> 2 = " + (n1 >>> 2) );
		System.out.println("5 >>> 3 = " + (n1 >>> 3) );

		System.out.println("-5 >>> 1 = " + (n2 >>> 1) );
		System.out.println("-5 >>> 2 = " + (n2 >>> 2) );
		System.out.println("-5 >>> 3 = " + (n2 >>> 3) );
		
		System.out.println(Integer.toBinaryString(n2 >>> 1));
		
		
		

	}

}
