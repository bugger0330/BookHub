package com.library.bookhub.web.controller.cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.library.bookhub.entity.cs.CsNoticeEntity;
import com.library.bookhub.service.CsNoticeService;
import com.library.bookhub.web.dto.common.PageReq;
import com.library.bookhub.web.dto.common.PageRes;

import lombok.extern.log4j.Log4j2;

/**

  * @FileName : CsNoticeRestFulController.java

  * @Project : BookHub

  * @Date : 2024. 3. 5. 

  * @작성자 : 이준혁

  * @변경이력 :

  * @프로그램 설명 : 공지사항 restful controller

  */

@RestController
@Log4j2
public class CsNoticeRestFulController {

	@Autowired
	private CsNoticeService csNoticeService;

	// 메인화면에 띄울 전체공지사항리스트
	/*
	 * @GetMapping("/api/notice") public List<CsNoticeEntity> getCsNoticeList() {
	 * return csNoticeService.selectCsNoticeList(); }
	 */

	// 공지사항 상세조회
	@GetMapping("/api/notice/{id}")
	public CsNoticeEntity getNoticeView(@PathVariable int id) {
		return csNoticeService.noticeView(id);
	}
	
	
	/*
	 * // 공지사항 등록
	 * 
	 * @PostMapping("/api/notice") public void addNotice(@RequestBody CsNoticeEntity
	 * notice) { csNoticeService.insertCsNotice(notice); }
	 * 
	 * // 공지사항 수정
	 * 
	 * @PutMapping("/api/notice/{id}") public void updateNotice(@PathVariable int
	 * id, @RequestBody CsNoticeEntity notice) { notice.setId(id);
	 * csNoticeService.updateCsNotice(notice); }
	 * 
	 * // 공지사항 삭제
	 * 
	 * @DeleteMapping("/api/notice/{id}") public void deleteNotice(@PathVariable int
	 * id) { csNoticeService.deleteCsNotice(id); }
	 */

	

	@GetMapping("/page")
    public PageRes<CsNoticeEntity> getNoticePage(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size) {
        PageReq pageReq = new PageReq(page, size);
        return csNoticeService.getNoticeUsingPage(pageReq);
    }
}