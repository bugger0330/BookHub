package com.library.bookhub.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.bookhub.entity.PointShop;
import com.library.bookhub.entity.User;
import com.library.bookhub.repository.PointRepository;
import com.library.bookhub.repository.PointShopRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PointShopService {
	
	@Autowired
	private PointShopRepository pointShopRepository;
	
	// 전체조회
	public List<PointShop> findAllPointShop(){
		return pointShopRepository.findAll();
	};
	
	
	// 상세조회(1건조회)
	public Optional<PointShop> findById(int id){
		return pointShopRepository.findById(id);
	}
    
    // 저장함수
    public int save(PointShop pointShop) {
    	int queryResult = -1;
    	try {
			if(pointShop.getId() == null) {
				queryResult = pointShopRepository.insert(pointShop);
			} else {
				// 기본키가 없으면
				queryResult = pointShopRepository.update(pointShop);
			}
		} catch (Exception e) {
			log.debug(e.getMessage());
		}
    	
    	return queryResult;
    }

    
    // 삭제함수
    public boolean removeById(int id) {
    	try {
			if(pointShopRepository.existById(id) > 0) {
				pointShopRepository.deleteById(id);
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			log.debug(e.getMessage());
		}
    	return false;
    }

}
