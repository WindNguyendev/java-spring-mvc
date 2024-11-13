package vn.hoidanit.laptopshop;

@RestController
public class HelloController {
    @GetMapping("/")
    public String index() {
        return "Hello World from Spring Boot!";
    }
}
