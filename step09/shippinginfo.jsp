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
<body>
	<%@ include file="/menu.jsp" %>
	<%@ include file="../header.jsp" %>
	<div class="jumbotron">
		<div class="single-slider slider-height2 d-flex align-items-center">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<!-- .container>.row>.col-md-6>h3+p+p*4>b^h3+p -->
	<div class="container mt--5 pt-5">
		<div class="row">
			<form action="./processshippinginfo.jsp?" method="post">
		<input type="text" name='cartId'  value="<%=request.getParameter("cartId") %>" />	
  <div class="form-group">
    <label for="name">성명</label>
    <input type="text" class="form-control" id="name" name="name">
  </div>

  <div class="form-group my-4">
    <label for="address">배송주소</label>
    <input type="text" class="form-control" id="address" name="address">
  </div>
  
  <div class="form-group my-4">
    <label for="post_num">우편번호</label>
    <input type="text" class="form-control" id="post_num" name="post_num">
  </div>
	
	<a href="./cart.jsp?cartId=<%request.getParameter("cartId"); %>" class="btn btn-secondary">이전</a>
  <input type="submit" class="btn btn-primary" value="등록">
</form>
			
		</div>
	</div>
	
	
	<%@ include file="../footer.jsp" %>
	
</body>
</html>