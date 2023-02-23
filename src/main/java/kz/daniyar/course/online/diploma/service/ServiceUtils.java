package kz.daniyar.course.online.diploma.service;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

@Service
public class ServiceUtils {

    @Value("${upload.folder}")
    private String uploadFolder;

    public String saveUploadedFile(MultipartFile file) throws IOException {
        if (!file.isEmpty()) {
            UUID uuid = UUID.randomUUID();
            byte[] bytes = file.getBytes();
            Path path = Paths.get(uploadFolder + uuid + "." + FilenameUtils.getExtension(file.getOriginalFilename()));
            Files.write(path, bytes);
            return uuid + "." + FilenameUtils.getExtension(file.getOriginalFilename());
        }
        return null;
    }
}
