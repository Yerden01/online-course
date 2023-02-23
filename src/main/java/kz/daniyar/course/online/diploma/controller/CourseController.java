package kz.daniyar.course.online.diploma.controller;

import kz.daniyar.course.online.diploma.domain.Category;
import kz.daniyar.course.online.diploma.domain.Course;
import kz.daniyar.course.online.diploma.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.util.Map;

@Controller
@RequestMapping("/categories/{category}")
@PreAuthorize("hasAuthority('admin')")
public class CourseController {

    @Autowired
    private CourseService courseService;

    @GetMapping
    public String getCourses(@PathVariable Category category,
                             Model model) {

        model.addAttribute("whichPage", "/categories");
        model.addAttribute("courses", courseService.getCoursesByCategory(category));

        return "course";
    }

    @PostMapping
    public String addCourse(@PathVariable Category category,
                            @Valid Course course, BindingResult bindingResult,
                            @RequestParam(value = "imageOfCourse") MultipartFile imageOfCourse,
                            Model model) {

        model.addAttribute("courses", courseService.getCoursesByCategory(category));
        model.addAttribute("whichPage", "/categories");

        if (bindingResult.hasErrors()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            return "course";
        }

        courseService.addCourse(course, imageOfCourse);

        return "redirect:/categories/" + category.getId();
    }

    @PostMapping("/update")
    public String updateCourse(@PathVariable Category category,
                               @Valid Course course, BindingResult bindingResult,
                               @RequestParam(value = "imageOfCourse") MultipartFile imageOfCourse,
                               Long courseId,
                               Model model) {
        if (bindingResult.hasErrors()) {
            return "redirect:/categories/" + category.getId() + "?alert=bindErrors";
        }

        courseService.updateCourse(course, courseId, imageOfCourse);

        return "redirect:/categories/" + category.getId();
    }

    @PostMapping("/del")
    public String deleteCourse(@PathVariable Category category, @RequestParam Long courseId) {
        courseService.deleteCourse(courseId);

        return "redirect:/categories/" + category.getId();
    }
}
