package visang.timple.util;

import java.util.Random;

public class Encryption {
	
	private static final int NEW_PW_LEN = 10;
	private static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#$%^&*";

	public static String createPw() {

		Random rnd = new Random();
		StringBuilder sb = new StringBuilder(NEW_PW_LEN);
		
		for (int i = 0; i < NEW_PW_LEN; i++) {
			sb.append(AB.charAt(rnd.nextInt(AB.length())));
		}
		
		return sb.toString();
	}
}
