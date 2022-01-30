package chapter11;

public class StringIndexing {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String str = "Java Programming";
		
		System.out.println(str.indexOf("J"));
		System.out.println(str.indexOf('P'));
		System.out.println(str.indexOf("gram"));
		
		//자르기
		System.out.println(str.substring(0, str.indexOf("gram")));
		System.out.println(str.lastIndexOf("n"));
		
		System.out.println(str.startsWith("Java"));
		System.out.println(str.startsWith("java"));
		
		//trim
		//Scanner -> 
		String str1 = "        하하하";
		String str2 = "호호호        ";
		String str3 = "    허허허    ";
		
		System.out.println(str1.trim());
		System.out.println(str2.trim());
		System.out.println(str3.trim());
		
	}

}
