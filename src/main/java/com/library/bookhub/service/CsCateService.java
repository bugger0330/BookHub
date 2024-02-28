package com.library.bookhub.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.bookhub.entity.cs.CsCate1Entity;
import com.library.bookhub.entity.cs.CsCate2Entity;
import com.library.bookhub.repository.cs.CsCateRepository;
import com.library.bookhub.web.dto.cs.CsCate1Dto;
import com.library.bookhub.web.dto.cs.CsCate2Dto;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class CsCateService {

	@Autowired
	private CsCateRepository csCateRepository;

	public List<CsCate1Dto> selectCsCate1() {
		List<CsCate1Entity> list1 = csCateRepository.selectCsCate1();
		List<CsCate2Entity> list2 = csCateRepository.selectCsCate2();
		
		System.out.println("list1" + list1);
		System.out.println("list2" + list2);
		
		List<CsCate1Dto> dto1 = new ArrayList<>();
		for(int i = 0; i < list1.size(); i++) {
			CsCate1Dto respList = new CsCate1Dto();
			respList.setCate1(list1.get(i).getCate1());
			respList.setC1Name(list1.get(i).getC1Name());
			dto1.add(respList); // cate1 담기
		}
		
		for(int i = 0; i < list1.size(); i++) {
		List<CsCate2Dto> dto2 = new ArrayList<>();
		
			for(int k = 0; k < list2.size(); k++){
				if(dto1.get(i).getCate1() == list2.get(k).getCate1()) {
					CsCate2Dto respList2 = new CsCate2Dto();
					respList2.setCate1(list2.get(k).getCate1());
					respList2.setCate2(list2.get(k).getCate2());
					respList2.setC2Name(list2.get(k).getC2Name());
					dto2.add(respList2);
					dto1.get(i).setRespList(dto2);
				}// if문
				}// 2중for문
		}
		
		
		
		return dto1;
	}

	

	
}
