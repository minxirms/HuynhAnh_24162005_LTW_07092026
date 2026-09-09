package vn.minxi.controller;

import jakarta.validation.Valid;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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
	public String list(ModelMap model, @RequestParam(name = "keyword", required = false) String keyword) {
		List<Category> list = categoryService.searchByName(keyword);
		model.addAttribute("categories", list);
		model.addAttribute("keyword", keyword);
		return "admin/categories/list";
	}

	@GetMapping("/add")
	public String add(ModelMap model) {
		CategoryModel cateModel = new CategoryModel();
		cateModel.setIsEdit(false);
		model.addAttribute("category", cateModel);
		return "admin/categories/addOrEdit";
	}

	@PostMapping("/saveOrUpdate")
	public String saveOrUpdate(ModelMap model, 
			@Valid @ModelAttribute("category") CategoryModel cateModel,
			BindingResult result, 
			RedirectAttributes redirectAttributes) {
		
		if (result.hasErrors()) {
			return "admin/categories/addOrEdit";
		}

		Category entity = new Category();
		BeanUtils.copyProperties(cateModel, entity);

		categoryService.save(entity);

		String message = "";
		if (Boolean.TRUE.equals(cateModel.getIsEdit())) {
			message = "Category updated successfully!";
		} else {
			message = "Category saved successfully!";
		}

		redirectAttributes.addFlashAttribute("message", message);
		return "redirect:/admin/categories";
	}

	@GetMapping("/edit/{id}")
	public String edit(ModelMap model, @PathVariable("id") long id, RedirectAttributes redirectAttributes) {
		Optional<Category> optCategory = categoryService.findById(id);
		CategoryModel cateModel = new CategoryModel();

		if (optCategory.isPresent()) {
			Category entity = optCategory.get();
			BeanUtils.copyProperties(entity, cateModel);
			cateModel.setIsEdit(true);

			model.addAttribute("category", cateModel);
			return "admin/categories/addOrEdit";
		}

		redirectAttributes.addFlashAttribute("message", "Category does not exist!");
		return "redirect:/admin/categories";
	}

	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id") long id, RedirectAttributes redirectAttributes) {
		categoryService.deleteById(id);
		redirectAttributes.addFlashAttribute("message", "Category deleted successfully!");
		return "redirect:/admin/categories";
	}
}