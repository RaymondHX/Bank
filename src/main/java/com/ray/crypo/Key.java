package com.ray.crypo;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class Key {

    private String privateKey;
    private String publicKey;

    public Key() throws Exception{
        this.publicKey = loadPublicKeyByFile();
        this.privateKey = loadPrivateKeyByFile();
    }
    public String getPrivateKey() {
        return privateKey;
    }

    public void setPrivateKey(String privateKey) {
        this.privateKey = privateKey;
    }

    public String getPublicKey() {
        return publicKey;
    }

    public void setPublicKey(String publicKey) {
        this.publicKey = publicKey;
    }

    /**
     * 从文件中输入流中加载公钥
     *
     * @throws Exception
     *             加载公钥时产生的异常
     */
    public static String loadPublicKeyByFile() throws Exception {
        try {
            BufferedReader br = new BufferedReader(new FileReader(
                     "E:\\mobanTest\\target\\mobanTest\\pk1.key"));
            String readLine = null;
            StringBuilder sb = new StringBuilder();
            while ((readLine = br.readLine()) != null) {
                sb.append(readLine);
            }
            br.close();
            return sb.toString();
        } catch (IOException e) {
            throw new Exception("公钥数据流读取错误");
        } catch (NullPointerException e) {
            throw new Exception("公钥输入流为空");
        }
    }
    /**
     * 从文件中加载私钥
     *
     * @return 是否成功
     * @throws Exception
     */
    public static String loadPrivateKeyByFile() throws Exception {
        try {
            BufferedReader br = new BufferedReader(new FileReader( "E:\\mobanTest\\target\\mobanTest\\sk.key"));
            String readLine = null;
            StringBuilder sb = new StringBuilder();
            while ((readLine = br.readLine()) != null) {
                sb.append(readLine);
            }
            br.close();
            return sb.toString();
        } catch (IOException e) {
            throw new Exception("私钥数据读取错误");
        } catch (NullPointerException e) {
            throw new Exception("私钥输入流为空");
        }
    }
}
