package collerction;

public class Member {
	
	private int memberId;
	private String memberName;
	
	public Member(int id, String name) {
		this.memberId = id;
		this.memberName = name;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return memberName + " 회원님의 아이디는 " + memberId + " 입니다.";
	}

	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return memberId;
	}

	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		if ( obj instanceof Member) {
			Member member = (Member)obj;
			if( this.memberId == member.memberId )
				return true;
			else
				return false;
		}
		return false;
	}
	
}
