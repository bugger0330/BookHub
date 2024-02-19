package com.library.bookhub.service;

import com.library.bookhub.entity.BannerAd;
import com.library.bookhub.handler.exception.CustomRestFulException;
import com.library.bookhub.repository.BannerAdRepository;
import com.library.bookhub.utils.Define;
import com.library.bookhub.web.dto.BannerAdFormDto;
import com.library.bookhub.web.dto.common.PageReq;
import com.library.bookhub.web.dto.common.PageRes;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
@Slf4j
@Service
public class BannerAdService {

    @Autowired
    private BannerAdRepository bannerAdRepository;

    public BannerAdService(BannerAdRepository bannerAdRepository) {
        this.bannerAdRepository = bannerAdRepository;
    }


    // 총 광고 수 조회 메서드
    public long getTotalAdCount() {
        return bannerAdRepository.getAdTotalCount();
    }

    public List<BannerAd> findById(Integer id){
        return bannerAdRepository.findById(id);
    }

    // 업로드 처리
    @Transactional
    public void uploadBannerAd(BannerAdFormDto dto) {
        BannerAd bannerAd = BannerAd.builder()
                .title(dto.getTitle())
                .content(dto.getContent())
                .writer(dto.getWriter())
                .originFileName(dto.getOriginFileName())
                .uploadFileName(dto.getUploadFileName())
                .postYn(dto.getPostYn())
                .build();

        int result = bannerAdRepository.insert(bannerAd);
        if(result != 1) {
            throw new CustomRestFulException(Define.FAIL_UPLOAD_AD, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    // 페이징된 유저 목록 조회
    public PageRes<BannerAd> getAdWithPaging(PageReq pageReq, String writer) {
        int page = pageReq.getPage();
        int size = pageReq.getSize();
        int offset = (page - 1) * size; // 오프셋 계산

        // 총 데이터 개수 조회
        long totalElements = bannerAdRepository.getAdTotalCount();

        // 페이징 처리된 유저 목록 조회
        List<BannerAd> ads = bannerAdRepository.findAllWithPagingAndWriter(offset, size, writer);

        // 페이징 결과 객체 생성
        PageRes<BannerAd> pageRes = new PageRes<>(ads, page, totalElements, size);

        return pageRes;
    }

    // 상세조회
    public Optional<BannerAd> findByBannerId(int id) {
        // db 상세조회 호출
        Optional<BannerAd> optionalBannerAd = bannerAdRepository.findByBannerId(id);

        return optionalBannerAd;
    }

    // 저장
    public int save(BannerAd bannerAd) {
        int queryResult = -1;
        try {
            if (bannerAd.getId() == null) {
                queryResult = bannerAdRepository.insert(bannerAd);
            } else {
                queryResult = bannerAdRepository.update(bannerAd);
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }

        return queryResult;
    }

    // 삭제함수
    public boolean removeById(int id) {
        try {
            if(bannerAdRepository.existById(id) > 0) {
                bannerAdRepository.deleteById(id);
                return true;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return false;

    }
}
