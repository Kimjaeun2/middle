package co.micol.mp.review.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.micol.mp.common.Command;
import co.micol.mp.review.service.ReviewService;
import co.micol.mp.review.service.ReviewVO;
import co.micol.mp.review.serviceImpl.ReviewServiceImpl;

public class DeleteReview implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 리뷰삭제
		ReviewService rs = new ReviewServiceImpl();
		ReviewVO vo = new ReviewVO();
		HttpSession session = request.getSession();
		String memberId = String.valueOf(session.getAttribute("id"));
//		System.out.println(request.getParameter("memberId"));
		vo.setMemberId(memberId);
		
		rs.deleteReview(vo);
		
		return"productList.do";
		//return "productForm.do?productId="+request.getParameter("productId");
	
	}

}

