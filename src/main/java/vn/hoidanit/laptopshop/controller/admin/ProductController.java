package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadSevice;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class ProductController {
    private final ProductService productService;
    private final UploadSevice uploadService;

    public ProductController(ProductService productService, UploadSevice uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String getProduct(Model model) {
        List<Product> lstProduct = this.productService.getAllProduct();
        model.addAttribute("products", lstProduct);
        return "/admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getMethodName(Model model) {

        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProductPage(Model model,
            @ModelAttribute("newProduct") @Valid Product product,
            BindingResult newProductBindingResult,
            @RequestParam("hoidanitFile") MultipartFile file) {
        // TODO: process POST request
        List<FieldError> errors = newProductBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        if (newProductBindingResult.hasErrors()) {
            return "/admin/product/create";
        }
        String image = this.uploadService.handleSaveUploadFile(file, "product");
        product.setImage(image);
        this.productService.handleSaveProduct(product);

        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getMethodName(Model model, @PathVariable long id) {
        model.addAttribute("newProduct", this.productService.getProductByID(id));
        return "admin/product/update";
    }

    @GetMapping("/admin/product/{id}")
    public String getDetailProduct(Model model, @PathVariable long id) {
        Product product = this.productService.getProductByID(id);
        model.addAttribute("product", product);
        return "/admin/product/detail";
    }

    @PostMapping("/admin/product/update")
    public String updateProduct(Model model,
            @ModelAttribute("newProduct") @Valid Product product,
            BindingResult newProductBindingResult,
            @RequestParam("hoidanitFile") MultipartFile file) {
        // TODO: process POST request

        if (newProductBindingResult.hasErrors()) {
            return "/admin/product/update";
        }
        Product productUpdate = this.productService.getProductByID(product.getId());
        if (productUpdate != null) {
            if (!file.isEmpty()) {
                String image = this.uploadService.handleSaveUploadFile(file, "product");
                productUpdate.setImage(image);
            }

        }
        productUpdate.setName(product.getName());
        productUpdate.setPrice(product.getPrice());
        productUpdate.setDetailDesc(product.getDetailDesc());
        productUpdate.setShortDesc(product.getShortDesc());
        productUpdate.setFactory(product.getFactory());
        productUpdate.setTarget(product.getTarget());
        productUpdate.setSold(product.getSold());
        productUpdate.setQuantity(product.getQuantity());

        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("product", this.productService.getProductByID(id));
        return "/admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postDeleteProduct(Model model, @ModelAttribute("product") Product product) {
        Product productDelete = this.productService.getProductByID(product.getId());
        if (productDelete != null) {
            this.productService.handleDeleteProduct(productDelete.getId());
        }

        return "redirect:/admin/product";
    }

}
