package kz.daniyar.course.online.diploma.service;

import kz.daniyar.course.online.diploma.domain.Article;
import kz.daniyar.course.online.diploma.domain.Category;
import kz.daniyar.course.online.diploma.domain.User;
import kz.daniyar.course.online.diploma.repository.ArticleRepo;
import kz.daniyar.course.online.diploma.repository.CategoryRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public class ArticleService {

    @Autowired
    private ArticleRepo articleRepo;

    @Autowired
    private ServiceUtils serviceUtils;

    public List<Article> getArticles() {
        return articleRepo.getAllByOrderById();
    }

    public List<Article> getArticlesForUser(User user) {
        return articleRepo.getArticlesByUser(user);
    }

    public List<Article> getLastFour() {
        return articleRepo.getLastFourByOrderById();
    }

    public void addArticle(Article article, MultipartFile imageSrc) {

        try {
            article.setImageSrc(serviceUtils.saveUploadedFile(imageSrc));
        } catch (Exception e) {
            System.out.println("Error uploading file");
        }

        articleRepo.save(article);
    }

    public void updateArticle(Article article, Long articleId, MultipartFile imageSrc) {
        article.setId(articleId);

        if (!imageSrc.isEmpty() && imageSrc.getSize() > 0) {
            try {
                article.setImageSrc(serviceUtils.saveUploadedFile(imageSrc));
            } catch (Exception e) {
                System.out.println("Error uploading file");
            }
        }

        articleRepo.save(article);
    }

    public void deleteArticle(Long articleId) {
        articleRepo.deleteById(articleId);
    }
}
