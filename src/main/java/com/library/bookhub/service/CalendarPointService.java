package com.library.bookhub.service;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.bookhub.repository.MemberRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CalendarPointService {
	
	@Autowired
	private MemberRepository memberRepository;
	
	// 포인트 랜덤
	public int randomPoint() {
		int[] randoms = {10, 50, 100, 350,700};
		
        Random random = new Random();
        int index = random.nextInt(randoms.length);

        // 선택된 인덱스에 해당하는 값 반환
        return randoms[index];
	}
	
	// 포인트 적립
	public int completePoint(String username) {
		
		int addPoint = randomPoint();
		
		log.info("plus point : "+addPoint);
		// int result = memberRepository.updateAttendanceByPoint(0, username);
		return 0;
	}
}
