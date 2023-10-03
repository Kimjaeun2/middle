package co.micol.mp.product.service;

import java.util.List;

public interface ProductService {
	List<ProductVO> productList(ProductVO vo);
	
	ProductVO product(ProductVO vo);
	
	int productInsert(ProductVO vo);
	
	List<ProductVO> productRecentList();
	
	int productDelete(ProductVO vo);

	List<ProductVO> productCateList(ProductVO vo);

	int listPage();

	List<ProductVO> productSerch(ProductVO vo); // 상품 검색기능

	List<ProductVO> productAllSerch(ProductVO vo);
	
	int productUpdate(ProductVO vo);
	ProductVO productCategory(ProductVO vo);
	

}
