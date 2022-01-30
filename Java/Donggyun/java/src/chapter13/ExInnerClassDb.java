package chapter13;

public class ExInnerClassDb {
	
	public void retrieve(String table) {
		//DB table에서 data row fetch
		//제목, 저자, 청구번호
		
		class Book {
			String author;
			String title;
			String no;
			
			public Book(String a, String t, String n) {
				this.author = a;
				this.title = t;
				this.no = n;
						
			}
		}
//		String[] result = Db.fetch(table); // 제목, 저자, 청구번호
		String[] result = { "자바 원전", "고스링", "1000" };
		Book book = new Book(result[0], result[1], result[2]);
		
		if (book.title.contains("세상에...")) {
			
		}
	}	

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
