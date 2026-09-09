package vn.minxi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.minxi.entity.Category;

import java.util.List;

@Repository
public interface ICategoryRepository extends JpaRepository<Category, Long> {
	List<Category> findByNameContainingIgnoreCase(String name);
}