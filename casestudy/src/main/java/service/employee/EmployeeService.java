package service.employee;

import model.employee.Employee;

import java.util.List;

public interface EmployeeService {
    List<Employee> display();

    void delete(int id);

    void add(Employee employee);

}
