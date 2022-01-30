package collerction.arraylist;

import java.util.ArrayList;

import collerction.Member;

class MyStack {
	
	private ArrayList<Member> arrayStack = new ArrayList<>();
			
	public void push(Member m) {
		arrayStack.add(m);
	}
	
	public Member pop() {
		int len = arrayStack.size();
		if(len == 0) {
			System.out.println("스택이 비었습니다");
			return null;
		}
		return(arrayStack.remove(len-1));
	}
}

public class StackTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MyStack stack = new MyStack();
		stack.push( new Member(1, "홍길동"));
		stack.push( new Member(2, "이겨라"));
		stack.push( new Member(3, "존버"));
		
		System.out.println(stack.pop().getMemberName());
		System.out.println(stack.pop().getMemberName());
		System.out.println(stack.pop().getMemberName());

	}

}
