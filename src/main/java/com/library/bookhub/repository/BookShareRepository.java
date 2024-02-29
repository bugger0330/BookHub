package com.library.bookhub.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.library.bookhub.entity.BookShare;
import com.library.bookhub.entity.ShareBookBorrow;
import com.library.bookhub.entity.User;

@Mapper
public interface BookShareRepository {

	int shareBookWrite(BookShare bookShare);

	List<BookShare> getShareBookALL();

	BookShare getShareBook(int id);

	ShareBookBorrow selectShareBookBorrow(ShareBookBorrow entity);
	int shareBookBorrow(ShareBookBorrow entity);

	BookShare shareBookInfo(int bookId);

	int borrowShareBook(BookShare book);

	User getUser(String userName);

	int pointPayment(User user);

	int shareBookBorrowEnd(ShareBookBorrow entity);


}
