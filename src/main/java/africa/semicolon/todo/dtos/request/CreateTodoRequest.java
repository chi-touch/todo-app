package africa.semicolon.todo.dtos.request;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class CreateTodoRequest {
    private String title;
}
