package vn.minxi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.minxi.entity.User;
import vn.minxi.repository.IUserRepository;
import vn.minxi.service.IUserService;

import java.util.List;
import java.util.Optional;

@Service
public class UserService implements IUserService {

    @Autowired
    IUserRepository userRepository;

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public Optional<User> findById(Long id) {
        return userRepository.findById(id);
    }

    @Override
    public User save(User user) {
        return userRepository.save(user);
    }

    @Override
    public void deleteById(Long id) {
        userRepository.deleteById(id);
    }

    @Override
    public List<User> searchByKeyword(String keyword) {
        if (keyword != null && !keyword.trim().isEmpty()) {
            String k = keyword.trim();
            return userRepository.findByUsernameContainingIgnoreCaseOrFullnameContainingIgnoreCase(k, k);
        }
        return findAll();
    }
}