package africa.semicolon.todo.data.repositories;

import africa.semicolon.todo.data.model.Task;
import org.springframework.data.jpa.repository.JpaRepository;


public interface TaskRepository extends JpaRepository<Task, String> {
    Task findByTitle(String title);
    void deleteByTitle(String string);



}
