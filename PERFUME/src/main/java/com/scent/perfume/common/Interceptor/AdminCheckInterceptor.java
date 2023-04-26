package com.scent.perfume.common.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.scent.perfume.planning.model.vo.Member;

public class AdminCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Member loginMember = (Member)request.getSession().getAttribute("loginMember");
		
		if(loginMember == null || loginMember.getDivision() != 1) {
			request.setAttribute("msg","잘못된 경로로 접근하셨습니다.");
			request.setAttribute("location","/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);

			return false;
		}
		
		return super.preHandle(request, response, handler);
	}

	
	
	
	
	
}
