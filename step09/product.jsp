<%@page import="dao.ProductRepository"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="connection.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product</title>
</head>
<body>
<main class="main">
	<%@ include file="/menu.jsp" %>
	<%@ include file="../header.jsp" %>
	<div class="single-slider slider-height2 d-flex align-items-center">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<%
		String id = request.getParameter("id");
		String sql = "select * from product where p_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
		/* ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductById(id); */
	%>
	<!-- .container>.row>.col-md-6>h3+p+p*4>b^h3+p -->
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<img src="../resources/images/<%=rs.getString("p_filename") %> " alt="" class="mb-5 img-fiuid"/>
		</div>
			<div class="col-md-6">
				<h3><%=rs.getString("p_name") %></h3>
				<p><%=rs.getString("p_description")%>
				<p><b>상품 코드 : </b><span class="badge badge-danger"> <%=rs.getString("p_id")%></span>
				<p><b>제조사</b> : <%=rs.getString("p_manufacturer")%>
				<p><b>분류</b> : <%=rs.getString("p_category")%>
				<%
					DecimalFormat formatter = new DecimalFormat("#,###");
				%>
				<p><b>재고 수</b> : <%=formatter.format(Integer.parseInt(rs.getString("p_unitsInStock")))%>
				
				<h3><%=formatter.format(Integer.parseInt(rs.getString("p_unitPrice")))  %>원</h3>
				<p></p>
					<a href="./shippinginfo.jsp" class="btn btn-info"> 상품 주문 &raquo;</a>
					<form action="./addcart.jsp?id=<%=rs.getString("p_id") %>" name="addForm" method="post">
						<input class="btn btn-warning" onclick="addToCart()" value = "장바구니에 담기" &raquo;> <br />
						<a href="./cart.jsp" class="btn btn-primary">장바구니로 이동</a>
					</form>
					
			</div>
		</div>
	</div>
</main>
	<%
		}
		if(rs !=null) rs.close();
		if(pstmt !=null) pstmt.close();
		if(conn !=null) conn.close();
	%>
	
	<%@ include file="../footer.jsp" %>
	<script> function addToCart(){
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		}else{
			document.addFrom.reset();
		}
	}</script>
</body>
</html>