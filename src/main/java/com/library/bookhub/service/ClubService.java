package com.library.bookhub.service;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.library.bookhub.entity.Club;
import com.library.bookhub.entity.ClubApplication;
import com.library.bookhub.repository.ClubRepository;
import com.library.bookhub.security.MyUserDetails;
import com.library.bookhub.web.dto.ClubSaveFormDto;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class ClubService {

	@Autowired
	ClubRepository clubRepository;
	
	// 모임 개설
	@Transactional
	public boolean createClub(@AuthenticationPrincipal MyUserDetails user, ClubSaveFormDto dto) {
		
		// 포인트 조회
		int point = user.getUser().getPoint();
		log.info("point : " + point);
		
		
		// 사용자 포인트 부족시 등록불가 -> alert 띄우거나 포인트 결제창으로 이동!
		if(point < 5000) {
			return false; // 메서드 즉시 종료, 이후 코드로 안 넘어감
		}
		
		// 포인트 사용 후 회원정보 수정
		point -= 5000;
		user.getUser().setPoint(point);
		log.info("User : " + user.getUser());
		clubRepository.updatePoint(user.getUser());
		
		Club club = Club.builder()
				.userName(user.getUsername()) // 일단 이렇게 저장, 나중에 session에 저장된 정보 컨트롤러에서 가져오기
				.clubCate(dto.getClubCate())
				.clubName(dto.getClubName())
				.descript(dto.getDescript())
				.detail(dto.getDetail())
				.cDate(dto.getCDate())
				.host(dto.getHost())
				.headCount(dto.getHeadCount())
				.originFileName1(dto.getOriginFileName1()) 
				.originFileName2(dto.getOriginFileName2()) // 파일첨부 안할땐 어떻게 되는거야?? null로 등록됨
				.originFileName3(dto.getOriginFileName3())
				.uploadFileName1(dto.getUploadFileName1())
				.uploadFileName2(dto.getUploadFileName2())
				.uploadFileName3(dto.getUploadFileName3())
				.build();
		
		return clubRepository.insert(club);
	}
	
	// 모임 목록
	public List<Club> readClubList() {
		
		return clubRepository.findAll();
	}
	
	// 카테고리별 목록
	public List<Club> readByClubCate(Integer clubCate) {
		
		return clubRepository.findByClubCate(clubCate);
	}
	
	// 검색 기능
	public List<Club> readByKeyword(String keyword) {
		
		return clubRepository.findByKeyword(keyword);
	}
	
	// 모임 상세보기
	public Club readByClubId(Integer id) {
		
		return clubRepository.findById(id);
	}
	
	// 모임 신청
	@Transactional // Transactional이 정확히 뭔뎅
	public boolean createApplication(Integer clubId, String userName) {
		
		// 같은 아이디로 신청한 내역 있는지 조회
		ClubApplication clubApplication = clubRepository.findApplicationByIdAndUserName(clubId, userName);
		
		// 같은 아이디로 신청한 내역이 없을 때
		if(clubApplication == null) {
			
			// 신청하는 모임 정보 조회
			Club club = clubRepository.findById(clubId);
			// 신청인원 + 1
			club.setupHcApply();
			
			// 신청인원수가 정원 - 5 보다 크거나 같으면 status 수정 / 마감은?? 마감표시 디비에 넣는 것 일단 보류
			if(club.getHcApply() >= club.getHeadCount() - 5) {
				club.setStatus("마감임박");
			}
			
			clubRepository.updateByApplication(club);
			// ClubApplication 객체 새로 만들어서 clubId, userName set 한 후 객체로 insert 하려고 했는데, 신청 내역 조회할때도 ClubApplication 객체 쓸 일 있어서 헷갈릴까봐
			//그냥 파라미터로 insert 한다!
			return clubRepository.insertApplication(clubId, userName);
			
		} else {
			// 같은 아이디로 신청한 내역 이미 있음
			return false;
		}
	}
	
	// 모임개설내역
	public List<Club> readClubListByUserName(String userName) {
		
		return clubRepository.findByUserName(userName);
	}
	
	// 모임신청내역
	public List<ClubApplication> readApplicationListByUserName(String userName) {
		
		return clubRepository.findApplicationByUserName(userName);
	}
	
	// 모임신청취소
	@Transactional
	public boolean deleteApplication(Integer id, Integer clubId) {
		
		// 신청취소하는 모임 조회
		Club club = clubRepository.findById(clubId);
		
		// 모임 신청인원 수정
		club.minusHcApply();
		
		// 신청인원수가 정원 - 5 보다 작으면 status 수정 
		if(club.getHcApply() < club.getHeadCount() - 5) {
			club.setStatus("신청가능");
		}
		
		// ??? 모임날짜 전날까지만 취소가능 or 당일도 가능 (고민해보기)

		clubRepository.updateByApplication(club);
		return clubRepository.deleteApplication(id);
	}
	
	
	
	
	
}
