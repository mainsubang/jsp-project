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
<%!DecimalFormat df = new DecimalFormat("#,###"); %>
	<% String cartId = session.getId(); %>
	<%@ include file="/menu.jsp" %>
	<%@ include file="../header.jsp" %>
	<div class="single-slider slider-height2 d-flex align-items-center">
		<div class="container">
			<h1 class="display-3">주문 취소</h1>
		</div>
	</div>
	<!-- .container>.row>.col-md-6>h3+p+p*4>b^h3+p -->
	<div class="container">
		<div class="row">
			<h2 class="alert alert-danger text-center">주문이 취소되었습니다.</h2>
		</div>
	</div>
	<div class="container">
		<p>
			<a href="./products.jsp" class="btn btn-secondary">상품 페이지로 이동</a>
		</p>
	</div>
	
	<%@ include file="../footer.jsp" %>
	
</body>
</html>