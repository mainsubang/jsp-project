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
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<!-- .container>.row>.col-md-6>h3+p+p*4>b^h3+p -->
	<div class="container">
		<row>
			<table class="table table-bordered table-dark">
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
			      <td><a href="./removecart.jsp?id=<%=product.getProductId() %>" class="btn btn-danger">삭제</a></td>
			    </tr>
			    <%
			  		}
			    %>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=df.format(sum) %></th>
					<th>
						<a href="./deletecart.jsp?cartId=<%=cartId %>" class="btn btn-success" class="btn btn-danger">소멸</a>
						<a href="./shippinginfo.jsp?cartId=<%=cartId %>" class="btn btn-success" class="btn btn-success">주문</a>
						
					</th>
				</tr>
			  </tbody>
			</table>
		</row>
	</div>
	
	
	<%@ include file="../footer.jsp" %>
	
</body>
</html>