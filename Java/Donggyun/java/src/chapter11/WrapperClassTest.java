package chapter11;

public class WrapperClassTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Integer i1 = new Integer(100);
		
		//박싱
		i1 = Integer.valueOf(100);
		i1 = Integer.valueOf("1000");
		
		//언박싱
		int i = i1.intValue();
		i = Integer.parseInt("100");
		
		Byte bt = Byte.valueOf("11");
		byte b = Byte.parseByte("11");
		
		Float ft = Float.valueOf("2.4F");
		
		//비교연산
		i1 = Integer.valueOf("1000");
		Integer i2 = Integer.valueOf("1000");
		
		if( i1.equals(i2))
			System.out.println("equal: 1000");
		if( i1 == i2)
			System.out.println("==: 1000");

	}

}
