package kz.daniyar.course.online.diploma.controller;

import kz.daniyar.course.online.diploma.domain.Article;
import kz.daniyar.course.online.diploma.domain.Category;
import kz.daniyar.course.online.diploma.service.ArticleService;
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
@RequestMapping("/articles")
@PreAuthorize("hasAuthority('admin')")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CategoryService categoryService;

    @GetMapping
    public String getArticles(Model model) {

        model.addAttribute("whichPage", "/articles");
        model.addAttribute("title", "Статьи");
        model.addAttribute("articles", articleService.getArticles());
        model.addAttribute("categories", categoryService.getCategories());

        return "articles";
    }

    @PostMapping
    public String addArticle(@Valid Article article, BindingResult bindingResult,
                             @RequestParam(value = "imageOfArticle") MultipartFile imageSrc,
//                              @RequestParam(value = "pathOfLogo", required = false) MultipartFile uploadedFile,
                             Model model) {

        model.addAttribute("whichPage", "/articles");
        model.addAttribute("articles", articleService.getArticles());
        model.addAttribute("categories", categoryService.getCategories());

        if (bindingResult.hasErrors()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            return "articles";
        }

        articleService.addArticle(article, imageSrc);

        return "redirect:/articles";
    }

    @PostMapping("/update")
    public String updateArticle(@Valid Article article, BindingResult bindingResult,
                                 @RequestParam(value = "imageOfArticle") MultipartFile uploadedFile,
                                Long articleId,
                                Model model) {

        if (bindingResult.hasErrors()) {
            return "redirect:/articles?alert=bindErrors";
        }

        articleService.updateArticle(article, articleId, uploadedFile);

        return "redirect:/articles";
    }

    @PostMapping("/del")
    public String deleteArticle(Long articleId) {
        articleService.deleteArticle(articleId);

        return "redirect:/articles";
    }
}
