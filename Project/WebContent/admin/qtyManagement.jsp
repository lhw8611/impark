<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="vo.QtyProViewBean"%>
<%
	ArrayList<QtyProViewBean> qtyList = (ArrayList<QtyProViewBean>)request.getAttribute("qtyList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고관리</title>
<style>
#qtyTable img {
		width:100px;
		height:100px;
}

#qtyTable td {
	border-bottom:1px solid #CCCCCC;
	text-align: center;
	padding:10px 10px;
}
#container {
width:1100px;
	margin:0 auto;
}
#main {
	border:.5px solid #CCCCCC;
	background-color: white;
	width:1100px;
	margin:100px auto;
}
#qtyTable {
border-spacing: 0;
margin:50px auto;
}
</style>
</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>
<jsp:include page="adminSidebar.jsp"></jsp:include>
<div id="container">
	<div id="main">
	<h2 style="margin:100px 50px 0 50px;">재고관리</h2>
	
			<%
			if (qtyList == null) {
				%>
				<h1 style="margin:300px 400px; min-width: 500px;">등록된 상품이 없습니다.</h1> 
				<% 
				} else {
				%>
	<table id="qtyTable">
		<tr>
			<td>상품코드</td>
			<td>이미지</td>
			<td>상품명</td>
			<td>가격</td>
			<td>카테고리</td>
			<td>상품 수정/삭제</td>
			<td>입/출고 관리</td>
			<td>show/hide</td>
		</tr>
<% 
			
				for (int i = 0; i < qtyList.size(); i++) {
		%>
		<tr>
			<td><%=qtyList.get(i).getPro_code() %></td>
			<td><img src="/Space/boardUpload/<%=qtyList.get(i).getPro_image() %>" width="100px"/></td>
			<td><%=qtyList.get(i).getPro_name() %></td>
			<td><%=qtyList.get(i).getPro_price() %></td>
			<td><%=qtyList.get(i).getPro_category() %> </td>
			<td><input type="button" value="상세보기" onclick="location.href='/Space/ProModifyFormAction.ad?pro_code=<%=qtyList.get(i).getPro_code()%>'"/></td>
			<td><input type="button" value="입/출고 관리" onclick="window.open('inoutListForm.ad?pro_code=<%=qtyList.get(i).getPro_code() %>', '', 'width=550, height=800')"/> </td>
			<td><%=qtyList.get(i).getPro_show()%>
			<%if(qtyList.get(i).getPro_show().equals("x")) {
			%>
			<input type="button" value="보이기" onclick="location.href='show.ad?pro_code=<%=qtyList.get(i).getPro_code()%>'"/>
			<% }else {
			%>
			<input type="button" value="숨기기" onclick="location.href='hide.ad?pro_code=<%=qtyList.get(i).getPro_code()%>'"/></td>
			<%} %>
		</tr>
		<%
			}
		}
		%>

	</table>
	</div>
	</div>
</body>
</html>
