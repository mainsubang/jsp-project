<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.awt.DefaultFocusTraversalPolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="connection.jsp" %> 
<%
	request.setCharacterEncoding("UTF-8");


	//이미지 가져오는 경로 지정하기
	String filename="";
	String realFolder=application.getRealPath("/resources/images/");
	String encType="utf-8";
	int maxSize = 5 *1024 *1024;
	
	
	//miltipartrequest의 생성자 함수를 이용하여 이미지 업로드에 대한 정보 설정
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	String productId = multi.getParameter("productId");
	String pname = multi.getParameter("pname");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	//문자열 데이터를 정수로 변환
	Integer price;
	if(unitPrice.isEmpty()) price=0;
	else price = Integer.valueOf(unitPrice);
	
	long stock;
	if(unitsInStock.isEmpty()) stock=0;
	else stock = Long.valueOf(unitsInStock);
	
	// MultipartRequest 객체의 메소드를 활용해서 file type를 가진 파일 이름을 얻어옴
	Enumeration files = multi.getFileNames();
	// type="file" 속성을 가진 파라미터의 이름을 Enumeration 형식으로 리턴
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	String sql = "insert into product values(?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, productId);
	pstmt.setString(2, pname);
	pstmt.setString(3, description);
	pstmt.setString(4, manufacturer);
	pstmt.setString(5, category);
	pstmt.setInt(6, price);
	pstmt.setString(7, condition);
	pstmt.setString(8, fileName);

	pstmt.executeUpdate();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	response.sendRedirect("products.jsp");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>