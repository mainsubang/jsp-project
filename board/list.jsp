<%@page import="java.util.List"%>
<%@page import="mvc.model.BoardDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%!DecimalFormat df = new DecimalFormat("#,###"); %>
	<% String cartId = session.getId(); %>
	<%@ include file="/menu.jsp" %>
	<%@ include file="../header.jsp" %>
	<div class="single-slider slider-height2 d-flex align-items-center">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	<!-- .container>.row>.col-md-6>h3+p+p*4>b^h3+p -->
	<div class="container">
		<div class="row">
			
		</div>
	</div>
	
	
	<%@ include file="../footer.jsp" %>
	
	<%
		List boardList = (List)request.getAttribute("boardlist");
	
		int pageNum = (Integer)request.getAttribute("pageNum");
		int total_record = (Integer)request.getAttribute("total_record");
		int total_page = (Integer)request.getAttribute("total_page");
	%>
	<div class="container mt-5 pt-5">
		<form action='<c:url value="./BoardListAction.do"/>' method="post">
		<div class="row">
			<div class="col text-end">
				<span class="badge bg-info">전체 <%=total_record %>건</span>
			</div>
		
	</div>
	<h1>게시판</h1>
	<div class="row">
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>글쓴이</th>
				<th>IP</th>
			<tr>
			<%
				for(int i=0; i<boardList.size(); i++){
				System.out.print("목록갯수"+boardList.size());
				BoardDTO boardDTO = (BoardDTO)boardList.get(i);		
			%>
			<tr>
				<td><%=boardDTO.getYeachan_num() %></td>
				<td><a herf="./BoardViewAction.do?num=<%=boardDTO.getYeachan_num() %>&pageNum=<%=pageNum %>"><%=boardDTO.getSubject() %></a></td>
				<td><%=boardDTO.getContent() %></td>
				<td><%=boardDTO.getName() %></td>
				<td><%=boardDTO.getIp() %></td>
			<tr>
			<%
			}
			%>
		</table>
	</div>
	<div class="row">
		<div class="col">
			<c:set var="pageNum" value="<%=pageNum %>" />
			<c:forEach var="i" begin="1" end="<%=total_page %>">
				<a href='<c:url value="./BoardListAction.do?pageNum=${i}"/>'>
					<c:choose>
						<c:when test="${pageNum == i }">
							<b>[${i}]</b>
						</c:when>
						<c:otherwise>
							<span style="color:gray">[${i}]</span>
						</c:otherwise>
					</c:choose>
					
					
				</a>
			</c:forEach>
		</div>
	</div>
	<div class="row">
		<table>
			<tr>
				<td width="calc(100%-100)">
					<select name="items">
						<option value="subject">제목에서</option>
						<option value="content">본문에서</option>
						<option value="name">글쓴이에서</option>
					</select>
					<input type="text" name="text" />
					<input type="submit" class="btn btn-warning" value="검색"/>
					<a href='<c:url value="./BoardListAction.do?pageNum=1"/>' class="btn btn-secondary">검색 초기화</a>
				</td>
				<td width="100" align="right">
					<a herf="" class="btn btn-info" onclick="writeCheck()">글쓰기</a>
				</td>
			</tr>
		</table>
	</div>
	</div>
	
	
	</form>
	
	
	<script>
	function writeCheck() {
	    <% if (session.getAttribute("sessionId") == null) { %>
	        alert("로그인을 해주세요");
	        location.href = "<c:url value='/member/login.jsp'/>";
	    <% } else { %>
	        location.href = "<c:url value='/board/writeForm.jsp'/>";
	    <% } %>
	}
	</script>
</body>
</html>