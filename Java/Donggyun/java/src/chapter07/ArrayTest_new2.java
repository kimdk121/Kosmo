package chapter07;

public class ArrayTest_new2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		double[] data = new double[5];
		// 이런방식으로 바로 쓰지 말고!!
		for (int i =0; i < data.length; i++) {
			System.out.println(data[i]);
			System.out.println(data[i] + 1);
		}
		// 이렇게 전체 배열 크기만큼 초기화!!
		for (int i =0; i < data.length; i++) {
			data[i] = -1.0;
		}
		
		int index = 0;
		//추가
		data[0] = 10.0; index++;
		data[1] = 11.0; index++;
		data[2] = 0.5; index++;
		//삭제
		data[2] = -1.0; index--;
		
		System.out.println("배열 " + data.length + " 인덱스 : " + index);
		
		for (int i =0; i < index; i++) {
			System.out.println(data[i]);
		}

	}

}
