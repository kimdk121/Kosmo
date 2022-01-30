package chapter02;

public class CastingMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int inum2 = 20;
		float fnum = inum2; 
		
		// 묵시적 형변환 (Auto Boxing)
		// 대입, 연산.
		System.out.println("int : " + inum2 + " -> float : " + fnum);
		
		double dnum;
		dnum = fnum + inum2;
		System.out.println("int : " + inum2 + " -> float: " + fnum
							+ " -> double " + dnum);
	
		
		//명시적 형변환.
		//(자료형)자료 : 캐스팅 연산자.
		int inum3 = Byte.MAX_VALUE + 100;
		byte b = (byte) inum3; // 8bit -> 32bit
		System.out.println("int : " + inum3 + " -> byte : " + b);
		System.out.println("inum3 : " + Integer.toBinaryString(inum3)
				+ "\n" 
				+ " b: " + Integer.toBinaryString(b));
		
		
		byte b2 = 127;
		inum3 = (int)b2; // 8bit -> 32bit
		System.out.println("int : " + inum3 + " -> byte : " + b2);
		System.out.println("inum3 : " + Integer.toBinaryString(inum3)
				+ "\n" 
				+ " b: " + Integer.toBinaryString(b2));
		
		dnum = 3.14;
		inum3 = (int)dnum;
		System.out.println("double : " + dnum + " -> inum3 : " + inum3);
		
		// 큰 -> 작
		char ch = (char)inum3;
		System.out.println("inum3 : " + inum3 + " -> char : " + ch);
		
		//p68 연산중 형변환
		double dnum1 = 1.2;
		float fnum1 = 0.9F;
		
		inum3 = (int)dnum1 + (int)fnum1; //각 실수가 형변환 된 후 + 연산
										 //1.2 -> 1, 0.9 -> 0 1+0=1
		inum2 = (int)(dnum1 + fnum1); //실수 + 연산 후 형변환
									  //(1.2+0.9)=2.1 ->2
		
		System.out.println("inum3 : " + inum3 + " -> inum2 : " + inum2);
		
	}
}
