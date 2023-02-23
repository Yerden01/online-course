package kz.daniyar.course.online.diploma.repository;

import kz.daniyar.course.online.diploma.domain.Category;
import kz.daniyar.course.online.diploma.domain.Course;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CourseRepo extends CrudRepository<Course, Long> {
    List<Course> getAllByCategoryOrderById(Category category);

    @Query(value = "select * from course order by id limit 6", nativeQuery = true)
    List<Course> getTopSixCourses();


    @Query(value = "select * from course where id in ?1", nativeQuery = true)
    List<Course> getCoursesByIds(List<Long> courseIds);
}
