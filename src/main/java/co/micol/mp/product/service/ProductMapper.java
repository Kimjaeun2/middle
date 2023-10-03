package co.micol.mp.product.service;

import java.util.List;

public interface ProductMapper {
	List<ProductVO> productList(ProductVO vo);

	ProductVO product(ProductVO vo);

	int productInsert(ProductVO vo);

	List<ProductVO> productRecentList();

	int productDelete(ProductVO vo);

	List<ProductVO> productCateList(ProductVO vo);

	int listPage();

	List<ProductVO> productSerch(ProductVO vo); // 상품 검색기능
	
	List<ProductVO> productAllSerch(ProductVO vo); // 전체검색

	int productUpdate(ProductVO vo);
	
	ProductVO productCategory(ProductVO vo);
	
}
