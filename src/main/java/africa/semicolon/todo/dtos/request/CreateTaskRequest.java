package africa.semicolon.todo.dtos.request;

import africa.semicolon.todo.data.model.Level;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Setter
@Getter
public class CreateTaskRequest {
    private String title;
    private Level description;
    private String todoId;
}
