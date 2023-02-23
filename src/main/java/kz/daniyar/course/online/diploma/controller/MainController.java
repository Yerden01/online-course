package kz.daniyar.course.online.diploma.controller;

import kz.daniyar.course.online.diploma.domain.Role;
import kz.daniyar.course.online.diploma.domain.User;
import kz.daniyar.course.online.diploma.service.ArticleService;
import kz.daniyar.course.online.diploma.service.CategoryService;
import kz.daniyar.course.online.diploma.service.CourseService;
import kz.daniyar.course.online.diploma.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
//@PreAuthorize("hasAuthority('admin')")
public class MainController {

    @Autowired
    private UserService userService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private CourseService courseService;

    @Autowired
    private ArticleService articleService;

    @GetMapping("/add-first-user")
    public String addFirstUser() {
        userService.addFirstUser();
        return "redirect:/";
    }

    @GetMapping("/")
    public String getMainPage(Model model) {

        model.addAttribute("categories", categoryService.getThreeCategories());
        model.addAttribute("courses", courseService.getTopSixCourses());
        model.addAttribute("articles", articleService.getLastFour());

        return "landing";
    }

    @GetMapping("/registration")
    public String registrationPage() {
        return "registration";
    }

    @GetMapping("/login")
    public String loginPage(HttpServletRequest request, Model model) {
        if (request.getQueryString() != null && !request.getQueryString().isBlank() && request.getQueryString().contains("error"))
            model.addAttribute("errorMessage", "error");

        return "login";
    }

    @GetMapping("/default")
    public String defaultUrl(@AuthenticationPrincipal User user) {
        if (user.getRole().equals(Role.admin))
            return "redirect:/categories";

        return "redirect:/my-courses";
    }

    @PostMapping("/registration")
    public String registerPerson(@RequestParam String username, @RequestParam String password, @RequestParam String checkPassword, RedirectAttributes redirectAttributes) {

        String s = userService.registerUser(username, password, checkPassword);

        if (!s.isBlank()) {
            redirectAttributes.addFlashAttribute("errorMessage", s);
            return "redirect:/registration";
        }

        redirectAttributes.addFlashAttribute("successMessage", "Успешно зарегистрированы, теперь войдите");
        return "redirect:/login";
    }

    @GetMapping("/data")
    public @ResponseBody String getMaindata(Model model) {

        model.addAttribute("whichPage", "/");
        model.addAttribute("categories", categoryService.getCategories());

        return categoryService.getCategories().toString();
    }
}
