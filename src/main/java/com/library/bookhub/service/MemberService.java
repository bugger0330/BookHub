package com.library.bookhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.library.bookhub.entity.User;
import com.library.bookhub.repository.MemberRepository;
import com.library.bookhub.web.dto.member.SignUpFormDto;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class MemberService {
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private PasswordEncoder encoder;
	
	// 사용자 조회
	public User readUserByUserName(String userName) {
		log.info("readUserByUserName...1"+userName);
		User user = memberRepository.findByUsername(userName);

		log.info("readUserByUserName...2");
		log.info("user : "+user);
		
		return user;
	}
	
	// 회원가입 기능
	@Transactional
	public void createUser(SignUpFormDto dto) {
		log.info("createUser...1");
		log.info("dto : "+dto.toString());
		
		User userEntity = User.builder()
							.userName(dto.getUid())
							.password(encoder.encode(dto.getPassword()))
							.name(dto.getName())
							.gender(dto.getGender())
							.phone(dto.getHp())
							.email(dto.getEmail())
							.zip(dto.getZip())
							.addr1(dto.getAddr1())
							.addr2(dto.getAddr2())
							.build();
		
		log.info("createUser...2");
		log.info("userEntity : "+userEntity.toString());
		
		memberRepository.insert(userEntity);
		
	}
	
	
	// 아이디 중복확인
	public int confirmUid(String uid) {
		
		int result = memberRepository.countByUsername(uid);
		log.info("where uid ? :"+ result);
		
		return result;
	}
	
	
	// 아이디 찾기
	public List<String> findUid(String email) {
		
		List<String> uids = memberRepository.findEmailByUsername(email);
		
		return uids;
	}
	
	// 아이디, 이메일로 계정 찾기
	@Transactional
	public int findPassword(String userName, String email) {
		int result = memberRepository.countIdAndEmailByUser(userName, email);
		return result;
	}
	
	// 비밀번호 수정
	public int modifyPassword(String uid, String password) {
		
		User user = User.builder()
				.userName(uid)
				.password(encoder.encode(password))
				.build();
		
		int result = memberRepository.updatePassword(user);
		
		return result;
	}
	
}
