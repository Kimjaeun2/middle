package co.micol.mp.product.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.mp.common.Command;
import co.micol.mp.product.service.ProductService;
import co.micol.mp.product.service.ProductVO;
import co.micol.mp.product.serviceImpl.ProductServiceImpl;

public class ProductCateList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ProductService ps = new ProductServiceImpl();
		
		List<ProductVO> products = new ArrayList<>();
		
		ProductVO vo = new ProductVO();
		
		String productCategory = request.getParameter("productCategory");
		
		vo.setProductCategory(productCategory);
		products = ps.productCateList(vo);
		

		
		request.setAttribute("products", products);
		
	
		return "product/productList";
	}

}
