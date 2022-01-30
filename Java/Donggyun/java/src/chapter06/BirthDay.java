package chapter06;

class BirthDay {
	int day;
	int month;
	int year;

	public void setYear(int year) {
		this.year = year;
	}

	public void printThis() {
		System.out.println(this);
	}
	
	public void test(int month) {
		this.month = month;
	}
	// P192 쪽: 지역변수, 멤버 변수
	public void test1(int j) {
		int month = 100;
		this.month = j;
		
		
	}
	
	
	
}