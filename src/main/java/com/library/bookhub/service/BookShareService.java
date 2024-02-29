package com.library.bookhub.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.library.bookhub.entity.Book;
import com.library.bookhub.entity.BookBorrow;
import com.library.bookhub.entity.BookShare;
import com.library.bookhub.entity.ShareBookBorrow;
import com.library.bookhub.entity.User;
import com.library.bookhub.handler.exception.CustomRestFulException;
import com.library.bookhub.repository.BookShareRepository;
import com.library.bookhub.repository.PointRepository;
import com.library.bookhub.utils.Define;
import com.library.bookhub.web.dto.share.ShareBookBorrowDto;
import com.library.bookhub.web.dto.share.ShareWriteReqDto;

@Service
public class BookShareService {

	@Autowired
	private BookShareRepository repository;
	
	@Autowired
	private PointRepository pointRepository;

	public boolean shareBookWrite(ShareWriteReqDto dto) {
		
		// 파일업로드 처리
        MultipartFile file = dto.getFile();
        if (file.isEmpty() == false) {
            if (file.getSize() > Define.MAX_IMG_FILE_SIZE) {
                throw new CustomRestFulException("파일 크기는 5MB 이상 클 수 없습니다.", HttpStatus.BAD_REQUEST);
            }

            String saveDirectory = Define.UPLOAD_FILE_DERECTORY;
            File dir = new File(saveDirectory);
            if (dir.exists()) {
                dir.mkdir();
            }

            // 파일이름
            UUID uuid = UUID.randomUUID();
            String fileName = uuid + "_" + file.getOriginalFilename();
            System.out.println("filename : " + fileName);

            String uploadPath = Define.UPLOAD_FILE_DERECTORY + File.separator + fileName;
            File destination = new File(uploadPath);

            try {
                file.transferTo(destination);
            } catch (IllegalStateException | IOException e) {
                e.printStackTrace();
            }
            BookShare bookShare = BookShare.builder()
            		.bookName(dto.getBookName())
            		.company(dto.getCompany())
            		.writer(dto.getWriter())
            		.descript(dto.getDescript())
            		.userName(dto.getUserName())
            		.file(fileName)
            		.build();
            int result = repository.shareBookWrite(bookShare);
            return result != 0;
        }
		return false;
	}

	public boolean orderMyPoint(String userName, int price) {
		User user = pointRepository.getUser(userName);
		if(user != null) {
			user.setPoint(user.getPoint() - price);
			int userPointUpdateResult = pointRepository.userPointUpdate(user);
			if(userPointUpdateResult == 0) {
				throw new RuntimeException("유저 포인트 정보 업데이트 실패!");
			}
			return true;
		}
		return false;
	}

	public List<BookShare> getShareBookALL() {
		return repository.getShareBookALL();
	}

	public BookShare getShareBook(int id) {
		return repository.getShareBook(id);
	}

	public boolean shareBookBorrow(ShareBookBorrowDto dto) {
		// 현재 시간 + 7일 = 반납일자 / 형태 2024-02-16 17:40:57
		LocalDateTime now = LocalDateTime.now().plusDays(dto.getBorrowDay());
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String returnDate = now.format(formatter);
		dto.setWdate(returnDate);
		// 만약 borrow 테이블에 이미 내역이 존재하면 대출이 되어선 안됨
		ShareBookBorrow borrowEntity = repository.selectShareBookBorrow(dto.toEntity());
		if(borrowEntity != null) {
			return false;
		}
		int userResult = repository.shareBookBorrow(dto.toEntity());
		if(userResult == 0) {
			throw new RuntimeException("bh_book_share_borrow에 대출정보 등록 실패!");
		}
		
		BookShare book = repository.shareBookInfo(dto.getBookId());

		// 북에 대출건수 +1 하고, 대출여부 수정해야함
		if(book != null) {
			book.setBorrow(book.getBorrow() + 1);
			book.setStatus("대출 불가");
			book.setWdate(returnDate);
			int bookResult = repository.borrowShareBook(book);
			if(bookResult == 0) {
				throw new RuntimeException("bh_book에 대출정보 수정 실패!");
			}
			return true;
		}
		return false;
	}

	@Transactional
	public boolean pointPayment(int point, String masterUsername, String userName) {
		// 마스터 - 빌려주는 쪽
		// 유저정보 둘 다 들고와서 각각 + - 포인트 처리
		User masterUser = repository.getUser(masterUsername);
		User borrowUser = repository.getUser(userName);
		masterUser.setPoint(masterUser.getPoint() + point);
		borrowUser.setPoint(borrowUser.getPoint() - point);
		
		if(masterUser != null && borrowUser != null) {
			int masterResult = repository.pointPayment(masterUser);
			if(masterResult == 0) {
				throw new RuntimeException("계정 포인트 수정 실패!");
			}
			int borrowUserResult = repository.pointPayment(borrowUser);
			if(borrowUserResult == 0) {
				throw new RuntimeException("계정 포인트 수정 실패!");
			}
			return true;
		}
		return false;
	}

	public boolean shareBookBorrowEnd(ShareBookBorrowDto dto) {
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String returnDate = now.format(formatter);
		dto.setWdate(returnDate);
		
		ShareBookBorrow borrowEntity = repository.selectShareBookBorrow(dto.toEntity());
		if(borrowEntity != null) {
			return false;
		}
		// 대출내역이 있으면 반납기능 수행
		int borrowEndresult = repository.shareBookBorrowEnd(dto.toEntity());
		if(borrowEndresult == 0) {
			throw new RuntimeException("bh_book_share_borrow 테이블에 대출기록 삭제 실패!");
		}
		// book 정보 수정
		BookShare book = repository.shareBookInfo(dto.getBookId());
		if(book != null) {
			book.setStatus("대출 가능");
			book.setBorrow(book.getBorrow());
			book.setWdate(returnDate);
			int bookResult = repository.borrowShareBook(book);
			if(bookResult == 0) {
				throw new RuntimeException("bh_book_share에 대출정보 수정 실패!");
			}
			return true;
		}
		return false;
	}
	
	
	
	
}

















