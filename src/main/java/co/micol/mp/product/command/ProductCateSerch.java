package co.micol.mp.product.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.mp.common.Command;
import co.micol.mp.product.service.ProductService;
import co.micol.mp.product.service.ProductVO;
import co.micol.mp.product.serviceImpl.ProductServiceImpl;

public class ProductCateSerch implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		ProductService ps = new ProductServiceImpl();
		ProductVO vo = new ProductVO();
		String productCategory = request.getParameter("productCategory");
		String productSearch = request.getParameter("productSearch");
		vo.setProductCategory(productCategory);
		vo.setProductSearch(productSearch);
		
		System.out.println(request.getParameter("productCategory"));
		System.out.println(request.getParameter("productSearch"));
		
		List<ProductVO> products = ps.productSerch(vo);
		
		request.setAttribute("products", products);
		
		vo = ps.productCategory(vo);
		request.setAttribute("vo", vo);
		
		return "product/productList" ;
	}

}