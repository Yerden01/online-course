package kz.daniyar.course.online.diploma.domain;

import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;

@Data
@Entity
public class Video {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Length(min = 3, max = 50)
    private String name;

    @ManyToOne
    private Course course;

    private String description;

    private String link;
}
