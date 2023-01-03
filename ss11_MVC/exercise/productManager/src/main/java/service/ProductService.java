package service;

import model.Product;

import java.util.List;

public interface ProductService {
    List<Product> display();

    void add(Product product);

    void delete(int id);

    void update(int oldId,Product product);

    Product  findByID(int id);
}
