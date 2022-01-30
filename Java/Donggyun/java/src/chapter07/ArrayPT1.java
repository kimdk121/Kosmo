package chapter07;

public class ArrayPT1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		int[] Array = {-12, 3, -9, 5, 8, -2, 0, -8, 3, 10};
		
		int big = Array[0];
		
		for(int i=0; i < Array.length; i++) {
			if( (i+1) == Array.length) break;
			if(big <= Array[i+1])
				big = Array[i+1];
		}
		System.out.println("Big : "+ big);
	}

}
