package africa.semicolon.todo.data.repositories;

import africa.semicolon.todo.data.model.Todo;
import org.springframework.data.jpa.repository.JpaRepository;


public interface TodoRepository extends JpaRepository<Todo, String> {
    Todo findByTitle(String request);
    Todo findTodoById(String id);
}
