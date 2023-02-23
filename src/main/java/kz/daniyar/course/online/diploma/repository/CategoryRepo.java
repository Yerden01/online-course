package kz.daniyar.course.online.diploma.repository;

import kz.daniyar.course.online.diploma.domain.Category;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface CategoryRepo extends CrudRepository<Category, Long> {
    List<Category> getAllByOrderById();

    @Query(value = "select * from category order by id limit 3", nativeQuery = true)
    List<Category> getTopThreeByOrderById();

    Optional<Category> findById(Long id);
}
