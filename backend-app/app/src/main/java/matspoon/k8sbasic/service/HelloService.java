package matspoon.k8sbasic.service;

import org.springframework.stereotype.Service;

import matspoon.k8sbasic.repository.HelloRepository;

@Service
public class HelloService {
    private final HelloRepository helloRepository;

    public HelloService(HelloRepository helloRepository) {
        this.helloRepository = helloRepository;
    }

    public String getHelloMessage() {
        return helloRepository.fetchMessage();
    }
}
