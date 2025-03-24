package com.mybatis.board.controller;

import java.io.IOException;

import com.mybatis.board.service.BoardService;
import com.mybatis.board.service.BoardServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 조회수 증가시키기
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		BoardService bService = new BoardServiceImpl();
		
		
		// 조회수 증가가 잘되었으면 검색하여 boardDetailView.jsp로 가져가기
		
		request.getRequestDispatcher("WEB-INF/views/board/boardDetailView.jsp").forward(request, response);
	}

}