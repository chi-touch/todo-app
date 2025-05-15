package africa.semicolon.todo.data.model;

import jakarta.persistence.*;
import lombok.Data;



import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
@Data

@Entity
@Table(name = "Todos") // Optional, but useful to explicitly name your table

public class Todo {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;
    private String title;
    private LocalDateTime timeCreated = LocalDateTime.now();


    @OneToMany(cascade = CascadeType.ALL)
    private List<Task> tasks = new ArrayList<>();
}
