package collerction.arraylist;

import java.util.ArrayList;
import java.util.Iterator;

import collerction.Member;

public class MemberArrayList {
	
	private ArrayList<Member> arrayList;
	
	public MemberArrayList() {
		arrayList = new ArrayList<>();
	}
	
	public void insertMember(Member m, int index) {
		arrayList.add(index, m);
	}	
	
	public void addMember(Member m) {
		arrayList.add(m);
	}
	
	public boolean removeMember(int memberId) {
		
		//1번째 방법
		for(int i =0; i < arrayList.size(); i++) {
			Member member = arrayList.get(i);
			int tempId = member.getMemberId();
			if(tempId == memberId) {
				arrayList.remove(member);
				return true;
			}
		}
		
		//2번째 방법
		Iterator<Member> ir = arrayList.iterator();
		while (ir.hasNext()) {
			Member member = ir.next();
			int tempId = member.getMemberId();
			if(tempId == memberId) {
				arrayList.remove(member);
				return true;
			}
		}
		
		System.out.println(memberId + "가 존재하지 않습니다");
		return false;
			
	}
	
	public void showAllMembers() {
		for(Member m: arrayList) {
			System.out.println(m);
		}
		System.out.println();
	}
	

}
