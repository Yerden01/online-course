package kz.daniyar.course.online.diploma.service;

import kz.daniyar.course.online.diploma.domain.Course;
import kz.daniyar.course.online.diploma.domain.Video;
import kz.daniyar.course.online.diploma.repository.VideoRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VideoService {

    @Autowired
    private VideoRepo videoRepo;

    public List<Video> getVideosByCourse(Course course) {
        return videoRepo.getAllByCourseOrderById(course);
    }

    public void addVideo(Video video) {
        videoRepo.save(video);
    }

    public void updateVideo(Video video, Long videoId) {
        video.setId(videoId);

        videoRepo.save(video);
    }

    public void deleteVideo(Long videoId) {
        videoRepo.deleteById(videoId);
    }
}
