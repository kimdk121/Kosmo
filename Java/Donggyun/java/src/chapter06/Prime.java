package chapter06;

class Prime {
	int number; // 대상 수
	int[] primeNumbers;

	Prime() {
		primeNumbers = new int[1000];
		for (int i : primeNumbers) {
			primeNumbers[i] = -1;
		}
	}

	Prime(int t) {
		// this();
		primeNumbers = new int[1000];
		for (int i : primeNumbers) {
			primeNumbers[i] = -1;
		}
		number = t;
	}

	void setNumber(int i) {
		number = i;
	}

	boolean isPrime(int num) {
		for (int i = 2; i < num; i++) {
			if (num % i == 0)
				return false;
		}
		return true;
	}

	void primeNumber() {
		int index = 0;
		for (int i = 1; i <= number; i++) {

			if (isPrime(i)) { // 소수 일때만 값을 출력
				// System.out.print(i + " ");
				primeNumbers[index] = i;
				index++;
			}
		}
	}

	void print() {
		System.out.println(number + " 까지 소수는: ");
		for (int i : primeNumbers) {
			System.out.print(i);
		}
		System.out.println();
	}

}
