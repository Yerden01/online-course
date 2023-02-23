package kz.daniyar.course.online.diploma.repository;

import kz.daniyar.course.online.diploma.domain.Article;
import kz.daniyar.course.online.diploma.domain.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface ArticleRepo extends CrudRepository<Article, Long> {
    List<Article> getAllByOrderById();

    @Query(value = "select * from article order by id desc limit 4", nativeQuery = true)
    List<Article> getLastFourByOrderById();

    @Query(value = "select * from article where category_id in (select category_id from course where id in (select course_id from user_course where user_id = ?1)) order by id", nativeQuery = true)
    List<Article> getArticlesByUser(User user);
}
