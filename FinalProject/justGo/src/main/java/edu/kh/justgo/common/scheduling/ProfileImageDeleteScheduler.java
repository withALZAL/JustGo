package edu.kh.justgo.common.scheduling;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import edu.kh.justgo.board.model.service.WritingService;

// DB와 서버 불일치 프로필 이미지 삭제를 위한 스케줄러
@Component
public class ProfileImageDeleteScheduler {

	@Autowired
	private ServletContext servletContext;

	@Autowired
	private WritingService service;

	@Scheduled(cron = "0,30 * * * * *")
	public void profileDummyImage() {
		System.out.println("----- 게시판 프로필 DB 와 서버 불일치 파일 제거 -------");

		// 1. 서버에 저장된 memberImage의 proflie 아래 모든 파일 목록 조회
		// /resources/images/memberImage의 실제 서버 경로를 얻어옴
		String filePath = servletContext.getRealPath("/resources/images/memberImage");
		System.out.println("filePath : " + filePath);

		// 2. filePath에 저장된 모든 파일 목록 읽어오기
		File path = new File(filePath);
		System.out.println("path : " + path);
		File[] folderArr = path.listFiles();

		int[] memberNos = new int[folderArr.length];

		for (int i = 0; i < folderArr.length; i++) {
			// filePath2의 모든 이미지의 폴더 읽어오기
			String filePath2 = folderArr[i].getPath();
			// 파일 경로에서 숫자 부분 추출
			String numberString = filePath2.substring(filePath2.lastIndexOf("\\") + 1);
			System.out.println("numberString : " + numberString);
			if (!numberString.isEmpty()) { // 빈 문자열인 경우에 예외처리를 추가
				memberNos[i] = Integer.parseInt(numberString); // parseInt는 "1,2,3" 숫자 밖에 있는 쌍따옴표을 없애고 int 형식으로 바꾸겠다
			}
			// 숫자 부분을 정수로 변환하여 배열에 저장
			memberNos[i] = Integer.parseInt(numberString);
		}
		// profile에 있는 이미지 불러오기 
		List<String> profileImageList = new ArrayList<String>();
		
		// memberNo을 하나씩 꺼내서 해당 멤버의 디렉토리 경로 생성하기
		for(int memberNo : memberNos) { 
			String profilePath = servletContext.getRealPath("/resources/images/memberImage/"+ memberNo + "/profile/");
			
			File folder = new File(profilePath);
			
			if(folder.exists() && folder.isDirectory()) { // 만약 profile 이 있고 profile 폴더(Directory)가 있다면
				File[] profileImageArr = folder.listFiles();
				for(File image : profileImageArr) {
					profileImageList.add("/resources/images/memberImage/" + memberNo + "/profile/" + image.getName());
				}
			}
		}
		
		
		// DB 파일 목록 조회 -> service에 있는 selectImageList 불러오기
		List<String> dbImageList = service.selectImageList2();
		
		// 프로필 파일 목록에 이미지가 있을 경우 비교
		if(!profileImageList.isEmpty()) {
			for(String profile : profileImageList) {
				
				System.out.println("profile : " + profile);
				
				// DB 파일 목록에 profile 해당 이미지가 있지 않은 경우
				if(!dbImageList.contains(profile)) {
					System.out.println(profile + "삭제 !!");
					
					// 파일 삭제 로직
					
					File fileToDelete = new File(servletContext.getRealPath(profile));
					
					if(fileToDelete.exists()) {
						if(fileToDelete.delete()) {
							System.out.println("파일 삭제 : " + profile);
						}else {
							System.out.println("파일 삭제 실패 : " + profile);
						}
					}
				}
				
			}
		}
		
	}
}

