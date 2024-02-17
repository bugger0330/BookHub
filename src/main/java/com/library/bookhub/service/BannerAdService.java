package com.library.bookhub.service;

import com.library.bookhub.entity.BannerAd;
import com.library.bookhub.entity.User;
import com.library.bookhub.handler.exception.CustomRestFulException;
import com.library.bookhub.repository.BannerAdRepository;
import com.library.bookhub.utils.Define;
import com.library.bookhub.web.dto.BannerAdFormDto;
import com.library.bookhub.web.dto.common.PageReq;
import com.library.bookhub.web.dto.common.PageRes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BannerAdService {

    @Autowired
    private BannerAdRepository bannerAdRepository;

    public BannerAdService(BannerAdRepository bannerAdRepository) {
        this.bannerAdRepository = bannerAdRepository;
    }


    // 총 회원 수 조회 메서드
    public long getTotalAdCount() {
        return bannerAdRepository.getAdTotalCount();
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
}
