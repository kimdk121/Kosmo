package chapter10;

public class Circle implements Drawable{
	int x, y;
	double radius;
	String[] colors = {"RED", "GREEN", "BLUE", "BLACK", "WHITE"};
	public Circle(int x, int y, double radius) {
		this.x = x;
		this.y = y;
		this.radius = radius;
	}
	
	public void draw(int color) {
		System.out.printf("( %d, %d) 위치에 반지름  %f, 원의 색깔 %s인 원을 그립니다. \n", x, y, radius, colors[color - 1]);
	}
	
	public double getRadius() { return radius; }
	public int getX() { return x; }
	public int getY() { return y; }

}
