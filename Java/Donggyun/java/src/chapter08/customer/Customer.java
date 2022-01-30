package chapter08.customer;

public class Customer {
	
	protected int customerID;
	protected String customerName;
	protected String customerGrade;
	int bonusPoint;
	double bonusRatio;
	
	public int getCustomerID() {
		return customerID;
	}


	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}


	public String getCustomerName() {
		return customerName;
	}


	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}


	public String getCustomerGrade() {
		return customerGrade;
	}


	public void setCustomerGrade(String customerGrade) {
		this.customerGrade = customerGrade;
	}

/*
	public Customer() {
		this(0, "");
	}
	
	
	public Customer(int customerID, String customerName) {
		customerGrade = "SILVER";
		bonusRatio = 0.01;
	}
*/	
	public Customer(int customerID, String customerName) {
		this.customerID = customerID;
		this.customerName = customerName;
		customerGrade = "SILVER";
		bonusRatio = 0.01;
		System.out.println("Customer(int, String) 생성자호출");
		
	}
	
	
	public int calcPrice(int price) {
		bonusPoint += price * bonusRatio;
		return price;
	}
	
	public String showCustomerInfo() {
		return customerID + customerName + " 님의 등급은 "  
				+ customerGrade + "이며, 보너스 포인트는"
				+ bonusPoint + "입니다.";
	}

}
