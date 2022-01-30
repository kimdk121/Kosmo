package chapter10;

public class DrawableMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Drawable[] drawables = new Drawable[] {
				new Circle(10, 20, 15),
				new Circle(30, 20, 10),
				new Rectangle(5, 8, 8, 9)};
		
		for(Drawable d : drawables) {
			d.draw(Drawable.RED);
		}

	}

}
