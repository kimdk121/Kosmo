package chapter07;

public class ArrayTest_new {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String[] testArray;
		testArray = new String[10];
		
		System.out.println(testArray[0]);
		
		for (int i = 0; i < testArray.length; i++) {
			System.out.println(testArray[i]);
		}
		
		try { System.out.println(testArray[0].concat("   "));
			
		} catch (Exception e) {
				System.out.println(e);
//				System.out.println(e.getMessage());
		} finally {
				System.out.println("항상 예외처리 후 할 일!!!!");
			
		}
		
		
		
		for (int i = 0; i < testArray.length; i++) {
			try {
				System.out.println(testArray[i].concat("   "));
				
			} catch (NullPointerException e) {
//				System.out.println(e);
//				System.out.println(e.getMessage());
			}
			
			
		}
		
		
		
		try {
			
		} catch (NullPointerException e) {
			// TODO: handle exception
		}
		
		try {
			
		} catch (NullPointerException | NumberFormatException e2) {
			// TODO: handle exception
		} finally {
			
		}
		
		
		try {
			
		} finally {
			// TODO: handle finally clause
		}
		


	}

}
