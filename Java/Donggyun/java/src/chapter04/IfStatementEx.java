package chapter04;

public class IfStatementEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int age = 10;
		
		if( age >= 8 ) {
			System.out.println("8살 이상이네요.");
		}
		else {
				System.out.println("8살 이하 !!!");
			
		}
		
		
		
		int age2 = 10;
		
		if(( age >= 8 ) && ( age2 > 10 )) {
			System.out.println("8살 이상이네요");
		}
		
		else {
			System.out.println("8살이하");
		}

	}

}
