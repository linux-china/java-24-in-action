package org.mvnsearch;

import java.util.List;
import java.util.stream.Collectors;

public class Main {
    public static void main(String... args) {
        var words = List.of("hello", "fuzzy", "world");
        var greeting = words.stream()
                .filter(w -> !w.contains("z"))
                .collect(Collectors.joining(", "));
        System.out.println(greeting);  // hello, world
    }
}