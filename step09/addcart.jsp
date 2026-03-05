<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		if(id==null || id.trim().equals("")){
			response.sendRedirect("products.jsp");
			return;
		}
		
		ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductById(id);
		
		ArrayList<Product> goodsList = dao.getAllProducts();
		Product goods = new Product();
		for(int i=0; i<goodsList.size(); i++){
			goods = goodsList.get(i);
			if(goods.getProductId().equals(id)){
				break;
			}
		}
		
		ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("Cartlist");
		if(list == null){
			list = new ArrayList<Product>();
			session.setAttribute("Cartlist", list);
		}
		
		int cnt = 0;
		Product goodsQnt = new Product();
		for(int i=0; i<list.size(); i++){
			goodsQnt = list.get(i);
			if(goodsQnt.getProductId().equals(id)){
				cnt++;
				int orderQuantity = goodsQnt.getQuantity()+1; //기존 수량에 1을 더해서
				goodsQnt.setQuantity(orderQuantity); //해당 제품의 수량으로 세팅
			}
		}
		
		if(cnt==0){
			goods.setQuantity(1);
			list.add(goods);
		}
		
		response.sendRedirect("product.jsp?id="+id);
	%>
</body>
</html>