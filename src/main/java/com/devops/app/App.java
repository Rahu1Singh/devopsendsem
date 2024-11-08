package com.devops.app;

/**
 * Hello world!
 */
public class App {
    public static void main(String[] args) {
        String environment = System.getProperty("env", "default");
        System.out.println("Running in " + environment + " environment!!!");
    }
}
