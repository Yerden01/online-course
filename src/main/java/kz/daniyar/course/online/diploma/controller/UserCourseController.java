package kz.daniyar.course.online.diploma.controller;

import kz.daniyar.course.online.diploma.domain.*;
import kz.daniyar.course.online.diploma.service.ArticleService;
import kz.daniyar.course.online.diploma.service.CategoryService;
import kz.daniyar.course.online.diploma.service.CourseService;
import kz.daniyar.course.online.diploma.service.UserCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Collections;
import java.util.List;

@Controller
public class UserCourseController {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private CourseService courseService;

    @Autowired
    private UserCourseService userCourseService;

    @Autowired
    private ArticleService articleService;

    @GetMapping("/my-courses")
    public String getMyCourses(@AuthenticationPrincipal User user, Model model) {

        model.addAttribute("courses", userCourseService.getCourses(user));
        model.addAttribute("whichPage", "/my-courses");

        return "user/mycourse";
    }

    @GetMapping("/my-courses/{course}")
    public String getMyCourses(@AuthenticationPrincipal User user, @PathVariable Course course, @RequestParam(required = false, name = "video") Video chosenVideo, Model model) {

        Video video = course.getVideos().get(0);

        if (chosenVideo != null)
            video = chosenVideo;

        model.addAttribute("course", course);
        model.addAttribute("chosenVideo", video);
        model.addAttribute("whichPage", "/my-courses");

        return "user/videos";
    }

    @GetMapping("/all-courses")
    public String getAllCourses(@RequestParam(required = false) Category chosenCategory, Model model) {

        List<Category> categories = categoryService.getCategories();
        Category category = categories.get(0);

        if (chosenCategory != null)
            category = chosenCategory;

        model.addAttribute("categories", categories);
        model.addAttribute("courses", categories.size() > 0 ? courseService.getCoursesByCategory(category) : Collections.emptyList());
        model.addAttribute("chosenCategory", category);
        model.addAttribute("whichPage", "/all-courses");

        return "user/allcourses";
    }

    @GetMapping("/stud-articles")
    public String getArticles(@AuthenticationPrincipal User user, Model model) {

        model.addAttribute("articles", articleService.getArticlesForUser(user));
        model.addAttribute("whichPage", "/stud-articles");

        return "user/articles";
    }


    @GetMapping("/stud-articles/{article}")
    public String getArticles(@PathVariable Article article, Model model) {

//        model.addAttribute("articles", articleService.getArticles());
        model.addAttribute("whichPage", "/stud-articles");

        return "user/article";
    }

    @PostMapping("/register-course")
    public String registerCourse(@RequestParam Course course, @AuthenticationPrincipal User user, RedirectAttributes redirectAttributes) {

        if (!userCourseService.registerCourse(user, course)) {
            redirectAttributes.addFlashAttribute("errorMessage", "Вы уже зарегистрированы на курс: " + course.getName());

            return "redirect:/all-courses";
        }

        redirectAttributes.addFlashAttribute("message", "Вы успешно зарегистрировались");

        return "redirect:/my-courses";
    }
}
