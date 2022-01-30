package chapter09;

public class ComputerMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
//		Computer c1 = new Computer();
//		추상클래스는 인스턴스로 생성할 수 없음
		Computer c2 = new Desktop();
//		Computer c3 = new NoteBook();
		Computer c4 = new MyNoteBook();
		
		c2.display();
		c2.typing();
		
		c2.print();

	}

}
