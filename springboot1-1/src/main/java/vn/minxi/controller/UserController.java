package vn.minxi.controller;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import vn.minxi.entity.User;
import vn.minxi.model.UserModel;
import vn.minxi.service.IUserService;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/users")
public class UserController {

	@Autowired
	private IUserService userService;

	
	@GetMapping("")
	public String listUsers(ModelMap model, @RequestParam(name = "keyword", required = false) String keyword) {
		
		List<User> list = userService.searchByName(keyword);
		model.addAttribute("users", list);
		model.addAttribute("keyword", keyword);
		return "admin/users/list";
	}

	
	@GetMapping("/add")
	public String addUser(ModelMap model) {
		UserModel userModel = new UserModel();
		userModel.setIsEdit(false);
		model.addAttribute("user", userModel);
		return "admin/users/addOrEdit";
	}

	
	@GetMapping("/edit/{id}")
	public String editUser(@PathVariable("id") Long id, ModelMap model) {
		Optional<User> opt = userService.findById(id);
		if (opt.isPresent()) {
			UserModel userModel = new UserModel();
			BeanUtils.copyProperties(opt.get(), userModel);
			userModel.setIsEdit(true);
			model.addAttribute("user", userModel);
			return "admin/users/addOrEdit";
		}
		return "redirect:/admin/users";
	}

	
	@PostMapping("/saveOrUpdate")
	public String saveOrUpdate(@ModelAttribute("user") UserModel userModel) {
		User user = new User();
		BeanUtils.copyProperties(userModel, user);
		userService.save(user);
		return "redirect:/admin/users";
	}

	
	@GetMapping("/delete/{id}")
	public String deleteUser(@PathVariable("id") Long id) {
		userService.deleteById(id);
		return "redirect:/admin/users";
	}
}