package config;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encrypt {

    public String getEnc(String pwd) {
        String result = "";
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(pwd.getBytes());
            byte[] digest = md.digest();

            StringBuffer sb = new StringBuffer();
            for (byte b : digest) {
                sb.append(String.format("%02x", b));
            }
            result = sb.toString();
            System.out.println(" result = " + result);

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return result;
    }

    private static final Encrypt instance = new Encrypt();

    private Encrypt() {
    }

    public static Encrypt getInstance() {
        return instance;
    }
}
