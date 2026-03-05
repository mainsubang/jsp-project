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
	<div class="single-slider slider-height2 d-flex align-items-center">
		<div class="container">
			<h1 class="display-3" >장바구니</h1>
		</div>
	</div>
	<!-- .container>.row>.col-md-6>h3+p+p*4>b^h3+p -->
	<div class="container">
		<div class="row">
			<h1 class="col text-center">영수증</h1>
		</div>
		<div class="row">
			<div class="col-4 text-left">
				<strong>배송 주소</strong><br/>
				성명 : <%out.println(shipping_name); %><br />
				우편번호 : <%out.println(shipping_post_num); %><br />
				주소 : <%out.println(shipping_address); %><br />
			</div>
			<div class="col-4 col-offset-4 text-right">
				<strong>배송 송장번호</strong><br />
				20812081
			</div>
		</div>
	</div>
	
	<div class="row">
		<table class="table">
			<tr>
				<th class="text-center">제품명</th>
				<th class="text-center">수량</th>
				<th class="text-center">가격</th>
				<th class="text-center">소개</th>
			</tr>
			<table class="table">
  			<thead>
			    <tr>
			      <th scope="col">상품</th>
			      <th scope="col">가격</th>
			      <th scope="col">수량</th>
			      <th scope="col">소계</th>
			      <th scope="col">비고</th>
			    </tr>
			  </thead>
			  <tbody>
			  <%
			  	int sum = 0; //결재총액
			  	ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("Cartlist");
			  	
			  	if(cartList == null) cartList = new ArrayList<Product>();
			  	
			  	for(int i=0; i<cartList.size(); i++){
			  		Product product = cartList.get(i);
			  		int total = product.getUnitPrice() * product.getQuantity();
			  		sum += total;
			  	
			  %>
			    <tr>
			      <th scope="row"><%=product.getProductId() %> | <%=product.getPname() %></th>
			      <td><%=df.format(product.getUnitPrice()) %></td>
			      <td><%=product.getQuantity() %></td>
			      <td><%=df.format(total) %></td>
			      
			    </tr>
			    <%
			  		}
			    %>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=df.format(sum) %></th>
					
				</tr>
			  </tbody>
		</table>
		<div style="display: block; margin-left: auto; margin-right: auto;">
			<a href="./shippinginfo.jsp?cartId=<%=shipping_cartId%>" class="btn btn-info">이전</a>
			<a href="./thanksCustomer.jsp" class="btn btn-warning">주문완료</a>
			<a href="./checkoutcancelled.jsp" class="btn btn-danger">취소</a>
		</div>
	</div>
	
	<%@ include file="../footer.jsp" %>
	
</body>
</html>