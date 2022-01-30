package chapter07;

import java.util.ArrayList;

public class ArrayListMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
//		ArrayList<Book> library = new ArrayList<Book>(); 같다
		ArrayList<Book> library1 = new ArrayList<>();
		
		library1.add( new Book("태백산맥"));
		library1.add( new Book("차령산맥"));
		library1.add( new Book("한라산맥"));
		library1.add( new Book("백두산맥"));
		library1.add( new Book("구로산맥"));

		System.out.println("Books size: " + library1.size());
		
		
		library1.remove(2);
		System.out.println("Books size: " + library1.size());
		
		System.out.println("Books2 : " + library1.get(2).name);
		System.out.println("Books3 : " + library1.get(3).name);
		
		for (Book b: library1) {
			
		}
		
		for (int i =0; i < library1.size(); i++) {
			System.out.println(library1.get(i).name);
		}

		

	}

}
