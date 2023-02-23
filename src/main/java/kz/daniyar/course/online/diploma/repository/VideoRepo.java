package kz.daniyar.course.online.diploma.repository;

import kz.daniyar.course.online.diploma.domain.Category;
import kz.daniyar.course.online.diploma.domain.Course;
import kz.daniyar.course.online.diploma.domain.Video;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface VideoRepo extends CrudRepository<Video, Long> {
    List<Video> getAllByCourseOrderById(Course course);
}
