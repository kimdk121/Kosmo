package chapter04;

public class LoopBasic {

	public static void main(String[] args) {
		
		// while (조건식) { 코드블럭 }  Loop 만들때 사용
		// 1~10 자연수를 각각 더해서 합을 출력
		int num = 1;
		int sum = 0;
		
		while (num < 11) {
			sum += num;
			num++;
		}
		System.out.println(sum);
		
		// 1~10 짝수만
		num = 1;
		sum = 0;
		while (num < 11) {
			if(num%2 == 0) {
				sum += num;
			}
			num++;
		}
		System.out.println(sum);
		
		
		// do while
		num = 1;
		sum = 0;
		
		do {
			sum += num;
			num++;
		}
		while ( num < 11);
		
		System.out.println(sum);
		
		// 오류나도 1번은 무조건 실행되고 끝남
		num =1;
		sum =0;
		
		do {
			sum += num;
			num++;
		}
		while (num > 2 );
		
		System.out.println(sum);
		
		
		// for
		// 문자형 a-z 출력하시오
		char ch;
		for (int c = 65; c < 90; c++) {
			System.out.print((char)c);
		}
		
		for( int d = 2; d <= 9; d++) {
			for(int i = 1; i <= 9; i++) {
				System.out.printf( "%d * %d = %d ", d , i, d * i);
			}
		}
		
		// continue
		// 반복중 코드블럭 안에서 어떤 조건인 경우 처음 반복으로 돌아가는거
		// 1... 100 사이 홀수만 합!
		sum = 0;
		for(int i = 0; i <= 100; i++) {
			// 짝수 -> 다시 반복으로 돌아감
			if( i % 2 == 0) {
				continue;
			}
			sum += i;
		}
		
		
		
		
		// for each 향상된 for문
		//  - 컬렉션 객체 자체.
		// for(element(요소) : 컬렉션) { 코드블럭 }
		
		
		
		
		
		

	}

}
