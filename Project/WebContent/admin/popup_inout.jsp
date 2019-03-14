<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.QtyProViewBean"%>
<%@ page import="java.util.*"%>
<%
	ArrayList<QtyProViewBean> qtyInOutList = (ArrayList<QtyProViewBean>) request.getAttribute("qtyInOutList");
	int pro_code = 0;
	if (request.getAttribute("pro_code") != null) {
		pro_code = (int)request.getAttribute("pro_code");
	}
	
	//총 수량
 	int qty_total=0;
	if(qtyInOutList != null) {
		for (int i = 0; i < qtyInOutList.size(); i++) {
			if (qtyInOutList.get(i).getQty_inout().equals("in")) {
				qty_total += qtyInOutList.get(i).getQty_qty();
			} else {
				qty_total -= qtyInOutList.get(i).getQty_qty();
			}
		}
	}
	System.out.println(qty_total);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입/출고 관리</title>
</head>
<body>
	<form action="QtyInOutAction.ad">
		<input type="hidden" name="pro_code" id="pro_code"
			value="<%=pro_code%>" /> 입고<input type="radio" name="inout"
			id="inout" value="in" checked="checked" /> 출고<input type="radio"
			name="inout" id="inout" value="out" /><br> 수량 : <input
			type="text" name="qty" id="qty" /><br> 비고 : <input type="text"
			name="note" id="note" /> <input type="submit" value="등록" />
			총 수량 : <%=qty_total %>

	</form>
	<table>
		<tr>
			<td>번호</td>
			<td>상품명</td>
			<td>입/출고</td>
			<td>수량</td>
			<td>비고</td>
			<td>날짜</td>
			<td>삭제</td>
		</tr>
		<%
			if (qtyInOutList == null) {
				out.println("<h2>입/출고 내역이 없습니다.</h2>");
			} else {
				for (int i = 0; i < qtyInOutList.size(); i++) {
		%>
		<tr>
			<td><%=i + 1%></td>
			<td><%=qtyInOutList.get(i).getPro_name()%></td>
			<td><%=qtyInOutList.get(i).getQty_inout()%></td>
			<td><%=qtyInOutList.get(i).getQty_qty()%></td>
			<td><%=qtyInOutList.get(i).getQty_note()%></td>
			<td><%=qtyInOutList.get(i).getQty_date()%></td>	
			<td><input type="button" value="삭제" onclick="location.href='qtyInOutDelete.ad?qty_num=<%=qtyInOutList.get(i).getQty_num()%>'"/>

		</tr>
		<%
			}
			}
		%>

	</table>

</body>
</html>