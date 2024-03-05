package com.library.bookhub.web.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.RedirectView;

import com.library.bookhub.entity.User;
import com.library.bookhub.service.MyPageService;

@Controller
@RequestMapping("/myPage")
public class MyPageApiController {

	@Autowired
	private MyPageService myPageService;
//
	@GetMapping("/detail/{id}")
	public String findId(@PathVariable Long id, Model model) {
		User user = myPageService.findById(id);

		model.addAttribute("user", user);

		return "pages/myPage/myPageDetail";

	}

	@GetMapping("/update/{id}")
	public String updateUser(@PathVariable Long id, Model model) {
		User user = myPageService.findById(id);
		model.addAttribute("user", user);
		return "pages/myPage/myPageEdit";
	}

	@PutMapping("/edit/{id}")
	public RedirectView updateId(@PathVariable Long id, @ModelAttribute User user) {
		myPageService.save(user);
		return new RedirectView("/");
	}

	@PutMapping("/delete/{id}")
	public RedirectView deleteId(@PathVariable Long id, @ModelAttribute User user) {
		myPageService.deleteById(user);
		return new RedirectView("/");
	}

}
