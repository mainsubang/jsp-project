<%@page import="java.sql.Connection"%><%@page import="java.sql.Connection"%>
<%@page import="dao.ProductRepository"%>
<%@ page import="dto.Product"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="connection.jsp" %>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>products</title>
</head>
<body>
	<%@ include file="/menu.jsp" %>
	<%@ include file="../header.jsp" %>
	
	<div class="jumbotron">
		<div class="single-slider slider-height2 d-flex align-items-center">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	<%
/*		ProductRepository dao = ProductRepository.getInstance();
		ArrayList<Product> listOfProducts = dao.getAllProducts(); */
	%>
	<div class="container">
		<div class="row">
			<%
/*				for(int i=0; i<listOfProducts.size(); i++){
					Product product = listOfProducts.get(i); */
					String sql="select * from product";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					System.out.println(rs);
					while(rs.next()){
						
					System.out.println("Test"+rs.getString("p_name"));
				
			%>
			<div class="col-md-4 mt-5">
				<img src="../resources/images/<%=rs.getString("p_filename") %> " alt="" style="width:300px" />
				<h3><%=rs.getString("p_name") %></h3>
				<p><%=rs.getString("p_description") %></p>
				<p><%=rs.getString("p_unitPrice") %>원</p>
				<p><a href="./product.jsp?id=<%=rs.getString("p_id")%>" class="btn btn-info">상세정보 &raquo;</a></p>
			</div>
			<%
					}
					if(rs !=null) rs.close();
					if(pstmt !=null) pstmt.close();
					if(conn !=null) conn.close();
					
			%>
		</div>
	</div>
	<%@ include file="../footer.jsp" %>
	
</body>
</html>







