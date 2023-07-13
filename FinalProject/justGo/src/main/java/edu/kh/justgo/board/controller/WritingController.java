package edu.kh.justgo.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.board.model.service.BoardService;
import edu.kh.justgo.board.model.service.WritingService;
import edu.kh.justgo.member.model.dto.Member;

@SessionAttributes({ "loginMember" })
@Controller
public class WritingController {

	@Autowired
	private WritingService service;
	
	@Autowired // 게시글 수정 시 상세조회 서비스 호출용
	private BoardService boardService;

	
	
	// 1:1문의 쓰기 연결
	@GetMapping("/ask/writingAsk")
	public String writingQuestion() {
		return "ask/writingAsk";
	}
	

	// 글쓰기 연결
	@GetMapping("/writing/writingBoard")
	public String writingBoard(Model model,
			@RequestParam int footerCheck,
			@RequestParam String boardCode,
			@RequestParam String countryNo
			) {
		
		// 상준 시작
		int realFooter = 0;
		
		if (footerCheck == 1 && boardCode == "" && countryNo == "") {
		    realFooter = 1;
		} else {
			realFooter = 0;
		}
		model.addAttribute("realFooter", realFooter);
//		System.out.println("그래서 realFooter는 "+realFooter);
		// 상준 끝
		
		List<Board> writingList = boardService.writingList();
		List<Board> boardTypeList3 = boardService.boardTypeList3();
		
		model.addAttribute("writingList", writingList);
		model.addAttribute("boardTypeList3", boardTypeList3);
		
		
		
		return "board/writingBoard";
	}

	
	
	// 포스트 연결
	@GetMapping("/writing/post")
	public String post() {
		return "writing/post";
	}

	// 게시글 작성 
	@PostMapping("/board/write")
	public String boardInsert(
			Board board
			,@SessionAttribute("loginMember") Member loginMember
			, RedirectAttributes ra
			,HttpSession session,Model model) throws IllegalStateException, IOException {
		
		
		// 로그인한 회원 번호를 얻어와 board에 세팅
		board.setMemberNo(loginMember.getMemberNo());
		
		// 자유/질문 게시판 선택 O : boardCode > 0, countryNo == 0
		// 자유/질문 게시판 선택 X : boardCode == 0, countryNo > 0

		if (board.getBoardCode() == 0) {
			board.setBoardCode(1); // 여행 게시판
		}
		

		int result = service.boardInsert(board);

		String message = null;
		String path = "redirect:/";

		if (result > 0) { // 성공 시
			int boardNo = board.getBoardNo();
			
			message = "게시글 등록에 성공했습니다.";
	
			if(board.getBoardCode() != 1) {
				path += "board/" + board.getBoardCode() + "/" + boardNo;
			}else {
				path += "board/1/" + board.getCountryNo() + "/" + boardNo;
			}
	

		} else {
			message = "게시글 등록에 실패했습니다.";
			path += "board/writingBoard"; // 게시글 쓰는 화면
		}

		ra.addFlashAttribute("message", message);

//		System.out.println(path);

		
		 
		return path;

	}
	
	
	// 게시글 이미지 업로드 비동기
	@ResponseBody
	@PostMapping("/writing/uploadImage")
	public String imageUpload(
			@RequestParam("file") MultipartFile file,
			@SessionAttribute("loginMember") Member loginMember,
			HttpSession session ) throws IllegalStateException, IOException {
		
		String webPath = "/resources/images/memberImage/"+loginMember.getMemberNo()+"/";
		String filePath = session.getServletContext().getRealPath(webPath);
		
		File checkFolder = new File(filePath);
		if (!checkFolder.exists()) checkFolder.mkdirs(); // 폴더가 없는 경우 만들기(상준 코드 확인)

		
		return service.imageUpload(file,webPath,filePath);
	}
	


	
	// 게시글 수정 화면 전환 // 자유/질문
	@GetMapping("/writing/{boardCode}/{boardNo}/update")
	public String boardUpdate(
			@PathVariable("boardCode") int boardCode
			,@PathVariable("boardNo") int boardNo
			,Model model // jsp로 전달하는 객체
			) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardCode", boardCode);
		map.put("boardNo", boardNo);
		
		 
		Board board = boardService.selectBoard(map);
		

		List<Board> typeList = boardService.boardTypeList();
		
		List<Board> typeList3 = boardService.boardTypeList3();
		
		
		model.addAttribute("board", board); // forward(요청위임) -> request scope 유지 
		model.addAttribute("typeList", typeList);
		model.addAttribute("typeList3",typeList3);
		
		return "board/writingUpdate";
	}
	
	// 게시글 수정 화면 전환 // 여행게시판 
	@GetMapping("/writing/{boardCode}/{countryNo}/{boardNo}/update")
	public String boardUpdate(
			@PathVariable("boardCode") int boardCode
			,@PathVariable("countryNo") int countryNo
			,@PathVariable("boardNo") int boardNo
			,Model model // jsp로 전달하는 객체
			) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardCode", boardCode);
		map.put("countryNo", countryNo);
		map.put("boardNo", boardNo);
	
		
		 
		Board board = boardService.selectBoard(map);
		
		List<Board> typeList2 = boardService.boardTypeList2();
		List<Board> typeList3 = boardService.boardTypeList3();
		
		model.addAttribute("board", board); // forward(요청위임) -> request scope 유지 
		model.addAttribute("typeList2", typeList2);
		model.addAttribute("typeList3", typeList3);
		
		return "board/writingUpdate";
	}
	
	
	
	// 게시글 수정 (자유/질문)
	@PostMapping("/writing/{boardCode}/{boardNo}/update")
	public String boardUpdate(
			Board board // 커멘드 객체 (name==필드 경우 필드에 파라미터 세팅)
			,@RequestParam(value="cp", required=false, defaultValue="1") int cp // 쿼리스트링 유지
			,@PathVariable("boardCode") int boardCode
			,@PathVariable("boardNo") int boardNo
			,HttpSession session 
			,RedirectAttributes ra
			) {
		
		// 1) boardCode, boardNo를 board에 세팅
		board.setBoardCode(boardCode);
		board.setBoardNo(boardNo);
		
		
		// 2) 게시글 수정 서비스 호출
		int result  = service.writingUpdate(board);
		
		// 3) 결과에 따라 message 설정
		String message = null;
		String path = "redirect:";
		
		if(result >0) {
			message = "게시글이 수정되었습니다";
			path += "/board/"+boardCode+"/"+boardNo+"?cp" + cp; // 상세조회 페이지
		}else {
			message = "게시글 수정에 실패하였습니다";
			path += "update";
		}
		ra.addFlashAttribute("message", message);
		
		return path;
	}
	

	// 게시글 수정 (여행)
		@PostMapping("/writing/{boardCode}/{countryNo}/{boardNo}/update")
		public String boardUpdate2(
				Board board // 커멘드 객체 (name==필드 경우 필드에 파라미터 세팅)
				,@RequestParam(value="cp", required=false, defaultValue="1") int cp // 쿼리스트링 유지
				,@PathVariable("boardCode") int boardCode
				,@PathVariable("countryNo") int countryNo
				,@PathVariable("boardNo") int boardNo
				,HttpSession session 
				,RedirectAttributes ra
				) throws IllegalStateException, IOException {
			
			// 1) boardCode, boardNo를 board에 세팅
			board.setBoardCode(boardCode);
			board.setBoardNo(boardNo);
			board.setCountryNo(countryNo);
			String th = board.getThumbnail();
			
//			System.out.println("th :" + th);
			
			
			// 2) 게시글 수정 서비스 호출
			int result  = service.writingUpdate2(board);
			
			// 3) 결과에 따라 message 설정
			String message = null;
			String path = "redirect:";
			
			if(result >0) {
				message = "게시글이 수정되었습니다";
				path += "/board/"+boardCode+"/"+countryNo+"/"+boardNo+"?cp" + cp; // 상세조회 페이지
			}else {
				message = "게시글 수정에 실패하였습니다";
				path += "update";
			}
			ra.addFlashAttribute("message", message);
			
			return path;
		}
		
		
		// 게시물 삭제 (자유/질문)
		@GetMapping("/writing/{boardCode}/{boardNo}/delete")
		public String writingDelete(
				Board board
				,@PathVariable("boardCode") int boardCode
				,@PathVariable("boardNo") int boardNo
				,RedirectAttributes ra
				) {
			
			// boardCode,boardNo를 board에 세팅
			board.setBoardCode(boardCode);
			board.setBoardNo(boardNo);
			
			int result = service.writingDelete(board);
			
			String message = null;
			String path = "redirect:"; 
			// 주소를 요청 처리 후 자체적인 화면이 없어서 요청 화면이 있는 주소로 다시 호출
			
			if(result > 0) {

				message = "게시글 삭제 성공하였습니다.";
				path += "/board/" + boardCode ; // /board/2(자유일때)
												// 삭제 후 -> 목록 조회 주소로 요청 
			}else {
				message = "게시글 삭제가 실패하였습니다.";
				path += "/writing/" + boardCode + boardNo;


			}
			ra.addFlashAttribute("message", message);
			
			return path;
		}
		
		// 게시물 삭제 (여행)
		@GetMapping("/writing/{boardCode}/{countryNo}/{boardNo}/delete")
		public String wiritngDelete2(
				Board board
				,@PathVariable("boardCode") int boardCode
				,@PathVariable("countryNo") int countryNo
				,@PathVariable("boardNo") int boardNo
				, RedirectAttributes ra
				) {
			
			board.setBoardCode(boardCode);
			board.setCountryNo(countryNo);
			board.setBoardNo(boardNo);
			
			int result = service.wiritngDelete2(board);
			
			String message = "";
			String path = "redirect:";  //주소를 요청 처리 후 자체적인 화면이 없어서 요청 화면이 있는 주소로 다시 호출 여행게시글(목록 조회)
			
			if(result>0) {

				message= "게시글 삭제 성공하였습니다";
				path += "/board/1/" +countryNo;
			} else {
				message = "게시글 삭제가 실패하였습니다";
				path += "/writing/1/" + countryNo+ "/" + boardNo;

				
			}
			ra.addFlashAttribute("message", message);
			
			return path;
		}
		
		
	
	            
	
	

}
