package com.library.bookhub.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.library.bookhub.entity.BookShare;
import com.library.bookhub.entity.ShareBookBorrow;

@Mapper
public interface BookShareRepository {

	int shareBookWrite(BookShare bookShare);

	List<BookShare> getShareBookALL();

	BookShare getShareBook(int id);

	ShareBookBorrow selectShareBookBorrow(ShareBookBorrow entity);
	int shareBookBorrow(ShareBookBorrow entity);


}
