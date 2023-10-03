package co.micol.mp.auction.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.mp.auction.service.AuctionService;
import co.micol.mp.auction.service.AuctionVO;
import co.micol.mp.auction.serviceImpl.AuctionServiceImpl;
import co.micol.mp.common.Command;

public class AuctionTimeOut implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		AuctionService as = new AuctionServiceImpl();
		AuctionVO vo = new AuctionVO();		
	
			vo.setMemberId(request.getParameter("auctionbuyerId"));
			vo.setAuctionId(request.getParameter("auctionId"));
			vo.setAuctionName(request.getParameter("auctionName"));
			vo.setAuctionPrice(Integer.valueOf(request.getParameter("auctionPrice")));
			vo.setAuctionMax(Integer.valueOf(request.getParameter("auctionPrice")));
			vo.setAuctionDir(request.getParameter("auctionImg"));
			
			as.auctionPriceUpdate(vo);
			as.auctionBuyListInsert(vo);
			
			return "auctionList.do";
			
		
	}

}
