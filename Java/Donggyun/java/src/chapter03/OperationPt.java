package chapter03;

public class OperationPt {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int myAge = 23;
		int teacherAge = 38;
		
		boolean value = (myAge > 25);
		System.out.println(value);
		
		System.out.println(myAge <= 25);
		System.out.println(myAge == teacherAge);
		
		char ch;
		ch = (myAge > teacherAge) ? 'T' : 'F';
		
		System.out.println(ch);

	}

}
