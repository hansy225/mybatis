<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#list-area {
		border: 1px solid;
		border-collapse: collapse;
	}
	#list-area tr, #list-area th, #list-area td {
		border: 1px solid;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="outer">
		<h2>게 시 판</h2>
		
		<div id="search-area">
			
		</div>
		
		
		<table id="list-area" align="center">
			<thead>
				<tr>
					<th>글번호</th>
					<th style="width: 150px;">제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			
			<tbody>
			
			</tbody>
		</table>
		
		
		<div id="paging-area">
		
		</div>
	</div>
</body>
</html>