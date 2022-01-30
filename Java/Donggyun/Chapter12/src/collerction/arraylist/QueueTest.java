package collerction.arraylist;

import java.util.ArrayList;

import collerction.Member;

class MyQueue {
	
	private ArrayList<Member> arrayQueue = new ArrayList<>();
	
	public void enQueue(Member data) {
		arrayQueue.add(data);
	}
	
	public Member deQueue() {
		int len = arrayQueue.size();
		if(len == 0) {
			System.out.println("큐가 비었습니다");
			return null;
		}
		
		return(arrayQueue.remove(0));
	}
	
}

public class QueueTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		MyQueue queue = new MyQueue();
		queue.enQueue(new Member(1, "홍길동"));
		queue.enQueue(new Member(1, "이겨라"));
		queue.enQueue(new Member(1, "존버"));
		
		System.out.println(queue.deQueue());
		System.out.println(queue.deQueue());
		System.out.println(queue.deQueue());
		

	}

}
