package com.baby.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.baby.model.AttachImageVO;
import com.baby.model.ProductVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminMapperTests {
	
	@Autowired
	private AdminMapper mapper;
	
	/*상품 등록*/
	
//	@Test
//	public void productEnrollTest() throws Exception{
//		
//		ProductVO product = new ProductVO();
//		
//		product.setProductName("mapper 테스트");
//		product.setBrandId(1);
//		product.setReleaseDate("2023-05-31");
//		product.setCompany("회사아");
//		product.setCateCode("204002");
//		product.setProductPrice(204002);
//		product.setProductStock(30);
//		product.setProductDiscount(0.23);
//		product.setProductIntro("상품 소개");
//		product.setProductContents("상품 내용");
//		
//		System.out.println("Before ProductVO :" + product);
//		
//		mapper.productEnroll(product);
//		
//		System.out.println("After ProductVO :" + product);
//		
//	}
	
//	/* 카테고리 리스트*/
//	@Test
//	public void cateListTest() throws Exception{
//		
//		System.out.println("cateList()......" + mapper.cateList());
//		
//	}
	
	
//	/* 상품 리스트 & 상품 총 갯수 */
//	@Test
//	public void productGetListTest() {
//		
//		Criteria cri = new Criteria();
//		
//		/* 검색조건 */
//		cri.setKeyword("유모");
//		
//		/* 검색 리스트 */
//		List list = mapper.productGetList(cri);
//		for(int i = 0; i < list.size(); i++) {
//			System.out.println("result......." + i + " : " + list.get(i));
//		}
//		
//		/* 상품 총 갯수 */
//		int result = mapper.productGetTotal(cri);
//		System.out.println("resutl.........." + result);
//		
//		
//	}
	
//	/* 상품 조회 페이지*/
//	@Test
//	public void productGetDetailTest() {
//		
//		int productId = 5;
//		
//		ProductVO result = mapper.productGetDetail(productId);
//		
//		System.out.println("상품 조회 데이터 : " + result);
//	}

//	/* 이미지 등록 */
//	@Test
//	public void imageEnrollTest() {
//		
//		AttachImageVO vo = new AttachImageVO();
//		
//		vo.setProductId(5);
//		vo.setFileName("test");
//		vo.setUploadPath("test");
//		vo.setUuid("test2");
//		
//		mapper.imageEnroll(vo);
//		
//	}
	
	
	/* 지정 상품 이미지 삭제 */
	@Test
	public void deleteImageAllTest() {
		
		int bookId = 13;
		
		mapper.deleteImageAll(bookId);
		
	}
}
