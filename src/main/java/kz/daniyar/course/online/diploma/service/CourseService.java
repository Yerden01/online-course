package kz.daniyar.course.online.diploma.service;

import kz.daniyar.course.online.diploma.domain.Category;
import kz.daniyar.course.online.diploma.domain.Course;
import kz.daniyar.course.online.diploma.repository.CourseRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public class CourseService {

    @Autowired
    private CourseRepo courseRepo;
    @Autowired
    private ServiceUtils serviceUtils;

    public List<Course> getCoursesByCategory(Category category) {
        return courseRepo.getAllByCategoryOrderById(category);
    }

    public List<Course> getTopSixCourses() {
        return courseRepo.getTopSixCourses();
    }

    public void addCourse(Course course, MultipartFile imageSrc) {
        try {
            course.setImageSrc(serviceUtils.saveUploadedFile(imageSrc));
        } catch (Exception e) {
            System.out.println("Error uploading file");
        }

        courseRepo.save(course);
    }

    public void updateCourse(Course course, Long courseId, MultipartFile imageSrc) {
        course.setId(courseId);

        if (!imageSrc.isEmpty() && imageSrc.getSize() > 0) {
            try {
                course.setImageSrc(serviceUtils.saveUploadedFile(imageSrc));
            } catch (Exception e) {
                System.out.println("Error uploading file");
            }
        }

        courseRepo.save(course);
    }

    public void deleteCourse(Long courseId) {
        courseRepo.deleteById(courseId);
    }
}
