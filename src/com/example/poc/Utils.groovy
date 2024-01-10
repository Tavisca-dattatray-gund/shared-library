package com.example.poc

class Utils {

    def toUpper(String text = '') {

        if (isEmpty(text)) {
            throw new IllegalArgumentException("Text should not be null or empty")
        }

        return text.toUpperCase();
    }

    static boolean isEmpty(String text) {
        return text == null || text.length() == 0
    }

    static void throwIfEmpty(String text, String message) {
        if (isEmpty(text))
            throw new IllegalArgumentException(message)
    }
}

