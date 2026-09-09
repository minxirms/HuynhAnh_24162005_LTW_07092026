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
	private IUserRepository userRepository;

	@Override
	public List<User> findAll() {
		return userRepository.findAll();
	}

	@Override
	public List<User> searchByName(String keyword) {
		if (keyword != null && !keyword.trim().isEmpty()) {
			return userRepository
					.findByUsernameContainingIgnoreCaseOrFullnameContainingIgnoreCaseOrEmailContainingIgnoreCase(
							keyword.trim(), keyword.trim(), keyword.trim());
		}
		return findAll();
	}

	@Override
	public Optional<User> findById(Long id) {
		return userRepository.findById(id);
	}

	@Override
	public User save(User entity) {
		return userRepository.save(entity);
	}

	@Override
	public void deleteById(Long id) {
		userRepository.deleteById(id);
	}
}