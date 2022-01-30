package chapter02;

public class DoubleEx1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		double dnum = 3.14;
		float fnum = 3.14F;
		
		System.out.println(dnum);
		System.out.println(fnum);
		
		// 마이너스
		double dnum2 = -3.14;
		float fnum2 = -3.14f;
		
		
		System.out.println(dnum2);
		System.out.println(fnum2);
		
		
		System.out.println("double2long : " + (long)dnum2);
		System.out.println("double2int : " + (int)dnum2);
		System.out.println("double2short : " + (short)dnum2);
		System.out.println("double2byte : " + (byte)dnum2);
		
		
		int i1 = 32768;
		int i2 = 2147483647;
		int i3 = -2147483647;
		
		
		System.out.println("int i1 double : " + (double)i1);
		System.out.println("int i1 float : " + (float)i1);
		System.out.println("int i2 double : " + (double)i2);
		System.out.println("int i2 float : " + (float)i2);
		System.out.println("int i3 double : " + (double)i3);
		System.out.println("int i3 float : " + (float)i3);

		
		

		
	//	i1 = (int) b1;
	//	b1 = (boolean) i1;
		
	//	byte bt = 1;
	//	b1 = (boolean)bt;
	//	bt = (byte)b1;
	}

}
