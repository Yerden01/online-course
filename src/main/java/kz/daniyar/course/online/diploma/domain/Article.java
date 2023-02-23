package kz.daniyar.course.online.diploma.domain;

import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
public class Article {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

//    @NotBlank
    @Length(min = 3, max = 50)
    private String name;

    @Column()
    private String description;

    private String imageSrc;

    @ManyToOne
    private Category category;
}
