package com.library.bookhub.service;

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
	
	// 회원가입 기능
	@Transactional
	public void createUser(SignUpFormDto dto) {
		log.info("createUser...1");
		log.info("dto : "+dto.toString());
		
		User userEntity = User.builder()
							.username(dto.getUid())
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
		
		int result = memberRepository.insert(userEntity);
		
	}
	
}
