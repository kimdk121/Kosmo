package chapter13;

public class InnerClassExample1 {
	
	private int outerHashCode;
	public String outerClassName;
	static boolean isOuter;

	
	class InnerClass {
		private int innerHashCode;
		public String innerClassName;
		static final boolean isInner = true;
		
		public InnerClass() {
			innerHashCode = System.identityHashCode(this);
			innerClassName = this.getClass().getName();
		}
	
	
	public void printOuterInfo() {
		System.out.println("Outer hash : " + outerHashCode);
		System.out.println("Outer name : " + outerClassName);
		System.out.println("It is outer class : " + isOuter);
	}
	public void printInnerInfo() {
		System.out.println("Inner hash : " + this.innerHashCode);
		System.out.println("Inner name : " + this.innerClassName);
		System.out.println("It is outer class : " + isInner);
	}

	}

	
	
	public InnerClassExample1() {
		outerHashCode = System.identityHashCode(this);
		outerClassName = this.getClass().getName();
		isOuter = true;
	}
	
	public static void main(String[] args) {
		InnerClassExample1 example = new InnerClassExample1();
		InnerClassExample1.InnerClass innerExample = example.new InnerClass();
		
		innerExample.printInnerInfo();
		System.out.println("-----------------");
		innerExample.printOuterInfo();
		
	}

}