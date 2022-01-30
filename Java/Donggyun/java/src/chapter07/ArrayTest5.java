package chapter07;

import java.util.Arrays;
import java.util.Scanner;

public class ArrayTest5 {

	public static void main(String[] args) {
		/*
		 * 어떤 학교의 학생 과학/수학 시험 성적을 “학생/점수/점수” 순서로  
		 * 되었다. 학생이름이 ‘홍‘ 으로 시작하는 학생의 성적만 찾아 출력하시오.
		 */
		String[] student = new String[3];
		student[0] = "홍길동, 1020, 구로구"; //이름, 주소, 위
		student[1] = "김수달, 2190, 부산 기장구";
		student[2] = "정보량, 1001, 강원 홍천";
		System.out.println(Arrays.toString(student));

		Scanner sc = new Scanner(System.in);
				System.out.println("찾을 학생 성을 입력: ");
		String name = sc.next();
		int find_id = -1;
			
		for (int i = 0; i < student.length; i++) {
			String[] person = student[i].split("/");
			// 학생 찾기
			if( person[0].contains(name)) {
				 find_id = i;
				 break;
			}
		}
		
		System.out.println("--------------");
		System.out.println(student[find_id]);
		
		sc.close();
	}

}