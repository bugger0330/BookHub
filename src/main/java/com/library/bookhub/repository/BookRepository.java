package com.library.bookhub.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.library.bookhub.entity.Book;
import com.library.bookhub.entity.BookBorrow;

@Mapper
public interface BookRepository {
	
	public List<Book> bookListAll(int pageNum);
	public Book bookInfo(int id);
	
	public int borrowUser(BookBorrow bookBorrow);
	public int borrowBook(Book book);
	public BookBorrow selectBorrow(@Param("bookId") int bookId, @Param("username")  String username);
	
	public int borrowUserEnd(int id);
	public int borrowBookEnd(Book book);
	
	public List<Book> findByBookOption(@Param("option") String option, @Param("inputValue") String inputValue);
	

	
	
	
}
