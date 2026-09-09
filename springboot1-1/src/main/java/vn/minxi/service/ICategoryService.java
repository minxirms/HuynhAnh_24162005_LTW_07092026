package vn.minxi.service;

import vn.minxi.entity.Category;

import java.util.List;
import java.util.Optional;

public interface ICategoryService {
	List<Category> findAll();

	Optional<Category> findById(Long id);

	Category save(Category category);

	void deleteById(Long id);

	List<Category> searchByName(String keyword);
}