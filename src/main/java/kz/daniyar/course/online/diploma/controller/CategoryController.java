package kz.daniyar.course.online.diploma.controller;

import kz.daniyar.course.online.diploma.domain.Category;
import kz.daniyar.course.online.diploma.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.util.Map;

@Controller
@RequestMapping("/categories")
@PreAuthorize("hasAuthority('admin')")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @GetMapping
    public String getCategories(Model model) {

        model.addAttribute("whichPage", "/categories");
        model.addAttribute("title", "Категории");
        model.addAttribute("categories", categoryService.getCategories());

        return "categories";
    }

    @PostMapping
    public String addCategory(@Valid Category category, BindingResult bindingResult,
                              @RequestParam(value = "imageOfCategory") MultipartFile imageSrc,
//                              @RequestParam(value = "pathOfLogo", required = false) MultipartFile uploadedFile,
                              Model model) {

        model.addAttribute("whichPage", "/categories");
        model.addAttribute("categories", categoryService.getCategories());

        if (bindingResult.hasErrors()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            return "categories";
        }

        categoryService.addCategory(category, imageSrc);

        return "redirect:/categories";
    }

    @PostMapping("/update")
    public String updateCategory(@Valid Category category, BindingResult bindingResult,
                                 @RequestParam(value = "imageOfCategory") MultipartFile uploadedFile,
                                Long categoryId,
                                Model model) {

        if (bindingResult.hasErrors()) {
            return "redirect:/categories?alert=bindErrors";
        }

        categoryService.updateCategory(category, categoryId, uploadedFile);

        return "redirect:/categories";
    }

    @PostMapping("/del")
    public String deleteCategory(Long categoryId) {
        categoryService.deleteCategory(categoryId);

        return "redirect:/categories";
    }
}
