package com.kh.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

// 인터페이스를 구현해야 함 --> implements 키워드 사용
public class MyFileRenamePolicy implements FileRenamePolicy {
	
	// 반드시 미완성된 rename이라는 추상메소드를 오버라이딩해서 구현해야함!!
	// 기존 파일을 전달받아서 파일명 수정작업 후에 수정된 파일을 반환시켜줄 것
	// 매개변수 File 객체
	// 반환 File 객체
	
	@Override
	public File rename(File originFile) {
		
		// 원본 파일명 뽑기 => 매개변수로 전달받은 원본 파일로부터
		String originName = originFile.getName();
		
		// 수정파일명 만들기(규칙) => 최대한 이름이 겹치지 않도록 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		// 파일이 업로드된 시간(년월일시분초) + 5자리 랜덤값(10000 ~ 99999) + 확장자
		// 확장자 : 원본파일 그대로(원본파일명에서 뽑아서)
		
		/*
		 * 원본명					수정명
		 * aaa.jpg			=> makao_2023041117353299999.jpg 형태로 반환
		 */
		
		// 1. 파일이 업로드된 시간 추출 => String currentTime;
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 2. 5자리 랜덤값 추출 => int ranNum;
		int ranNum = (int)(Math.random() * 90000) + 10000;
		
		// 3. 확장자 뽑기 => String ext
		// lastIndexOf(찾고자하는 문자열) + substring()
		String ext = originName.substring(originName.lastIndexOf("."));
		
		
		// 1 + 2 + 3조합해서 수정파일명을 변수에 담기
		String changeName = "makao_" + currentTime + "_" + ranNum + ext;
		
		// 기존파일을 수정된 파일명으로 적용시켜서 반환
		return new File(originFile.getParent(), changeName);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
