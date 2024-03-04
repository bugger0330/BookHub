package com.library.bookhub.repository.cs;

import org.apache.ibatis.annotations.Mapper;

import com.library.bookhub.entity.cs.CsFileEntity;

@Mapper
public interface CsFileRepository {

	public int saveFiles(CsFileEntity csFileEntity);
	
	
	
}
