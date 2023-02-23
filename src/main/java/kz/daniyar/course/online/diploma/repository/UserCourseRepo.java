package kz.daniyar.course.online.diploma.repository;

import kz.daniyar.course.online.diploma.domain.Category;
import kz.daniyar.course.online.diploma.domain.Course;
import kz.daniyar.course.online.diploma.domain.User;
import kz.daniyar.course.online.diploma.domain.UserCourse;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface UserCourseRepo extends CrudRepository<UserCourse, Long> {
//    List<Course> getAllByCategoryOrderById(Category category);
//
    @Query(value = "select * from user_course where course_id = ?1 and user_id = ?2 limit 1", nativeQuery = true)
    UserCourse getByCourseAndUser(Course course, User user);
//
    @Query(value = "select uc.course_id from user_course uc join course c on uc.course_id = c.id where user_id = ?1", nativeQuery = true)
    List<Long> getCoursesByUser(User user);
}
