package com.library.bookhub.repository;

import com.library.bookhub.entity.BannerAd;
import com.library.bookhub.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BannerAdRepository {

    public int insert(BannerAd bannerAd);
    public int updateById(BannerAd bannerAd);
    public int deleteById(Integer id);
    public BannerAd findById(Integer id);

    // 전체조회, 페이징처리
    List<BannerAd> findAllWithPagingAndWriter(@Param("offset") int offset, @Param("limit") int limit, @Param("writer") String writer);

    // 총 데이터의 개수 조회
    int getAdTotalCount();
}
