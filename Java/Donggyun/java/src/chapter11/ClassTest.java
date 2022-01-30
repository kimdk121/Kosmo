package chapter11;

import java.lang.reflect.Method;

public class ClassTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//1
		String s = new String();
		Class c = s.getClass();
		Method[] m = c.getMethods();
		for(Method method : m) {
			System.out.println(method.getName());
		}
		
		//2
		c = String.class;
		c = EqualsTest.class;
		
		//3
		try {
			c = Class.forName("chapter11.ObjectCloneTest");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(c.getName());
		
//		ObjectCloneTest ct = (ObjectCloneTest)c.newInstance();
		try {
			ObjectCloneTest ct = (ObjectCloneTest)c.newInstance();
		} catch (InstantiationException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

}
