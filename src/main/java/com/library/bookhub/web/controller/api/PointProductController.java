package com.library.bookhub.web.controller.api;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import com.library.bookhub.entity.BannerAd;
import com.library.bookhub.entity.PointProduct;
import com.library.bookhub.handler.exception.CustomRestFulException;
import com.library.bookhub.service.PointProductService;
import com.library.bookhub.utils.Define;
import com.library.bookhub.web.dto.BannerAdFormDto;
import com.library.bookhub.web.dto.PointProductFormDto;
import com.library.bookhub.web.dto.common.PageReq;
import com.library.bookhub.web.dto.common.PageRes;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/point-product")
public class PointProductController {

	@Autowired
	private PointProductService pointProductService;

	// 포인트 상품 전체조회
	@GetMapping("/list")
	public String getAllPointProduct(PageReq pageReq, Model model, @RequestParam(required = false) String prodName) {

		// 기본 페이지 및 크기 설정
		if (pageReq.getPage() <= 0) {
			pageReq.setPage(1);
		}
		if (pageReq.getSize() <= 0) {
			pageReq.setSize(5);
		}

		// 페이징된 상품 목록 가져오기
		PageRes<PointProduct> pageRes = pointProductService.getPointProductWithPaging(pageReq, prodName);
		List<PointProduct> ppdList = pageRes.getContent();
		System.out.println("리스트" + ppdList);

		// 페이징 정보를 모델에 추가
		model.addAttribute("productList", ppdList);
		model.addAttribute("page", pageReq.getPage());
		model.addAttribute("size", pageRes.getSize());
		model.addAttribute("totalPages", pageRes.getTotalPages());
		model.addAttribute("startPage", pageRes.getStartPage());
		model.addAttribute("endPage", pageRes.getEndPage());

		return "/pages/admin/pointProductList";
	}

	// 상품 업로드
	@PostMapping("/upload")
	public String pointProductUpload(PointProductFormDto dto) {

		// 유효성 검사
		if (dto.getProdName() == null || dto.getProdName().isEmpty()) {
			throw new CustomRestFulException("상품명을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if (dto.getPrice() == null || dto.getPrice() < 0) {
			throw new CustomRestFulException("정확한 금액을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if (dto.getProductImage() == null || dto.getProductImage().isEmpty()) {
			throw new CustomRestFulException("이미지 업로드는 필수입니다.", HttpStatus.BAD_REQUEST);
		}

		// 파일업로드 처리
		MultipartFile file = dto.getProductImage();
		if (file.isEmpty() == false) {
			if (file.getSize() > Define.MAX_FILE_SIZE) {
				throw new CustomRestFulException("파일 크기는 20MB 이상 클 수 없습니다.", HttpStatus.BAD_REQUEST);
			}

			String saveDirectory = Define.UPLOAD_FILE_DERECTORY;
			File dir = new File(saveDirectory);
			if (dir.exists()) {
				dir.mkdir();
			}

			// 파일이름
			UUID uuid = UUID.randomUUID();
			String fileName = uuid + "_" + file.getOriginalFilename();
			System.out.println("filename : " + fileName);

			String uploadPath = Define.UPLOAD_FILE_DERECTORY + File.separator + fileName;
			File destination = new File(uploadPath);

			try {
				file.transferTo(destination);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

			dto.setOriginFileName(file.getOriginalFilename());
			dto.setUploadFileName(fileName);
		}

		pointProductService.uploadPointProduct(dto);
		return "redirect:/point-product/list";
	}

	// 수정함수 : 수정페이지로 이동 + 상세조회 1건
	@GetMapping("/update/{id}")
	public String editPointProduct(@PathVariable int id, Model model) {
		// 상세조회 호출
		Optional<PointProduct> optionalPointProduct = pointProductService.findByProductId(id);
		model.addAttribute("product", optionalPointProduct.get());

		return "pages/admin/pointProductUpdate";
	}

	// 수정함수 : db 수정 저장
	@PutMapping("/edit/{id}")
	public RedirectView updatePointProduct(@PathVariable int id, @ModelAttribute PointProductFormDto dto) {

		// 이미지를 업로드하지 않았을 경우 유효성 검사
		if (dto.getProductImage() == null || dto.getProductImage().isEmpty()) {
			throw new CustomRestFulException("이미지 업로드는 필수입니다.", HttpStatus.BAD_REQUEST);
		}

		// 배너광고가 존재하는지 확인
		Optional<PointProduct> optionalPointProduct = pointProductService.findByProductId(id);
		if (optionalPointProduct.isPresent()) {
			PointProduct existingPointProduct = optionalPointProduct.get();

			// 텍스트 정보 업데이트
			existingPointProduct.setProdName(dto.getProdName());
			existingPointProduct.setPoint(dto.getPoint());
			existingPointProduct.setPostYn(dto.getPostYn());

			// 이미지가 수정되었을 때만 이미지 업데이트 수행
			if (dto.getProductImage() != null && !dto.getProductImage().isEmpty()) {
				MultipartFile file = dto.getProductImage();
				String saveDirectory = Define.UPLOAD_FILE_DERECTORY;
				String fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
				File destination = new File(saveDirectory, fileName);
				try {
					file.transferTo(destination);
					existingPointProduct.setOriginFileName(file.getOriginalFilename());
					existingPointProduct.setUploadFileName(fileName);
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				// 이미지가 수정되지 않은 경우, 기존 이미지 정보를 유지
				existingPointProduct.setOriginFileName(dto.getOriginFileName());
				existingPointProduct.setUploadFileName(dto.getUploadFileName());
			}

			// 배너광고 정보 저장
			int result = pointProductService.save(existingPointProduct);
			if (result != -1) {
				return new RedirectView("/point-product/list");
			} else {
				return new RedirectView("/point-product/list");
			}
		} else {
			return new RedirectView("/point-product/list");
		}
	}

	// 삭제함수
	@DeleteMapping("/delete/{id}")
	public RedirectView deletePointProduct(@PathVariable int id) {
		pointProductService.removeById(id);
		return new RedirectView("/point-product/list");
	}

}
