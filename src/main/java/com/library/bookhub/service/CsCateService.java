package com.library.bookhub.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.bookhub.entity.cs.CsCate1Entity;
import com.library.bookhub.entity.cs.CsCate2Entity;
import com.library.bookhub.repository.cs.CsCateRepository;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class CsCateService {

	@Autowired
	private CsCateRepository csCateRepository;

	public List<CsCate1Entity> selectCsCate1() {
		return csCateRepository.selectCsCate1();
	}

	public List<CsCate2Entity> selectCsCate2(int cate1) {
		return csCateRepository.selectCsCate2(cate1);
	}

	

	
}
