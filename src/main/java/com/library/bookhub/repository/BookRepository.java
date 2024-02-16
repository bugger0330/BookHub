package com.library.bookhub.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.library.bookhub.entity.Book;
import com.library.bookhub.entity.BookBorrow;

@Mapper
public interface BookRepository {
	
	public List<Book> bookListAll();
	public Book bookInfo(int id);
	
	// 대출
	public int borrowUser(BookBorrow bookBorrow);
	public int borrowBook(int id);
}
