package com.mybatis.board.controller;

import java.io.IOException;

import com.mybatis.board.service.BoardService;
import com.mybatis.board.service.BoardServiceImpl;
import com.mybatis.board.vo.Reply;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ReplyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService bService = new BoardServiceImpl();
		
		Reply r = new Reply();
		r.setRefBno(Integer.parseInt(request.getParameter("bno")));
		r.setReplyWriter(request.getParameter("writer"));
		r.setReplyContent(request.getParameter("content"));
		
		int result = bService.replyInsert(r);
		
		response.getWriter().print(result);
	}

}
