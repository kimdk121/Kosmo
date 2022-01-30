package chapter07;


class Book {
	String name;
	public Book(String n) {
		this.name = n;
	}
}

public class ArrayCopy1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] array1 = {10, 20, 30, 40, 50};
		int[] array2 = {1, 2, 3, 4, 5};
		
		
		
		try {
			System.arraycopy(array1, 1, array2, 0, 5);
		} catch (ArrayIndexOutOfBoundsException e) {
			
		}
		
		//전체복사
		System.arraycopy(array1, 0, array2, 0, array1.length);
		
		
		
		//array1을 array2로 복사   시작위치         복사개수
		System.arraycopy(array1, 0, array2, 0, 5);
		
		for (int i : array2) {
			System.out.println(i);
		}
		
		Book[] book1 = new Book[3];
		Book[] book2 = new Book[3];
		
		book1[0] = new Book("태백산맥");
		book1[1] = new Book("태백산맥");
		book1[2] = new Book("태백산맥");
		
		System.arraycopy(book1, 0, book2, 0, book2.length);

	}

}
