package chapter03;

public class OperationEx2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int gameScore = 150;
		
		int lastScore1 = ++gameScore;
		System.out.println(gameScore+" ,"+lastScore1);
		
		int lastScore2 = --gameScore;
		System.out.println(gameScore+" ,"+lastScore2);
		
		int lastScore3 = gameScore++;
		System.out.println(gameScore+" ,"+lastScore3);
		
		int lastScore4 = gameScore++;
		System.out.println(gameScore+" ,"+lastScore4);
		

	}

}
