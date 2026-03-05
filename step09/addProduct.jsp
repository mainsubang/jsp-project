<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message">
	<%@ include file="/menu.jsp" %>
	<%@ include file="../header.jsp" %>
	<div class="single-slider slider-height2 d-flex align-items-center">
		<div class="container">
		<div class="row">
			<div class="col">
			<a href="?language=ko">Korean</a> <a href="?language=en">English</a>
			</div>
		</div>
			<h1 class="display-3"><fmt:message key="title"/></h1>
		</div>
	</div>
	<div class="class">
		<form action="./processAddProduct.jsp" name="newProduct" method="post" enctype="multipart/form-data">
					<div class="mb-3">
    					<label for="productId" class="form-label"><fmt:message key="productId"/></label>
    						<input type="text" class="form-control" id="productId" aria-describedby="emailHelp" name="productId">
    					<div id="pname.value.length" class="form-text">We'll never share your email with anyone else.</div>
  					</div>
  					
  					<div class="mb-3">
    					<label for="pname" class="form-label"><fmt:message key="pname"/></label>
    						<input type="text" class="form-control" id="pname" aria-describedby="emailHelp" name="pname">
    					<div id="pname" class="form-text">We'll never share your email with anyone else.</div>
  					</div>
  					
  					<div class="mb-3">
    					<label for="unitPrice" class="form-label"><fmt:message key="unitPrice"/></label>
    						<input type="text" class="form-control" id="unitPrice" aria-describedby="emailHelp" name="unitPrice">
    					<div id="unitPrice" class="form-text">We'll never share your email with anyone else.</div>
  					</div>
  					
  					<div class="mb-3">
    					<label for="description" class="form-label"><fmt:message key="description"/></label>
    						<textarea class="form-control" placeholder="Leave a comment here" id="description" style="height: 100px" name="description"></textarea>
    					<div id="description" class="form-text">We'll never share your email with anyone else.</div>
  					</div>
  					
  					<div class="mb-3">
    					<label for="manufacturer" class="form-label"><fmt:message key="manufacturer"/></label>
    						<input type="text" class="form-control" id="manufacturer" aria-describedby="emailHelp" name="manufacturer">
    					<div id="manufacturer" class="form-text">We'll never share your email with anyone else.</div>
  					</div>
  					
  					<div class="mb-3">
    					<label for="category" class="form-label"><fmt:message key="category"/></label>
    						<input type="text" class="form-control" id="category" aria-describedby="emailHelp" name="category">
    					<div id="category" class="form-text">We'll never share your email with anyone else.</div>
  					</div>
  					
  					<div class="mb-3">
    					<label for="unitsInStock" class="form-label"><fmt:message key="unitsInStock"/></label>
    						<input type="text" class="form-control" id="unitsInStock" aria-describedby="emailHelp" name="unitsInStock">
    					<div id="unitsInStock" class="form-text">We'll never share your email with anyone else.</div>
  					</div>
  					
  					<div class="mb-3">
    					<div class="form-check">
						  <input class="form-check-input" type="radio" name="flexRadioDefault" id="new">
						  <label class="form-check-label" for="new">
						    <fmt:message key="new"/>
						  </label>
						</div>
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="flexRadioDefault" id="old">
						  <label class="form-check-label" for="old">
						    <fmt:message key="old"/>
						  </label>
						</div>
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="flexRadioDefault" id="recycling">
						  <label class="form-check-label" for="recycling">
						    <fmt:message key="recycling"/>
						  </label>
						</div>
						<div class="mb-3">
    					<label for="unitsInStock" class="form-label"><fmt:message key="product image register"/></label>
    						<input type="file" class="form-control" id="productimg" aria-describedby="emailHelp" name="productimg">
  					</div>
  					</div>
  					<div class="row">
						<div class="col">
							<input type="button" class="form-control btn-dark" value="<fmt:message key="submit"/>" onclick="checkAddProduct()">
						</div>
						
						<div class="col">
							<input type="button" class="form-control btn-dark" value="<fmt:message key="cancel+"/>">
						</div>
					</div>
				</form>
		
	</div>
	</fmt:bundle>
	<%@ include file="../footer.jsp" %>
	<script src="../assets/js/form_validation.js"></script>
</body>
</html>