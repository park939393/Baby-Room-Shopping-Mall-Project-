package com.baby.service;

import java.util.List;

import com.baby.model.AttachImageVO;
import com.baby.model.CateVO;
import com.baby.model.Criteria;
import com.baby.model.OrderDTO;
import com.baby.model.ProductVO;

public interface AdminService {
	
	/*상품 등록*/
	public void productEnroll(ProductVO product);

	/* 카테고리 리스트 */
	public List<CateVO> cateList();
	
	/*상품 리스트*/
	public List<ProductVO> productGetList(Criteria cri);
	
	/*상품 총 개수*/
	public int productGetTotal(Criteria cri);
	
	/*상품 조회 페이지*/
	public ProductVO productGetDetail(int productId);
	
	/* 상품 수정 */
	public int productModify(ProductVO vo);
	
	/* 상품 정보 삭제*/
	public int productDelete(int productId);
	
	/* 브랜드 정보 삭제*/
	public int brandDelete(int brandId);
	
	/* 지정 상품 이미지 정보 얻기 */
	public List<AttachImageVO> getAttachInfo(int productId);
	
	/* 주문 상품 리스트 */
	public List<OrderDTO> getOrderList(Criteria cri);
	
	/* 주문 총 갯수 */
	public int getOrderTotal(Criteria cri);
	
	
	

}
