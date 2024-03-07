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
		List<CsCate1Entity> csCateList1 = csCateRepository.selectCsCate1();
		List<CsCate2Entity> csCateList2 = csCateRepository.selectCsCate2();
		List<CsCate1Dto> csCate1Dto = new ArrayList<>();
		for(int i = 0; i < csCateList1.size(); i++) {
			CsCate1Dto respCsCate1List = new CsCate1Dto();
			respCsCate1List.setCate1(csCateList1.get(i).getCate1());
			respCsCate1List.setC1Name(csCateList1.get(i).getC1Name());
			csCate1Dto.add(respCsCate1List);
		}
		for(int i = 0; i < csCateList1.size(); i++) {
		List<CsCate2Dto> csCate2Dto = new ArrayList<>();
			for(int k = 0; k < csCateList2.size(); k++){
				if(csCate1Dto.get(i).getCate1() == csCateList2.get(k).getCate1()) {
					CsCate2Dto respCsCate2List = new CsCate2Dto();
					respCsCate2List.setCate1(csCateList2.get(k).getCate1());
					respCsCate2List.setCate2(csCateList2.get(k).getCate2());
					respCsCate2List.setC2Name(csCateList2.get(k).getC2Name());
					respCsCate2List.setAddress(csCateList2.get(k).getAddress());
					csCate2Dto.add(respCsCate2List);
					csCate1Dto.get(i).setRespList(csCate2Dto);
				}
			}
		}
		return csCate1Dto;
	}

	
	
	
	
}