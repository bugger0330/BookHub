package com.library.bookhub.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.library.bookhub.entity.BookShare;
import com.library.bookhub.entity.User;
import com.library.bookhub.handler.exception.CustomRestFulException;
import com.library.bookhub.repository.BookShareRepository;
import com.library.bookhub.repository.PointRepository;
import com.library.bookhub.utils.Define;
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
	
	
	
	
}
