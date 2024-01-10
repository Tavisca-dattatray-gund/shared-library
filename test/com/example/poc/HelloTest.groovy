package com.example.poc

import org.junit.jupiter.api.Test
import static org.junit.jupiter.api.Assertions.*

class HelloTest {

    Hello hello = new Hello()

    @Test
    void shouldSayHello() {
        String name = "India";
        String result = hello.sayHello("India");
        assertEquals("Hello, India", result)
    }

    @Test
    void shouldThrowAnExceptionForInvalidName() {
        assertThrows(IllegalArgumentException.class, () -> {
            hello.sayHello("")
            hello.sayHello(null)
        })
    }
}
