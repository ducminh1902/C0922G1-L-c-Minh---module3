package service.customer;

import model.customer.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> display();

    void add(Customer customer);

    void delete(int id);

    boolean update(Customer customer);

    Customer findBYId(int id);
}
