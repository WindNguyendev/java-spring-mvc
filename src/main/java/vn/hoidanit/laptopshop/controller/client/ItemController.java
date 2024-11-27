package vn.hoidanit.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

@Controller
public class ItemController {
    @GetMapping("/product/{id}")
    public String getProductPage(Mode mode, @PathVariable long id) {

        return "client/product/detail";
    }

}
