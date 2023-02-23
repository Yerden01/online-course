package kz.daniyar.course.online.diploma.controller;

import kz.daniyar.course.online.diploma.domain.Category;
import kz.daniyar.course.online.diploma.domain.Course;
import kz.daniyar.course.online.diploma.domain.Video;
import kz.daniyar.course.online.diploma.service.VideoService;
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
@RequestMapping("/course/{course}")
@PreAuthorize("hasAuthority('admin')")
public class VideoController {

    @Autowired
    private VideoService videoService;

    @GetMapping
    public String getVideos(@PathVariable Course course,
                             Model model) {

        model.addAttribute("whichPage", "/categories");
        model.addAttribute("videos", videoService.getVideosByCourse(course));

        return "video";
    }

    @PostMapping
    public String addVideo(@PathVariable Course course,
                           @Valid Video video, BindingResult bindingResult,
                           Model model) {

        model.addAttribute("videos", videoService.getVideosByCourse(course));
        model.addAttribute("whichPage", "/categories");

        if (bindingResult.hasErrors()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            return "video";
        }

        videoService.addVideo(video);

        return "redirect:/course/" + course.getId();
    }

    @PostMapping("/update")
    public String updateVideo(@PathVariable Course course,
                               @Valid Video video, BindingResult bindingResult,
                               Long videoId,
                               Model model) {
        if (bindingResult.hasErrors()) {
            return "redirect:/course/" + course.getId() + "?alert=bindErrors";
        }

        videoService.updateVideo(video, videoId);

        return "redirect:/course/" + course.getId();
    }

    @PostMapping("/del")
    public String deleteVideo(@PathVariable Course course, @RequestParam Long videoId) {
        videoService.deleteVideo(videoId);

        return "redirect:/course/" + course.getId();
    }
}
