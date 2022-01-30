package chapter11;

public class SystemTestMain {

	public static void main(String[] args) {
	
		//끝낼때 System.exit(0);
		long start = System.nanoTime();
		
		//동작
		int sum = 0;
		for(int i =0; i <= 100000000; i++) {
			sum += 1;
		}
		
		//끝 시점 시간
		long end = System.nanoTime();
		
		System.out.println("합 : " + sum);
		System.out.println("시간 : " + (end - start));

		

	}

}
