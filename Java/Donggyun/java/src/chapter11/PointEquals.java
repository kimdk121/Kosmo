package chapter11;

class Point2 {
	private int x;
	private int y;
	
	public Point2(int x, int y) {
		this.x = x;
		this.y = y;
	}
	@Override
	public boolean equals(Object obj) {
		Point p = (Point)obj;
		if(this.x == p.x && this.y == p.y) {
			return true;
		}
		else
			return false;
	}
	
	@Override
	public int hashCode() {
		return x;
	}
}

public class PointEquals {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Point p1 = new Point(10, 10);
		Point p2 = new Point(10, 10);
		
		System.out.println(p1 == p2);
		System.out.println(p1.equals(p2));
		
		System.out.println(p1.hashCode());
		System.out.println(p2.hashCode());
		
		System.out.println(System.identityHashCode(p1));
		System.out.println(System.identityHashCode(p2));

	}

}
