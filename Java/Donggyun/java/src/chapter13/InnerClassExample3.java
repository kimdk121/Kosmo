package chapter13;

import java.util.Date;

public class InnerClassExample3 {

	public void printStatus() {
		//new DateFormat(new Date());
		//DateFormat format = DateFormat.getInstance().format(new Date());
		
		
				
		class DateFormat {
			private Date date;
			
			public DateFormat(Date date) {
				this.date = date;
			}
			public String getDateFormat() {
				return date.toString();
			}
		}
		DateFormat format = new DateFormat(new Date());
		System.out.println("The Date : " + format);
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		InnerClassExample3 example = new InnerClassExample3();
		example.printStatus();

	}

}
