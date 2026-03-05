<%@page import="dao.ProductRepository"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product</title>
</head>
<body class="blog-page">
	<%@ page import="mvc.model.BoardDTO" %>
	<%
		BoardDTO notice = (BoardDTO)request.getAttribute("Board"); 
		int num = (Integer)request.getAttribute("num");
		int nowpage = (Integer)request.getAttribute("page");
	%>
	<%@ include file="/menu.jsp" %>
	<%@ include file="../header.jsp" %>
	<div class="jumbotron">
		<div class="single-slider slider-height2 d-flex align-items-center">
			<h1 class="display-3">게시판 세부 내용</h1>
		</div>
	</div>
	<!-- .container>.row>.col-md-6>h3+p+p*4>b^h3+p -->
	<div class="container">
		<div class="row">
			<div class="col">
			
				<form name="newwrite" action="./boardwriteaction.do"
				class="form-horizontal" method="post" onsubmit="return checkform()">
				<div class="form-group row">
				<label class="col-sm-2 control-label" >이름</label>
				<div class="col-sm-3">
				<input name="name" type="text" class="form-control" value="<%=notice.getName() %>"
				placeholder="name">
				</div>
				</div>
				<div class="form-group row">
				<label class="col-sm-2 control-label" >제목</label>
				<div class="col-sm-5">
				<input name="subject" type="text" class="form-control"
				value="<%=notice.getSubject() %>">
				</div>
				</div>
				<div class="form-group row">
				<label class="col-sm-2 control-label" >내용</label>
				<div class="col-sm-8">
				<textarea name="content" cols="50" rows="5" class="form-control"><%=notice.getContent() %></textarea>
				</div>
				</div>
				<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
				<input type="button" class="btn btn-primary " value="수정">
				<a href="./BoardListAction.do?pageNum=<%=nowpage %>" class="btn btn-info">목록</a>
				<input type="button" class="btn btn-success " value="삭제">
				<input type="button" class="btn btn-success " value="이전" onclick="history.back();">
				</div>
				</div>
				</form>
					
				</div>
			</div>
		</div>
	</div>
	
	
	<%@ include file="/footer.jsp" %>
	
</body>
</html>