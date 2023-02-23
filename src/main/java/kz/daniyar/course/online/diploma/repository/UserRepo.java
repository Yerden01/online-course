package kz.daniyar.course.online.diploma.repository;

import kz.daniyar.course.online.diploma.domain.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepo extends CrudRepository<User, Long> {
    User findByUsername(String username);
//
//    User findByTelegramId(Long telegramId);
}
