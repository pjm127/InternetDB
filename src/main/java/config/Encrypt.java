package config;

import repository.MemberRepository;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public class Encrypt {

    public String getSalt() {
        SecureRandom r = new SecureRandom();
        byte[] salt = new byte[20];
        r.nextBytes(salt);

        StringBuffer sb = new StringBuffer();
        for (byte b : salt) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();

    }

    public String getEnc(String pwd, String salt) {
        String result = "";
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update((pwd + salt).getBytes());
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


