package vn.minxi.service;

import vn.minxi.entity.User;
import java.util.List;
import java.util.Optional;

public interface IUserService {
	List<User> findAll();

	List<User> searchByName(String keyword); 

	Optional<User> findById(Long id);

	User save(User entity);

	void deleteById(Long id);
}