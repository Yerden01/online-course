package kz.daniyar.course.online.diploma.service;

import kz.daniyar.course.online.diploma.repository.UserRepo;
import kz.daniyar.course.online.diploma.domain.Role;
import kz.daniyar.course.online.diploma.domain.User;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserRepo userRepo;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepo.findByUsername(username);
        if (user == null){
            throw new UsernameNotFoundException("User not found");
        }
        return user;
    }

//    public User getUserByChatId(Long chatId) {
//        return userRepo.findByTelegramId(chatId);
//    }

    public String registerUser(String username, String password, String checkPassword) {
        User user = new User();

        if (!password.equals(checkPassword))
            return "Пароли не совпадают";

        user.setUsername(username);
        user.setPassword(passwordEncoder.encode(password));
        user.setRole(Role.user);

        userRepo.save(user);

        return "";
    }

//    public User registerUserByObject(JSONObject userObject) {
//        User user = getUserByChatId(userObject.getLong("id"));
//
//        if (user == null) {
//            user = new User(userObject.getString("first_name"), userObject.getString("last_name"),
//                    userObject.getString("username"), userObject.getLong("id"), Role.user);
//            userRepo.save(user);
//        }
//
//        return user;
//    }

    public void addFirstUser() {
        User user = userRepo.findByUsername("admin");

        if (user == null){
            user = new User();
            user.setUsername("admin");
            user.setRole(Role.admin);
            user.setPassword(passwordEncoder.encode("admin"));

            userRepo.save(user);
        }
    }

//    public void updatePhone(Long chatId, String phoneNumber) {
//        User user = getUserByChatId(chatId);
//
//        user.setPhoneNumber(phoneNumber);
//
//        userRepo.save(user);
//    }
}
