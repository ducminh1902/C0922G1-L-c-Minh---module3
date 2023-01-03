package service;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductServiceImpl implements ProductService {

    static List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product(1,"oto",1.000,"ok","Audi"));
        productList.add(new Product(2,"oto",2.000,"ok","Mercedes"));
        productList.add(new Product(3,"oto",3.000,"ok","BMW"));
        productList.add(new Product(4,"oto",4.000,"ok","Marserati"));
        productList.add(new Product(5,"oto",5.000,"ok","Peugot"));
    }
    @Override
    public List<Product> display() {
        return productList;
    }

    @Override
    public void add(Product product) {
        productList.add(product);
    }

    @Override
    public void delete(int id) {
        for (int i = 0; i <productList.size() ; i++) {
            if (id == productList.get(i).getId()){
             productList.remove(i);
            }
        }
    }

    @Override
    public void update(int oldId,Product product) {
        for (int i = 0; i <productList.size() ; i++) {
            if (oldId == productList.get(i).getId()){
              productList.set(i,product);
            }
        }
    }

    @Override
    public Product findByID(int id) {
        Product product = new Product();
        for (Product x: productList) {
            if (x.getId() == id){
             product=x;
            }
        }
        return product;
    }
}
