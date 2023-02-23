package kz.daniyar.course.online.diploma.service;

import kz.daniyar.course.online.diploma.repository.CategoryRepo;
import kz.daniyar.course.online.diploma.domain.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public class CategoryService {

    @Autowired
    private CategoryRepo categoryRepo;

    @Autowired
    private ServiceUtils serviceUtils;

    public List<Category> getCategories() {
        return categoryRepo.getAllByOrderById();
    }

    public List<Category> getThreeCategories() {
        return categoryRepo.getAllByOrderById();
    }

    public void addCategory(Category category, MultipartFile imageSrc) {

        try {
            category.setImageSrc(serviceUtils.saveUploadedFile(imageSrc));
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error uploading file");
        }

        categoryRepo.save(category);
    }

    public void updateCategory(Category category, Long categoryId, MultipartFile imageSrc) {
        category.setId(categoryId);

        if (!imageSrc.isEmpty() && imageSrc.getSize() > 0) {
            try {
                category.setImageSrc(serviceUtils.saveUploadedFile(imageSrc));
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("Error uploading file");
            }
        }

        categoryRepo.save(category);
    }

    public void deleteCategory(Long categoryId) {
        categoryRepo.deleteById(categoryId);
    }
}
