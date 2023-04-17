package com.scent.perfume.util;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MultipartFileUtil {
	
	// 파일 저장
	public static String save(MultipartFile upfile, String location) {
		String renamedFileName = null;
		String originalFileName = upfile.getOriginalFilename();
		
		log.info("Upfile Name : {}", originalFileName);
		log.info("location : {}", location);
		
		// location이 실제로 존재하지 않으면 폴더를 생성하는 로직
		File folder = new File(location);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		renamedFileName = 
				LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS")) + // renamedFileName 만들 형태 지정 년월일_시분초밀리세컨트
				originalFileName.substring(originalFileName.lastIndexOf("."));	// 확장자만 떼서 붙여줌
		
		try {
			// 업로드한 파일 데이터를 지정한 파일에 저장한다.
			upfile.transferTo(new File(location + "/" + renamedFileName));
			// upfile 지금 상태는 물리적인 위치에 저장된 상태가 아니라 메모리에만 저장된 상태. 물리적인 상태에 저장하기 위해 transferTo()사용
			// transferTo(new로 location위치에 renamedFileName으로 저장. File오브젝트 생성)
			
		} catch (IllegalStateException | IOException e) {
			log.error("파일 전송 에러");
			e.printStackTrace();
		}
		
		return renamedFileName;
	}

	// 파일 삭제
	public static void delete(String location) {
		log.info("location : {}", location);
		
		File file = new File(location);
		
		// 파일이 존재하면 삭제
		if(file.exists()) {
			file.delete();
		}
	}
}