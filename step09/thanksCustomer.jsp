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
	<% String cartId = session.getId(); 
		String shipping_cartId ="";
		String shipping_name ="";
		String shipping_address ="";
		String shipping_post_num ="";
		
		//까까안의 모든 데이터를 얻어서 배열로 저장하고 loop를 돌려 속성값을 꺼내 변수에 저장
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(int i=0; i<cookies.length; i++){
				Cookie thisCookie = cookies[i];
				String n = thisCookie.getName();
				//out.println(n);
				
				if(n.equals("shipping_cartId")) shipping_cartId = thisCookie.getValue();
				if(n.equals("shipping_name")) shipping_name = thisCookie.getValue();
				if(n.equals("shipping_address")) shipping_address = thisCookie.getValue();
				if(n.equals("shipping_post_num")) shipping_post_num = thisCookie.getValue();
				if(n.equals("shipping_cartId")) shipping_cartId = thisCookie.getValue();
			}
		}
	%>
	
	<%@ include file="/menu.jsp" %>
	<%@ include file="../header.jsp" %>
	<div class="jumbotron">
		<div class="single-slider slider-height2 d-flex align-items-center">
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	<!-- .container>.row>.col-md-6>h3+p+p*4>b^h3+p -->
	<div class="container">
		<div class="col">
			<div class="row"> <br/>
				<h2 class="alert-success text-center">주문해 주셔서 감사합니다</h2> <br/>
				<p>주문번호 : <%  %></p> <br/>
				<p>송장번호 : 7238662409</p> <br/>
				<p>주문은 내일 배송예정입니다.</p> <br/>
			</div>
		</div>
	</div>
	<div class="container">
		<p>
			<a href="./products.jsp" class="btn btn-secondary">상품 목록 페이지로 바로 이동</a>
		</p>
	</div>
	
	<%
		//세션 정보를 모두 삭제
		session.invalidate();
		//쿠키 정보를 모두 삭제
		for(Cookie thisCookie : cookies){
			thisCookie.setMaxAge(0);
			response.addCookie(thisCookie);
		}
	%>
	<%@ include file="../footer.jsp" %>
	
</body>
</html>