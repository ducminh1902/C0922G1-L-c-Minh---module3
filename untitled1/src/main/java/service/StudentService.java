package service;

import model.Student;

import java.util.List;

public interface StudentService {
    List<Student> display();

    void add(Student student);

    void delete(int id);

}
