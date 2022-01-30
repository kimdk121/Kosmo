package chapter13;

public class InnerClassExample4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		InnerClassExample4 exam = new InnerClassExample4();
		System.out.println(exam.getName().toString());

	}
	
	public Object getName() {
		//return new MyObject();
		
		return new Object() {
			@Override
			public String toString() {
				return this.getClass().getName();
			}
		};
	}

}