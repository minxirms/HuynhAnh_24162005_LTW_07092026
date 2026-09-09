package vn.minxi.controller;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import vn.minxi.entity.Category;
import vn.minxi.model.CategoryModel;
import vn.minxi.service.ICategoryService;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/categories")
public class CategoryController {

	@Autowired
	private ICategoryService categoryService;

	@GetMapping("")
	public String listCategories(ModelMap model, @RequestParam(name = "keyword", required = false) String keyword) {
		List<Category> list = categoryService.searchByName(keyword);
		model.addAttribute("categories", list);
		model.addAttribute("keyword", keyword);
		return "admin/categories/list";
	}

	@GetMapping("/add")
	public String addCategory(ModelMap model) {
		CategoryModel categoryModel = new CategoryModel();
		categoryModel.setIsEdit(false);
		model.addAttribute("category", categoryModel);
		return "admin/categories/addOrEdit";
	}

	@GetMapping("/edit/{id}")
	public String editCategory(@PathVariable("id") Long id, ModelMap model) {
		Optional<Category> opt = categoryService.findById(id);
		if (opt.isPresent()) {
			CategoryModel categoryModel = new CategoryModel();
			BeanUtils.copyProperties(opt.get(), categoryModel);
			categoryModel.setIsEdit(true);
			model.addAttribute("category", categoryModel);
			return "admin/categories/addOrEdit";
		}
		return "redirect:/admin/categories";
	}

	@PostMapping("/saveOrUpdate")
	public String saveOrUpdate(@ModelAttribute("category") CategoryModel categoryModel) {
		Category category = new Category();
		BeanUtils.copyProperties(categoryModel, category);
		categoryService.save(category);
		return "redirect:/admin/categories";
	}

	// Xóa Category
	@GetMapping("/delete/{id}")
	public String deleteCategory(@PathVariable("id") Long id) {
		categoryService.deleteById(id);
		return "redirect:/admin/categories";
	}
}