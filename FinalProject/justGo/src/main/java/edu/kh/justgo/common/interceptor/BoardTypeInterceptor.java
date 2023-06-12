package edu.kh.justgo.common.interceptor;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import edu.kh.justgo.board.model.service.BoardService;

public class BoardTypeInterceptor implements HandlerInterceptor {

	@Autowired
	private BoardService service;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		ServletContext application = request.getServletContext();
		
		if(application.getAttribute("boardTypeList")==null) {
			
			// 조회 서비스 호출
			System.out.println("BOARD_TYPE 조회 서비스 호출");
			
			List<Map<String,Object>> boardTypeList 
			= service.selectBoardTypeList();
			
			System.out.println(boardTypeList);
			// application scope 에 세팅
			application.setAttribute("boardTypeList", boardTypeList);
			
		}
		
//		if(application.getAttribute("countryList")==null) {
//			
//			System.out.println("countryList 조회 서비스 호출!");
//			
//			List<Map<String, Object>> countryList 
//			= service.selectCountryList();
//			
//			System.out.println(countryList);
//			
//			application.setAttribute("countryList", countryList);
//		}
//		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
	
	
	
	
	
}
