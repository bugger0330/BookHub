package com.library.bookhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.bookhub.entity.Club;
import com.library.bookhub.repository.ClubRepository;
import com.library.bookhub.web.dto.ClubSaveFormDto;

@Service
public class ClubService {

	@Autowired
	ClubRepository clubRepository;
	
	// 모임 개설
	public void createClub(ClubSaveFormDto dto) {
		
		Club club = Club.builder()
				.userName("user") // 일단 이렇게 저장, 나중에 session에 저장된 정보 컨트롤러에서 가져오기
				.clubCate(dto.getClubCate())
				.clubName(dto.getClubName())
				.descript(dto.getDescript())
				.detail(dto.getDetail())
				.cDate(dto.getCDate())
				.host(dto.getHost())
				.headCount(dto.getHeadCount())
				.originFileName1(dto.getOriginFileName1()) // 파일첨부 안할땐 어떻게 되는거야?? null로 등록됨
				.originFileName2(dto.getOriginFileName2())
				.originFileName3(dto.getOriginFileName3())
				.uploadFileName1(dto.getUploadFileName1())
				.uploadFileName2(dto.getUploadFileName2())
				.uploadFileName3(dto.getUploadFileName3())
				.build();
		
		// 사용자 포인트 부족시 등록불가
		
		clubRepository.insert(club);
	}
	
	// 모임 목록
	public List<Club> readClubList() {
		
		return clubRepository.findAll();
	}
	
	// 모임 상세보기
	public Club readByClubId(Integer id) {
		
		return clubRepository.findById(id);
	}
	
	// 모임 신청
	public boolean createApplication(Integer clubId, String userName) {
		
		return clubRepository.insertApplication(clubId, userName);
	}
}
