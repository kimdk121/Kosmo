package chapter11;
import chapter10.*;

class Book {
	int bookNumber;
	String bookTitle;
	
	Book(int bookNumber, String bookTitle) {
		this.bookNumber = bookNumber;
		this.bookTitle = bookTitle;
	}
		public String toString() {
			
			Class c = getClass();
			c.getName();
			
			return getClass().getName() + ":" 
					+ hashCode() + ":"
					+ Integer.toBinaryString(hashCode()) + ":"
					+ bookTitle + "," + bookNumber;
		
	}
}

public class ToStringEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Book book1 = new Book(200, "개미");
		
		System.out.println(book1);
		System.out.println(book1.toString());
		
		
		String str = new String("알고리즘");
		Integer i1 = new Integer(1000);
		System.out.println(str);
		System.out.println(i1);
		
		Drawable d = new Drawable() {
			
			@Override
			public void draw(int color) {
				// TODO Auto-generated method stub
				
			}
		};
		DrawableMain dm = new DrawableMain();
		System.out.println(d);
		System.out.println(dm);

	}

}
