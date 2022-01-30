package chapter11;

public class SystemPropertyEnvMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// getProperty()
		String osName = System.getProperty("os.name");
		String userName = System.getProperty("user.name");
		
		// getEnv()
		System.out.println("OS" + osName);
		System.out.println("User: " + userName);
		System.out.println( System.getProperty("user.dir"));
		System.out.println( System.getProperty("java.class.path"));
		
		System.getProperties().list(System.out);
		System.out.println( System.getenv("PATH"));

	}

}
