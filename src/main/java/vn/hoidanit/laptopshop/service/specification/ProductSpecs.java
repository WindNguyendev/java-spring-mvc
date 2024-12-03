package vn.hoidanit.laptopshop.service.specification;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.Product_;

public class ProductSpecs {
    public static Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%");
    }

    // case1
    public static Specification<Product> minPrice(double price) {
        return (root, query, criteriaBuiler) -> criteriaBuiler.ge(root.get(Product_.PRICE), price);

    }

    // case2
    public static Specification<Product> maxPrice(double price) {
        return (root, query, criteriaBuiler) -> criteriaBuiler.le(root.get(Product_.PRICE), price);

    }

    public static Specification<Product> matchFactory(String factory) {
        return (root, query, criteriaBuiler) -> criteriaBuiler.equal(root.get(Product_.FACTORY), factory);
    }

    public static Specification<Product> matchListFactory(List<String> factory) {
        return (root, query, criteriaBuiler) -> criteriaBuiler.in(root.get(Product_.FACTORY)).value(factory);
    }

    public static Specification<Product> matchPrice(double min, double max) {
        return (root, query, criteriaBuiler) -> criteriaBuiler.and(
                criteriaBuiler.gt(root.get(Product_.PRICE), min),
                criteriaBuiler.le(root.get(Product_.PRICE), max));
    }

    // case4
    public static Specification<Product> matchListTarget(List<String> target) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Product_.TARGET)).value(target);
    }

    // case6
    public static Specification<Product> matchMultiplePrice(double min, double max) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.between(
                root.get(Product_.PRICE), min, max);
    }

}
