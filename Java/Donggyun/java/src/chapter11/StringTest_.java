package chapter11;

public class StringTest_ {

	public static void main(String[] args) {
		String tmp = "abc";
			
		tmp.charAt(1);// 'b'를 반환 안에 들어가는 값은 index입니다. 앞에서부터 0 1 2 index 입니다.
		tmp.length(); //3을 반환 String의 길이를 반환합니다.

		tmp.equals("abc"); // true String 안의 내용이 같은지 비교합니다.

		tmp.compareTo("bcd"); // -1 사전순으로 앞서는지 뒷서는지 판단합니다. 앞서면 -1 같으면 0 뒤면 1을 return 합니다.

		tmp = tmp.replace('a','b'); //"bbc" string 안에 있는 'a' 라는 문자를 'b'라는 문자로 바꿉니다. "

		tmp = tmp.substring(0, 2); // "bb" 0번째 인덱스 부터 2-1 = 1 index까지 잘라서 새로운 String을 만듭니다.

		tmp = "a b c d";
		String[] tmpArr = tmp.split(" ");// split 함수의 안의 delimeter를 기준으로 하여 string을 잘라 String[] 배열에 담습니다.

		tmp = "              bc   ";
		tmp = tmp.trim(); // 문자열 앞뒤로 필요없는 whitespace 공백을 지웁니다.

		tmp = tmp.toUpperCase();// "BC" 문자를 대문자로 바꿉니다.

	}

}