package chapter11;

public class StringTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String str1 = new String("abc");
		String str2 = "abc";
		String str3 = "abc";
		
		System.out.println(str1);
		System.out.println(str2);
		System.out.println(str3);
		
		str2 = "efg";
		System.out.println(str2);
		System.out.println(str3);
		
		String str4 = "하나둘셋";
		System.out.println(str4.charAt(0));
		System.out.println(str4.charAt(1));
		System.out.println(str4.charAt(2));
		System.out.println(str4.charAt(3));
		
		System.out.println("");
		
		System.out.println(str4.length());
		
		int len = str4.length();
		for (int i = 0; i < len; i++) {
			System.out.println(str4.charAt(i));
			
			
			System.out.println(str4.equals(str2));
			System.out.println(str1.equals(str3));
			System.out.println(str3.equals("abc"));
		
/*
			if ( str3.equals("abc")) {
				//
			}
			
			if ( "abc".equals(str3)) {
				//
			}
			
			String str5;
			if( str5.equals("abc")) {
				//
			}
			if( "abc".equals(str5)) {
				//
			}
	
*/			
			String[] strs = "하 나 두 ㄹ ㅅ ㅔ 넷".split(" ");
			System.out.println(strs.length);
			
			System.out.println(strs[0]);
			System.out.println(strs[6]);
			
			
			for (int j = 0; j < len; j++) {
				System.out.println(strs[j]);
			}
			System.out.println("------- substring --------");
			System.out.println("하 나 두 ㄹ ㅅ ㅔ 넷".substring(2,5));
		}

	}

}
