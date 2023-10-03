package co.micol.mp.auction.service;

import java.util.List;

public interface AuctionMapper {
	List<AuctionVO> auctionList(AuctionVO vo);
	
	AuctionVO auction(AuctionVO vo);
	AuctionVO auction2(AuctionVO vo);
	
	int auctionInsert(AuctionVO vo);

	int auctionPriceInsert(AuctionVO vo);
	
	AuctionVO auctionPriceSelect(String string);
	
	int auctionBuyListInsert(AuctionVO vo);
	

	int auctionPriceUpdate(AuctionVO vo);

	int listPage();
	
	int auctionDelete(AuctionVO vo);

}
