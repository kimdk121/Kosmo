package chapter08.inherit;

public class CalculatorMain {

	public static void main(String[] args) {
		
		Calculator Calc = new Calculator();
		Calc.setOperand(10, 20);
		Calc.sum();
		Calc.avg();
		
		
		CalculatorSub Calc2 = new CalculatorSub();
		Calc2.setOperand(30, 20);
		Calc2.sum();
		Calc2.avg();
		Calc2.substract();
		

	}

}
