package edu.kh.justgo.board.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.justgo.board.model.dto.Board;
import edu.kh.justgo.board.model.service.BoardService;
import edu.kh.justgo.member.model.dto.Member;
import oracle.jdbc.proxy.annotation.Post;

@SessionAttributes({ "loginMember" })
@RequestMapping("/board")
@Controller
public class BoardController {

	@Autowired
	public BoardService service;

	// 공지사항 연결
	@GetMapping("/boardNotice")
	public String boardNotice() {
		return "/board/boardNotice";

	}

	// 게시글 목록
	@GetMapping("/{boardCode:[2-9]|[1-9][0-9]+}")
	public String selectBoardList(@PathVariable("boardCode") int boardCode,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model,
			@RequestParam Map<String, Object> paramMap) {
		if (paramMap.get("key") == null) { // 수정3
			Map<String, Object> map = service.selectBoardList(boardCode, cp);

			model.addAttribute("map", map);
		} else { // 검색어가 있을 때 (검색 o)

			paramMap.put("boardCode", boardCode);

			Map<String, Object> map = service.selectBoardList(paramMap, cp); // 오버로딩

			model.addAttribute("map", map);
		}
		return "board/boardFree";
	}

	// 1:1문의 연결(/board/4 버전)
	@GetMapping("/4")
	public String writingQuestion() {
		return "/writing/writingQuestion";
	}

	// 여행게시판 게시글
	@GetMapping("/1/{countryNo}")
	public String countryList(@PathVariable("countryNo") int countryNo,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model,
			@RequestParam Map<String, Object> paramMap) {

		if (paramMap.get("key2") == null) {

			Map<String, Object> map = service.countryList(countryNo, cp);

			model.addAttribute("map", map);

		} else {
			paramMap.put("countryNo", countryNo);

			Map<String, Object> map = service.selectCountryList(paramMap, cp); // 오버로딩

			model.addAttribute("map", map);
		}
		return "account/boardCountry";
	}

	// 게시글 상세확인
	@GetMapping("/{boardCode:[2-9]|[1-9][0-9]+}/{boardNo}")
	public String boardDetail(@PathVariable("boardCode") int boardCode, @PathVariable("boardNo") int boardNo,
			Model model, RedirectAttributes ra,
			@SessionAttribute(value = "loginMember", required = false) Member loginMember, HttpServletRequest req,
			HttpServletResponse resp) throws ParseException {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardCode", boardCode);
		map.put("boardNo", boardNo);

		Board board = service.selectBoard(map);

		String path = null;

		if (board != null) {
			// 좋아요 체크
			if (loginMember != null) {

				map.put("memberNo", loginMember.getMemberNo());

				int result = service.boardLikeCheck(map);
				System.out.println(result);

				if (result > 0)
					model.addAttribute("likeCheck", "on");
			}

			//
			if (loginMember == null || loginMember.getMemberNo() != board.getBoardNo()) {

				Cookie c = null;
				Cookie[] cookies = req.getCookies();

				if (cookies != null) {
					for (Cookie cookie : cookies) {
						if (cookie.getName().equals("readBoardNo")) {
							c = cookie;
							break;
						}
					}

				}

				int result = 0;

				if (c == null) {
					// 쿠키가 존재하지 않아서 하나 생성해줌
					c = new Cookie("readBoardNo", "|" + boardNo + "|");

					// 조회수 증가 서비스 호출

					result = service.updateReadCount(boardNo);

				} else {
					if (c.getValue().indexOf("|" + boardNo + "|") == -1) {
						// 쿠키에 현재 게시글 번호가 없다면

						// 기존 값에 게시글 번호 추가해서 다시 세팅
						c.setValue(c.getValue() + "|" + boardNo + "|");

						result = service.updateReadCount(boardNo);
					}

				}

				if (result > 0) {
					board.setReadCount(board.getReadCount() + 1);

					c.setPath("/");
					Calendar cal = Calendar.getInstance();
					cal.add(cal.DATE, 1);

					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

					Date a = new Date();

					Date temp = new Date(cal.getTimeInMillis()); // 내일

					Date b = sdf.parse(sdf.format(temp));

					// 내일 0시 0분 0초 - 현재시간
					long diff = (b.getTime() - a.getTime()) / 1000;

					c.setMaxAge((int) diff); // 수명설정

					resp.addCookie(c);

				}

			}

			path = "writing/post";
			model.addAttribute("board", board);

		} else { // 조회 결과가 없을 경우

			path = "redirect:/board/" + boardCode; // 게시판 첫 페이지로 redirect

			ra.addFlashAttribute("message", "해당 게시글이 존재하지 않습니다.");

		}

		return path;
	}

	// 여행게시판 상세글 조회
	@GetMapping("/1/{countryNo}/{boardNo}")
	public String boardCountryDetail(@PathVariable("countryNo") int countryNo, @PathVariable("boardNo") int boardNo,
			Model model, RedirectAttributes ra,
			@SessionAttribute(value = "loginMember", required = false) Member loginMember, HttpServletRequest req,
			HttpServletResponse resp) throws ParseException {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("countryNo", countryNo);
		map.put("boardNo", boardNo);

		Board board = service.boardCountryDetail(map);

		String path = "";

		if (board != null) {
			// 좋아요 체크
			if (loginMember != null) {

				map.put("memberNo", loginMember.getMemberNo());

				int result = service.boardLikeCheck(map);
				System.out.println(result);

				if (result > 0)
					model.addAttribute("likeCheck", "on");
			}

			//
			if (loginMember == null || loginMember.getMemberNo() != board.getBoardNo()) {

				Cookie c = null;
				Cookie[] cookies = req.getCookies();

				if (cookies != null) {
					for (Cookie cookie : cookies) {
						if (cookie.getName().equals("readBoardNo")) {
							c = cookie;
							break;
						}
					}

				}

				int result = 0;

				if (c == null) {
					// 쿠키가 존재하지 않아서 하나 생성해줌
					c = new Cookie("readBoardNo", "|" + boardNo + "|");

					// 조회수 증가 서비스 호출

					result = service.updateReadCount(boardNo);

				} else {
					if (c.getValue().indexOf("|" + boardNo + "|") == -1) {
						// 쿠키에 현재 게시글 번호가 없다면

						// 기존 값에 게시글 번호 추가해서 다시 세팅
						c.setValue(c.getValue() + "|" + boardNo + "|");

						result = service.updateReadCount(boardNo);
					}

				}

				if (result > 0) {
					board.setReadCount(board.getReadCount() + 1);

					c.setPath("/");
					Calendar cal = Calendar.getInstance();
					cal.add(cal.DATE, 1);

					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

					Date a = new Date();

					Date temp = new Date(cal.getTimeInMillis()); // 내일

					Date b = sdf.parse(sdf.format(temp));

					// 내일 0시 0분 0초 - 현재시간
					long diff = (b.getTime() - a.getTime()) / 1000;

					c.setMaxAge((int) diff); // 수명설정

					resp.addCookie(c);

				}

			}

			path += "writing/post";
			model.addAttribute("board", board);

		} else { // 조회 결과가 없을 경우

			path += "redirect:/board/1/" + countryNo; // 게시판 첫 페이지로 redirect

			ra.addFlashAttribute("message", "해당 게시글이 존재하지 않습니다.");

		}

		return path;

	}

	// 좋아요 처리
	@PostMapping("/like")
	@ResponseBody
	public int like(@RequestBody Map<String, Integer> paramMap) {
		System.out.println(paramMap);

		return service.like(paramMap);
	}

	// 전체게시판 검색
	@GetMapping("/boardSearch")
	public String searchList(
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model,
			@RequestParam Map<String, Object> paramMap) {


		Map<String, Object> map = service.selectAllList(paramMap, cp); // 오버로딩

		model.addAttribute("map", map);

		return "board/boardSearch";

	}

}
