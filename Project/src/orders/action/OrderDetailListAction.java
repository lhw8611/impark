package orders.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import member.svc.MemberInfoSvc;
import orders.svc.OrderDetailListSvc;
import vo.ActionForward;
import vo.MemberBean;
import vo.OrOdProViewBean;

public class OrderDetailListAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderDetailListAction");
		ActionForward forward = null;
		int od_num = Integer.parseInt(request.getParameter("od_num"));
		OrderDetailListSvc orderdetaillistsvc = new OrderDetailListSvc();
		ArrayList<OrOdProViewBean> orodproviewbean = orderdetaillistsvc.OrderDetailList(od_num);
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		MemberInfoSvc memberinfosvc = new MemberInfoSvc();
		MemberBean membean = memberinfosvc.MemberInfo(id);
		request.setAttribute("membean", membean);
		request.setAttribute("orderdetaillist", orodproviewbean);
		if(orodproviewbean != null) {
			forward = new ActionForward();
			forward.setPath("orders/orderDetailList.jsp");
		}
		
		return forward;
	}

}
