package chapter11;

import java.util.StringTokenizer;

public class StringSplitTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String str = "Java Programming is funny things!";
		
		//split
		String[] result = str.split(" ");
		for(String s : result) {
			System.out.println(s);
		}

		str = "Java Programming is funny things!";
		
		//StringTokenizer
		StringTokenizer st = new StringTokenizer(str);
		while( st.hasMoreTokens()) {
			System.out.println(st.nextToken());
		}

	}

}
