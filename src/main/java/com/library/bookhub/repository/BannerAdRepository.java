package com.library.bookhub.repository;

import com.library.bookhub.entity.BannerAd;
import com.library.bookhub.entity.User;
import com.library.bookhub.web.dto.BannerAdFormDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Mapper
public interface BannerAdRepository {

    public int insert(BannerAd bannerAd);
    public int update(BannerAd bannerAd);
    public int deleteById(Integer id);
    public long existById(int id);
    public List<BannerAd> findById(Integer id);

    // 전체조회, 페이징처리
    List<BannerAd> findAllWithPagingAndWriter(@Param("offset") int offset, @Param("limit") int limit, @Param("writer") String writer);

    // 총 데이터의 개수 조회
    public int getAdTotalCount();


    Optional<BannerAd> findByBannerId(int id);



}
