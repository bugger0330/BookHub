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
//    // 사용자 정보 페이지 렌더링
//    @GetMapping("/user/{id}")
//    public String getUserById(Long id, Model model) {
//    	List<User> user = userService.findById(id);
//    	model.addAttribute("user", user);
//    	return "/user/userDetail";
//    }
//
//    // 사용자 정보 수정 페이지 렌더링
////    @GetMapping("/edit/{id}")
////    public String getEditUserPage(@PathVariable("id") Long id, Model model) {
////        List<User> userOptional = userService.findById(id);
////        if (userOptional.isPresent()) {
////            model.addAttribute("user", userOptional.get());
////            return "userEdit"; // userEdit.html로 이동
////        } else {
////            return "notFound"; // 사용자가 없을 경우 notFound.html로 이동
////        }
////    }
//
//    // 사용자 정보 수정 처리
//    @PostMapping("/{id}/edit")
//    public String updateUser(@PathVariable("id") Long id, @ModelAttribute User user) {
//        userService.save(user);
//        return "redirect:/users/" + id; // 수정된 사용자 정보를 보여주는 페이지로 리다이렉트
//    }

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
