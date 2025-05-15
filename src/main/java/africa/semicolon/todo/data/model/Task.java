//package africa.semicolon.todo.data.model;
//
//import lombok.Data;
//import org.springframework.data.annotation.Id;
//import org.springframework.data.mongodb.core.mapping.Document;
//
//
//import java.time.LocalDateTime;
//import java.util.List;
//@Data
//@Document("Tasks")
//public class Task {
//    @Id
//    private String id;
//    private String title;
//    private LocalDateTime timeCreated = LocalDateTime.now();
//    private boolean status = false;
//    private Level description;
//    private LocalDateTime timeDone = LocalDateTime.now();
//    private String todoId;
//}

package africa.semicolon.todo.data.model;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "tasks") // Optional, but useful to explicitly name your table
public class Task {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Auto-increment for PostgreSQL
    private Long id;

    private String title;

    private LocalDateTime timeCreated = LocalDateTime.now();

    private boolean status = false;

    @Enumerated(EnumType.STRING)
    private Level description;

    private LocalDateTime timeDone = LocalDateTime.now();

    private String todoId; // If this is a foreign key, consider using @ManyToOne
}
