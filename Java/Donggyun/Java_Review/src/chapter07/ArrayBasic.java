package chapter07;

public class ArrayBasic {

	public static void main(String[] args) {
		
		// 배열
		// 자료를 순차적 배치
		// -> index
		// 2차원 : 세로 축 : column(열), 가로 축 : row(행)
		// -> 1행 짜리 자료.
		
		// 연산자 []
		int[] studentIds = new int[] {101, 102, 103};
		int[] studentIds2 = {101, 102, 103};
		int[] studentIds3 = new int[100];
		
		System.out.println(studentIds.length);
		System.out.println(studentIds2.length);
		System.out.println(studentIds);
		System.out.println(studentIds2);
		
		// 처음주소 마지막 주소
		
		System.out.println(studentIds[0]);
		System.out.println(studentIds[studentIds.length-1]);
		

	}

}
