package chapter12;

public class GenericBoxTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Box box = new Box();
		box.set("안녕");
		box.set( new Integer(100));
		
		String str = (String)box.get();
		
		Box2<String> box2 = new Box2();
		box2.set("안녕");
		str = box2.get();
		
		box2.set("안녕");
		str = box2.get();

	}
}


class Box {
	private Object obj;
	public void set(Object o) {
		this.obj = o;
	}
	public Object get() {
		return this.obj;
	}
}

class Box2<String> {
	private String str;
	
	public void set(String s) {
		this.str = s;
	}
	public String get() {
		return this.str;
	}
}