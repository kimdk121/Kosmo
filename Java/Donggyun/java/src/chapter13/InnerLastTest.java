package chapter13;

// outer class 외부클래스
public class InnerLastTest {
	
	public InnerLastTest() {
	}
	
	//익명(어나니머스) 클래스
	Object method2() {
		return new Object() {
			@Override
			public String toString() {
				return InnerLastTest.class.getName();
			}
		};
	}

	
	
	
	
//	메서드 내부 클래스
	void method() {
		class ABC {
			int a = 10;
//			static int b = 100;
			public ABC() {
				
			}
		}
		
		ABC abc = new ABC();
		abc.a = 1000;
	}
	
	// 인스턴스 내부 클래스
	public class InstanceInner {
		
		int abc;
		static final int a = 10;
	
		public InstanceInner() {
						
		}
		
		public void print() {
			abc = 1000;
			System.out.println(abc);
		}
	
	}
	
	// 정적 내부 클래스
	static class StaticInner {
		
		int abc;
		static int abcd = 100;
		
		public StaticInner() {
			
		}
		
		public void print() {
			System.out.println(abc);
			System.out.println(StaticInner.abcd);
		}
		
		static void info() {
//			System.out.println(abc); 스태틱이 아니라 접근불가
			System.out.println(abcd);
		}
	}
}
