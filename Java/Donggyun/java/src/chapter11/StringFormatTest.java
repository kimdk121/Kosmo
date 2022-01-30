package chapter11;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class StringFormatTest {

	public static void main(String[] args) {

		System.out.printf("%s [%d] %s [%d]", "홍길동", 100, "고길동", 200);
		System.out.println();
		
		String str = String.format("%s [%d] %s [%d]", "홍길동", 100, "고길동", 200);
		System.out.println(str);

		System.out.printf("%2$s %1$s", "홍길동", 100, "고길동", 200);
		System.out.println();
	
		System.out.println(String.format("%10d%10d", 12345, 67890));
		System.out.println(String.format("%,10d%,10d", 12345, -67890));
		
		
		//날짜 포맷팅
		String form = "yyyy년 mm월 dd일 hh시 mm분 ss초";
		SimpleDateFormat sdf = new SimpleDateFormat(form);
		
		//날짜
		Date dt = new Date();
		String now = dt.toString();
		System.out.println(now);
		System.out.println(sdf.format(dt));
		
		//숫자 포맷팅
		DecimalFormat df = new DecimalFormat("#,###.0");
		String result = df.format(1234459.99);
		System.out.println(result);

	}

}
