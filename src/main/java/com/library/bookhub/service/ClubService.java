package com.library.bookhub.service;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.library.bookhub.entity.Club;
import com.library.bookhub.entity.ClubApplication;
import com.library.bookhub.entity.ClubWishList;
import com.library.bookhub.entity.User;
import com.library.bookhub.handler.exception.CustomRestFulException;
import com.library.bookhub.repository.ClubRepository;
import com.library.bookhub.security.MyUserDetails;
import com.library.bookhub.utils.Define;
import com.library.bookhub.web.dto.ClubSaveFormDto;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class ClubService {

	@Autowired
	ClubRepository clubRepository;
	
	// 모임 개설
	@Transactional
	public boolean createClub(String username, ClubSaveFormDto dto) {
		
		// 포인트 조회
		// DB에 포인트 값 수정해도 처음 로그인 시 포인트 값으로 계속 로그찍힘
		// userName으로 DB에서 조회해서 포인트 가져오자
		log.info("userName : " + username);
		User user = clubRepository.findUserByUserName(username);
		log.info("user : " + user);
		int point = user.getPoint();
		
		// 사용자 포인트 부족시 등록불가 -> alert 띄우거나 포인트 결제창으로 이동!
		if(point < 5000) {
			// return false 먼저 나오는 게 더 간결하고 직관적
			return false; // 메서드 즉시 종료, 이후 코드로 안 넘어감
		}
		
		// 포인트 사용 후 회원정보 수정
		point -= 5000;
		user.setPoint(point);
		clubRepository.updatePoint(user);
		
		// Controller에 파일 업로드 코드를 두는 게 아니다, 여기서 포인트 조회 후 개설가능할 때 파일도 업로드 되야함
		//포인트 부족으로 false return해도 컨트롤러에서 파일 업로드 처리하면 업로드 되므로
		MultipartFile file = dto.getCustomFile();
				
		if(file.isEmpty() == false) {
			// 사용자가 이미지를 업로드했다면 기능구현
			// 파일 사이즈 체크
			// 20MB
			if(file.getSize() > Define.MAX_FILE_SIZE) {
				throw new CustomRestFulException("파일 크기는 20MB 이상 클 수 없습니다", HttpStatus.BAD_REQUEST);
			}
			
			// 서버 컴퓨터에 파일 넣을 디렉토리가 있는지 검사
			String saveDirectory = Define.UPLOAD_FILE_DERECTORY;
			// 폴더가 없다면 오류 발생(파일 생성시)
			File dir = new File(saveDirectory);
			if(dir.exists() == false) {
				dir.mkdir(); // 폴더가 없으면 폴더 생성 / work_spring폴더 자체가 없으면 upload폴더 생성 못함
			}
			
			// 파일 이름(중복처리 예방)
			UUID uuid = UUID.randomUUID();
			String fileName = uuid + "_" + file.getOriginalFilename();
			//System.out.println("file Name : " + fileName);
			log.info("fileName : " + fileName);
			
			// C:\\dev_tools\\upload\ab.png
			String uploadPath = Define.UPLOAD_FILE_DERECTORY + File.separator + fileName; // File.separator는 \ 를 나타낸다
			//System.out.println("uploadPath : " + uploadPath);
			log.info("uploadPath : " + uploadPath);
			File destination = new File(uploadPath);
			
			try {
				file.transferTo(destination);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			// 객체 상태 변경
			dto.setOriginFileName1(file.getOriginalFilename()); // ex) bag.jpeg
			dto.setUploadFileName1(fileName); // ex) 8f4b467e-3a72-41d6-ac9c-ed2a00b6b5eb_bag.jpeg
		}
		
		Club club = Club.builder()
				.userName(user.getUserName()) // 일단 이렇게 저장, 나중에 session에 저장된 정보 컨트롤러에서 가져오기
				.clubCate(dto.getClubCate())
				.clubName(dto.getClubName())
				.descript(dto.getDescript())
				.detail(dto.getDetail())
				// dto의 cDate 타입이 String이므로 toTimestamp() 메서드 실행
				.cDate(dto.toTimestamp())
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
	
	// 카테고리별 모임 목록
	public List<Club> readByClubCate(Integer clubCate) {
		
		return clubRepository.findByClubCate(clubCate);
	}
	
	// 모임 검색 기능
	public List<Club> readByKeyword(String keyword) {
		
		return clubRepository.findByKeyword(keyword);
	}
	
	// 모임 상세보기
	public Club readByClubId(Integer id) {
		
		return clubRepository.findById(id);
	}
	
	// 모임 신청
	@Transactional // Transactional이 정확히 뭔뎅
	public boolean createApplication(Principal principal, Integer clubId) {
		
		// 같은 아이디로 신청한 내역 있는지 조회
		ClubApplication clubApplication = clubRepository.findApplicationByIdAndUserName(clubId, principal.getName());
		
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
			// 신청하는 모임 정보 수정
			clubRepository.updateByApplication(club);
			
			ClubApplication clubApplication2 = ClubApplication.builder()
										.clubId(clubId)
										.userName(principal.getName())
										.build();
			
			return clubRepository.insertApplication(clubApplication2);
			
		} else {
			// 같은 아이디로 신청한 내역 이미 있음
			return false;
		}
	}
	
	// 모임 개설내역
	public List<Club> readClubListByUserName(String userName) {
		
		return clubRepository.findByUserName(userName);
	}
	
	// 모임 신청내역
	public List<ClubApplication> readApplicationListByUserName(String userName) {
		
		return clubRepository.findApplicationByUserName(userName);
	}
	
	// 모임 신청취소
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
	
	// 모임 개설취소
	// 모임 개설은 @AuthenticationPrincipal 이용했고, 여기선 Principal 이용해보기
	@Transactional
	public boolean deleteClub(Principal principal, Integer id) {
		
		// 모임 신청내역 있는지 조회
		List<ClubApplication> ApplicationList = clubRepository.findApplicationByClubId(id);
		
		// 신청내역 있으면 개설취소 바로 안되고 관리자승인 받기
		if(!ApplicationList.isEmpty()) {
			// return false 먼저 나오는게 더 간결하고 직관적이다
			return false;
		}
		
		// 포인트 환불
		log.info("userName : " + principal.getName());
		User user = clubRepository.findUserByUserName(principal.getName());
		log.info("user : " + user);
		int point = user.getPoint();
		point += 5000;
		user.setPoint(point);
		clubRepository.updatePoint(user);
		
		// 모임 개설 취소하면서 찜한 내역도 삭제
		clubRepository.deleteWishListByClubId(id);
		
		return clubRepository.delete(id);
	}
	
	// 찜하기
	public boolean createWishList(Principal principal, Integer clubId) {
		
		ClubWishList clubWishList = ClubWishList.builder()
								.clubId(clubId)
								.userName(principal.getName())
								.build();
		
		return clubRepository.insertWishList(clubWishList);
	}
	
	// 찜하기 취소
	public boolean deleteWishList(Principal principal, Integer clubId) {
		
		return clubRepository.deleteWishList(clubId, principal.getName());
	}
	
	// 찜하기 목록
	public List<ClubWishList> readClubWishListByUserName(Principal principal) {
		
		return clubRepository.findWishListByUserName(principal.getName());
	}
	
	// 찜하기 여부에 따라 하트 다르게 표시
	public boolean readClubWishListByClubIdAndUserName(Principal principal, Integer clubId) {
		
		log.info("clubId : " + clubId);
		log.info("userName : " + principal.getName());
		
		ClubWishList clubWishList = clubRepository.findWishListByClubIdAndUserName(clubId, principal.getName());
		log.info("clubWishList : " + clubWishList);
		
		// 찜하기 내역에 없으면
		if(clubWishList == null) { 
			return false;
		}
		
		// 찜하기 내역에 있으면
		return true;
	}
	
	// 모임 전체 개수
	public int clubCount() {
		return clubRepository.clubCount();
	}
	
	// 카테고리별 모임 개수
	public int clubCountByClubCate(Integer clubCate) {
		return clubRepository.clubCountByClubCate(clubCate);
	}
	
	// 키워드별(검색) 모임 개수
	public int clubCountByKeyword(String keyword) {
		return clubRepository.clubCountByKeyword(keyword);
	}
	
	// 모임 개설 개수
	public int clubCountByUserName(Principal principal) {
		return clubRepository.clubCountByUserName(principal.getName());
	}
	
	// 모임 신청 개수
	public int clubApplicationCountByUserName(MyUserDetails myUserDetails) {
		
		return clubRepository.clubApplicationCountByUserName(myUserDetails.getUsername());
	}
	
	// 모임 찜하기 개수
	public int clubWishListCountByUserName(Principal principal) {
		
		return clubRepository.clubWishListCountByUserName(principal.getName());
	}
	
	// 모임 인기순 목록
	public List<Club> readClubListOrderByHcApply() {
		
		return clubRepository.findAllOrderByHcApply();
	}
}
