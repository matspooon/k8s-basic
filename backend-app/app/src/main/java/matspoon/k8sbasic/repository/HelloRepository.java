package matspoon.k8sbasic.repository;

import org.springframework.stereotype.Repository;

@Repository
public class HelloRepository {
    public String fetchMessage() {
        return "Hello, Spring Boot!";
    }
}
