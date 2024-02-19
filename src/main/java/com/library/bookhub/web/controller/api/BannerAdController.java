package com.library.bookhub.web.controller.api;

import com.library.bookhub.entity.BannerAd;
import com.library.bookhub.entity.User;
import com.library.bookhub.handler.exception.CustomRestFulException;
import com.library.bookhub.service.BannerAdService;
import com.library.bookhub.utils.Define;
import com.library.bookhub.web.dto.BannerAdFormDto;
import com.library.bookhub.web.dto.common.PageReq;
import com.library.bookhub.web.dto.common.PageRes;
import com.oracle.wls.shaded.org.apache.xpath.operations.Mod;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Slf4j
@Controller
@RequestMapping("/ad")
public class BannerAdController {

    @Autowired
    private BannerAdService bannerAdService;

    // 광고 전체조회
    @GetMapping("/list")
    public String getAllUsers(PageReq pageReq, Model model, @RequestParam(required = false) String writer) {
        // 기본 페이지 및 크기 설정
        if (pageReq.getPage() <= 0) {
            pageReq.setPage(1); // 페이지가 0이하인 경우 첫 페이지로 설정
        }
        if (pageReq.getSize() <= 0) {
            pageReq.setSize(10); // 페이지당 기본 개수 설정
        }

        // 페이징된 유저 목록 가져오기
        PageRes<BannerAd> pageRes = bannerAdService.getAdWithPaging(pageReq, writer);
        List<BannerAd> adList = pageRes.getContent();


        // 페이징 정보를 모델에 추가
        model.addAttribute("adList", adList);
        model.addAttribute("page", pageReq.getPage());
        model.addAttribute("size", pageRes.getSize());
        model.addAttribute("totalPages", pageRes.getTotalPages());
        model.addAttribute("startPage", pageRes.getStartPage());
        model.addAttribute("endPage", pageRes.getEndPage());

        return "pages/admin/adList";
    }

    // 광고 업로드
    @PostMapping("/upload")
    public String bannerAdUpload(BannerAdFormDto dto) {

        // 유효성 검사
        if (dto.getTitle() == null || dto.getTitle().isEmpty()) {
            throw new CustomRestFulException("제목을 입력하세요", HttpStatus.BAD_REQUEST);
        }
        if (dto.getContent() == null || dto.getContent().isEmpty()) {
            throw new CustomRestFulException("내용을 입력하세요", HttpStatus.BAD_REQUEST);
        }
        if (dto.getWriter() == null || dto.getWriter().isEmpty()) {
            throw new CustomRestFulException("광고주명을 입력하세요", HttpStatus.BAD_REQUEST);
        }
        if (dto.getBannerImage() == null || dto.getBannerImage().isEmpty()) {
            throw new CustomRestFulException("이미지 업로드는 필수입니다.", HttpStatus.BAD_REQUEST);
        }

        // 파일업로드 처리
        MultipartFile file = dto.getBannerImage();
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

        bannerAdService.uploadBannerAd(dto);
        return "redirect:/ad/list";
    }


    // 수정함수 : 수정페이지로 이동 + 상세조회 1건
    @GetMapping("/update/{id}")
    public String editBannerAd(@PathVariable int id, Model model){
        // 상세조회 호출
        Optional<BannerAd> optionalBannerAd = bannerAdService.findByBannerId(id);
        model.addAttribute("banner", optionalBannerAd.get());

        return "pages/admin/adUpdate";
    }


    // 수정함수 : db 수정 저장
    @PutMapping("/edit/{id}")
    public RedirectView updateBannerAd(@PathVariable int id, @ModelAttribute BannerAd bannerAd) {
      
        return new RedirectView("/ad/list");
    }



    // 삭제함수
    @DeleteMapping("/delete/{id}")
    public RedirectView deleteBannerAd(@PathVariable int id) {
        bannerAdService.removeById(id);
        return new RedirectView("/ad/list");
    }




}