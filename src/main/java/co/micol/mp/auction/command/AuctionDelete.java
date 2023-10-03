package co.micol.mp.auction.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.mp.auction.service.AuctionService;
import co.micol.mp.auction.service.AuctionVO;
import co.micol.mp.auction.serviceImpl.AuctionServiceImpl;
import co.micol.mp.common.Command;

public class AuctionDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		AuctionService as = new AuctionServiceImpl();
		AuctionVO vo = new AuctionVO();
		
		vo.setAuctionId(request.getParameter("auctionId"));
		System.out.println(request.getParameter("auctionId"));
		as.auctionDelete(vo);
		
		return "auctionList.do";
	}

}
