package kz.daniyar.course.online.diploma.service;

import kz.daniyar.course.online.diploma.domain.Course;
import kz.daniyar.course.online.diploma.domain.User;
import kz.daniyar.course.online.diploma.domain.UserCourse;
import kz.daniyar.course.online.diploma.repository.CourseRepo;
import kz.daniyar.course.online.diploma.repository.UserCourseRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserCourseService {

    @Autowired
    private CourseRepo courseRepo;

    @Autowired
    private UserService userService;

    @Autowired
    private UserCourseRepo userCourseRepo;

    @Autowired
    private CategoryService categoryService;

    public boolean registerCourse(User user, Course course) {

        UserCourse userCourseFromDb = userCourseRepo.getByCourseAndUser(course, user);

        if (userCourseFromDb != null)
            return false;

        UserCourse userCourse = new UserCourse();

        userCourse.setCourse(course);
        userCourse.setUser(user);

        userCourseRepo.save(userCourse);

        return true;
    }

    public List<Course> getCourses(User user) {
        List<Long> coursesByUser = userCourseRepo.getCoursesByUser(user);

        if (coursesByUser.size() == 0)
            coursesByUser.add(0L);

        List<Course> coursesByIds = courseRepo.getCoursesByIds(coursesByUser);

        return coursesByIds;
    }
}
