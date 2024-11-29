package vn.hoidanit.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Product handleSaveProduct(Product product) {
        product = this.productRepository.save(product);
        return product;
    }

    public List getAllProduct() {
        List<Product> lstAllProduct = this.productRepository.findAll();
        return lstAllProduct;
    }

    public Product getProductByID(long id) {
        Product product = this.productRepository.findById(id);
        return product;
    }

    public void handleDeleteProduct(long id) {
        Product product = this.productRepository.findById(id);
        this.productRepository.delete(product);
    }

}
