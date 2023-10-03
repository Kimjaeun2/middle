package co.micol.mp.auction.command;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.micol.mp.auction.service.AuctionService;
import co.micol.mp.auction.service.AuctionVO;
import co.micol.mp.auction.serviceImpl.AuctionServiceImpl;
import co.micol.mp.common.Command;

public class AuctionInsert implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
				AuctionService as = new AuctionServiceImpl();
				AuctionVO vo = new AuctionVO();
				HttpSession session = request.getSession();
				
		
				String dir =File.separator+ "images" + File.separator;
				String saveDir = request.getSession().getServletContext().getRealPath(dir);
				
				saveDir += File.separator;
				int maxSize = 100*1024*1024;
				
				try {
					MultipartRequest multi = new MultipartRequest(
														request, 
														saveDir, 
														maxSize, 
														"utf-8", 
														new DefaultFileRenamePolicy());
					String pfile = multi.getFilesystemName("pfile");
					String ofile = multi.getOriginalFileName("pfile");
					System.out.println(pfile);
		
					vo.setAuctionSellerId(String.valueOf(session.getAttribute("id")));
					vo.setAuctionSeller(String.valueOf(session.getAttribute("name")));
					vo.setAuctionName(multi.getParameter("auctionName"));
					vo.setAuctionPrice(Integer.valueOf(multi.getParameter("auctionPrice")));
					vo.setAuctionMax(Integer.valueOf(multi.getParameter("auctionMax")));
					vo.setAuctionDate(Date.valueOf(multi.getParameter("auctionDate")));
					vo.setAuctionLastDate(multi.getParameter("auctionLastDate"));
					vo.setAuctionText(multi.getParameter("auctionText"));
	
					
					if(ofile != null) {
						vo.setAuctionImg(ofile);
						vo.setAuctionDir(pfile);
						
					}
					
					as.auctionInsert(vo);
					
					
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	
				
				
				return "main/main";
			}

		
			

	}


