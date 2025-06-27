package Com.Sravan.Controller;

import org.springframework.web.bind.annotation.GetMapping;

@org.springframework.web.bind.annotation.RestController
public class RestController {
    @GetMapping("/index")
    public String index() {
        return "Hello Index";
    }
}
