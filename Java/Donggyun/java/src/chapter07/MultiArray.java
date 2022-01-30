package chapter07;

import java.util.Arrays;

public class MultiArray {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[][] arr = new int[2][3];
		
		System.out.println("행 : "+ arr.length);
		System.out.println("열 : "+ arr[0].length);
		System.out.println("열 : "+ arr[1].length);

		for(int i =0; i < arr.length; i++) {
			for (int j = 0; j <arr[0].length; j++) {
				arr[i][j] = 1; //행x열
			}
		}
		for(int i =0; i < arr.length; i++) {
			for (int j = 0; j <arr[0].length; j++) {
				System.out.println(arr[i][j]);
			}
		}
		
		//System.out.println(Arrays.toString(arr));
		
	}
}
