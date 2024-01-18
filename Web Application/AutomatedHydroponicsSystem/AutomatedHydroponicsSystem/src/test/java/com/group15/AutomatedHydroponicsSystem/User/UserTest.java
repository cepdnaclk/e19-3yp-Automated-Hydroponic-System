package com.group15.AutomatedHydroponicsSystem.User;


import org.junit.jupiter.api.*;



class UserTest {
    // To run only one time in the initial stage
    @BeforeAll
    static void beforeAll(){
        System.out.println("Before each and every test");
    }
//    // To initialize a few things we want
//    @BeforeEach
//    void setUp() {
//        System.out.println("Inside the before each method");
//    }
//
//    @AfterEach
//    void tearDown() {
//        System.out.println("Inside the after each method");
//    }

    @AfterAll
    static void afterAll(){
        System.out.println("After all the things get finished off");
    }

    @Test
    public void testMethod1(){
        System.out.println("My first test method");
    }
    @Test
    public void testMethod2(){
        System.out.println("My second test method");
    }

}