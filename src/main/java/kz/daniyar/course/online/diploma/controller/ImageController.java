package kz.daniyar.course.online.diploma.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

@Controller
public class ImageController {

    @Value("${upload.folder}")
    private String uploadDir;

    @GetMapping(
            value = "/images/{name}",
            produces = MediaType.IMAGE_JPEG_VALUE
    )
    public @ResponseBody
    byte[] getImage(@PathVariable String name) {
        File serverFile = new File(uploadDir + "/" + name);

        try {
            return Files.readAllBytes(serverFile.toPath());
        } catch (IOException e) {
            return null;
        }
    }
}