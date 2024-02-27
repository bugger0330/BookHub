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

	public List<CsCate2Entity> selectCsCate2(CsCate1Entity csCate1Entity) {
		return csCateRepository.selectCsCate2(csCate1Entity);
	}

	

	/*
	 * Map<String, Object> map = new HashMap<>();
	 * 
	 * List<CsCate1Entity> cate1List = csCateRepository.selectCsCate1();
	 * 
	 * // 1차 카테고리 데이터를 담을 리스트 List<Map> depth1 = new ArrayList<>();
	 * 
	 * // 2차 카테고리 데이터를 담을 맵 (1차 카테고리를 키로 사용하여 2차 카테를 값으로 가지는 형태) Map<Integer, List>
	 * depth2 = new HashMap<>();
	 * 
	 * for (CsCate1Entity cate1 : cate1List) { // 1차 카테고리 List에 MapObject로 저장
	 * Map<String, String> depth1_temp = new HashMap<>(); depth1_temp.put("cate1",
	 * cate1.getCate1() + ""); depth1_temp.put("c1Name", cate1.getC1Name());
	 * depth1.add(depth1_temp);
	 * 
	 * // 2차 카테고리 data List<CsCate2Entity> cate2item =
	 * csCateRepository.selectCsCate2(cate1.getCate1());
	 * 
	 * // 2차 카테고리 Map에 MapObject로 저장 List<Map> depth2_2 = new ArrayList<>();
	 * Map<String, String> depth2_temp = null; for (CsCate2Entity dto2 : cate2item)
	 * { depth2_temp = new HashMap<>(); depth2_temp.put("cate1", dto2.getCate1() +
	 * ""); depth2_temp.put("cate2", dto2.getCate2() + "");
	 * depth2_temp.put("c2Name", dto2.getC2Name()); depth2_2.add(depth2_temp); }
	 * depth2.put(cate1.getCate1(), depth2_2); }
	 * 
	 * map.put("depth1", depth1); map.put("depth2", depth2);
	 * 
	 * return map; }
	 */
}
