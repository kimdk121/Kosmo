package collerction.Map;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class HashMapTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("홍길동", 1);
		map.put("고길동", 2);
		map.put("이동형", 3);
		map.put("자라섬", 4);
		
		Iterator<String> il = map.keySet().iterator();
		
		while(il.hasNext()) {
			String key = il.next();
			Integer v = map.get(key);
			System.out.println(key + ":" + v);
		}

	}

}
