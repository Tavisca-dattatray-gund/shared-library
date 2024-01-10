package com.example.poc

class Hello {
    String sayHello(String name) {
        Utils.throwIfEmpty(name, "Name is required!")
        return "Hello, $name"
    }
}
