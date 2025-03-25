package com.example.musicstore.service;

import com.example.musicstore.domain.User;
import com.example.musicstore.repository.UserRepository;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void saveUser(OAuth2User oAuth2User) {
        // Step 1: Get all users.
        List<User> users = userRepository.findAll();

        // Step 2: Get email from Oath2User
        String email = oAuth2User.getAttribute("email");

        // Step 3: check that the user existed.
        boolean existsUser = users.stream().anyMatch(user -> user.getEmail().equals(email));

        // Step 4: Add to DB if user does not exist.
        if (!existsUser) {
            User user = new User();
            user.setEmail(email);
            user.setImage(oAuth2User.getAttribute("picture"));
            user.setName(oAuth2User.getAttribute("name"));
            save(user);
        }
    }

    public void save(User user) {
        this.userRepository.save(user);
    }

    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }
}
