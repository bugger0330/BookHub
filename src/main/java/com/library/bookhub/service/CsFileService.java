package com.library.bookhub.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.library.bookhub.entity.cs.CsFileEntity;
import com.library.bookhub.repository.cs.CsFileRepository;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class CsFileService {

	@Autowired
	CsFileRepository csFileRepository;
	
	@Transactional
    public String saveFiles(List<MultipartFile> files) { //files = filepath
        if (files.isEmpty()) {
            //throw new CustomRestfulException("파일이 정상적이지 않습니다.", HttpStatus.BAD_REQUEST);
        }

        String filePath = ""; // filePath 에 넣을 String 값

        for (MultipartFile file : files) { // 다중파일 for문 돌리기, dto.filepath의 타입 MultipartFile 임.
            try {

                // 저장 실행
                // 1) DB에 이미지 저장
                // 2) DB에 이미지를 다운로드 할 수 있는 url 저장 (다운로드 URL 만들기 필요)
                // 3) 파일명(중복이 안되는) : uuid(기본키) 사용(유일값)

                // TODO : 1) uuid 만들기
                String tmpUuid = UUID.randomUUID().toString().replace("-", "");

                // TODO : 2) 다운로드 url 만들기
                String fileDownloadUri = ServletUriComponentsBuilder.fromCurrentContextPath().path("/csfile/get-file/")
                        .path(tmpUuid).toUriString();
                // 최종 url 예 : localhost/filedb/get-file/xxxxiiiii

                // TODO : 3) 위의 정보를 파일 객체에 저장 후 DB save 함수 실행
                CsFileEntity csFileEntity= CsFileEntity.builder().uuid(tmpUuid).originalFileName(file.getOriginalFilename())
                        .fileData(file.getBytes()).build();

                // 저장하기
                int result = csFileRepository.saveFiles(csFileEntity);
                
                if (result < 1) {
                    //throw new CustomRestfulException("이미지 저장시 서버 에러가 발생하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
                }

                filePath += fileDownloadUri + ",";
            } catch (Exception e) {
                log.debug(e.getMessage());
                //throw new CustomRestfulException("이미지 저장시 서버 에러가 발생하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
            }
        }

        filePath = filePath.substring(0, filePath.length() - 1); // 마지막 , 제거
        return filePath;
    }
	
}
