package com.library.bookhub.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.library.bookhub.entity.BookShare;
import com.library.bookhub.entity.ShareBookBorrow;
import com.library.bookhub.entity.User;

@Mapper
public interface BookShareRepository {
	
	public int shareBookWrite(BookShare bookShare);
	public List<BookShare> getShareBookALL();
	public BookShare getShareBook(int id);
	public ShareBookBorrow selectShareBookBorrow(ShareBookBorrow entity);
	public int shareBookBorrow(ShareBookBorrow entity);
	public BookShare shareBookInfo(int bookId);
	public int borrowShareBook(BookShare book);
	public int borrowShareBookEnd(BookShare book);
	public User getUser(String userName);
	public int pointPayment(User user);
	public int shareBookBorrowEnd(ShareBookBorrow entity);


}
