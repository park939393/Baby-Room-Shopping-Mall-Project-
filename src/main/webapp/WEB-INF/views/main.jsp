<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Baby room</title>
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>
<body>

	<div class="wrapper">
		<div class="wrap">
			<div class="top_gnb_area">
				<ul class="list">

					<c:if test="${member == null}">
						<!-- 로그인 x -->
						<li><a href="/member/login">로그인</a></li>
						<li><a href="/member/join">회원가입</a></li>
					</c:if>

					<c:if test="${member != null}">
						<!-- 로그인 o -->
						<c:if test="${member.adminCk == 1 }">
							<li><a href="/admin/main">관리자 페이지</a></li>
						</c:if>

						<li><a id="gnb_logout_button"> 로그아웃 </a></li>
							<li><a href="/member/myPage/${member.memberId}">마이 페이지</a></li>
						<li><a href="/cart/${member.memberId}">장바구니</a></li>
					</c:if>

					<li>고객센터</li>

				</ul>



			</div>
			<div class="top_area">
				<div class="logo_area">
					<a href="/main"><img src="resources/img/Logo.png"></a>
				</div>
				<div class="search_area">
					<div class="search_wrap">
						<form id="searchForm" action="/search" method="get">
							<div class="search_input">
								<select name="type">
									<option value="T">상품 명</option>
									<option value="B">브랜드</option>
								</select> <input type="text" name="keyword">
								<button class='btn search_btn'>검 색</button>
							</div>
						</form>
					</div>
				</div>
				<div class="login_area">
					<!--  로그인 하지 않은 상태 -->
					<c:if test="${member == null}">
						<div class="login_button">
							<a href="/member/login">로그인</a>
						</div>
						<span><a href="/member/join">회원가입</a></span>
					</c:if>

					<!--  로그인 상태 -->
					<c:if test="${member != null}">
						<div class="login_success_area">
							<span>회원 : ${member.memberName}</span> <span>충전금액 : <fmt:formatNumber
									value="${member.money }" pattern="\#,###.##" /></span> <span>포인트
								: <fmt:formatNumber value="${member.point }" pattern="#,###" />
							</span> <a href="/member/logout.do">로그아웃</a>
						</div>

					</c:if>

				</div>
				<div class="clearfix"></div>
			</div>
			<div class="navi_bar_area">
				<div class="dropdown">
					<button class="dropbtn">
						국내 상품 <i class="fa fa-caret-down"></i>
					</button>
					<div class="dropdown-content">
						<c:forEach items="${cate1}" var="cate">
							<a href="search?type=C&cateCode=${cate.cateCode}">${cate.cateName}</a>
						</c:forEach>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn">
						해외 상품 <i class="fa fa-caret-down"></i>
					</button>
					<div class="dropdown-content">
						<c:forEach items="${cate2}" var="cate">
							<a href="search?type=C&cateCode=${cate.cateCode}">${cate.cateName}</a>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="content_area">
				<div class="slide_div_wrap">
					<div class="slide_div">
						<div>
							<a> <img class="img-fit" src="../resources/img/bn_a.jpg">
							</a>
						</div>
						<div>
							<a> <img class="img-fit" src="../resources/img/bn_b.jpg">
							</a>
						</div>
						<div>
							<a> <img class="img-fit" src="../resources/img/bn_c.jpg">
							</a>
						</div>
						<div>
							<a> <img class="img-fit" src="../resources/img/bn_d.jpg">
							</a>
						</div>
						<div>
							<a> <img class="img-fit" src="../resources/img/bn_e.jpg">
							</a>
						</div>
					</div>
				</div>
				<div class="ls_wrap">
				<div class="ls_div_subject">
					최신 상품
				</div>
				<div class="ls_div">
					<c:forEach items="${ns}" var="ns">
						<a href="/productDetail/${ns.productId}">
							<div class="ls_div_content_wrap">
								<div class="ls_div_content">
									<div class="image_wrap" data-productid="${ns.imageList[0].productId}" data-path="${ns.imageList[0].uploadPath}" data-uuid="${ns.imageList[0].uuid}" data-filename="${ns.imageList[0].fileName}">
										<img>
									</div>				
									<div class="ls_category">
										${ns.cateName}
									</div>
									<div class="ls_rating">
										${ns.ratingAvg}
									</div>
									<div class="ls_productName">
										${ns.productName}
									</div>							
								</div>
							</div>
						</a>					
					</c:forEach>					
				</div>
			</div>
				
				
				<div class="ls_wrap">
				<div class="ls_div_subject">
					평점순 상품
				</div>
				<div class="ls_div">
					<c:forEach items="${ls}" var="ls">
						<a href="/productDetail/${ls.productId}">
							<div class="ls_div_content_wrap">
								<div class="ls_div_content">
									<div class="image_wrap" data-productid="${ls.imageList[0].productId}" data-path="${ls.imageList[0].uploadPath}" data-uuid="${ls.imageList[0].uuid}" data-filename="${ls.imageList[0].fileName}">
										<img>
									</div>				
									<div class="ls_category">
										${ls.cateName}
									</div>
									<div class="ls_rating">
										${ls.ratingAvg}
									</div>
									<div class="ls_productName">
										${ls.productName}
									</div>							
								</div>
							</div>
						</a>					
					</c:forEach>					
				</div>
			</div>
			</div>

			<!-- Footer 영역 -->
			<div class="footer_nav">
				<div class="footer_nav_container">
					<ul>
						<li>회사소개</li>
						<span class="line">|</span>
						<li>이용약관</li>
						<span class="line">|</span>
						<li>고객센터</li>
						<span class="line">|</span>
						<li>광고문의</li>
						<span class="line">|</span>
						<li>채용정보</li>
						<span class="line">|</span>
					</ul>
				</div>
			</div>
			<!-- class="footer_nav" -->

			<div class="footer">
				<div class="footer_container">

					<div class="footer_left">
						<img src="resources/img/Logo.png">
					</div>
					<div class="footer_right">
						(주) BABY ROOM 대표이사 : OOO <br> 사업자등록번호 : ooo-oo-ooooo <br>
						대표전화 : oooo-oooo(발신자 부담전화) <br> <br> COPYRIGHT(C) <strong>https://github.com/park939393/Byby</strong>
						ALL RIGHTS RESERVED.
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<!-- class="footer" -->


		</div>
	</div>

</body>

<script>
	$(document).ready(function() {
		
		$(".slide_div").slick(
		{
			dots: true,
			autoplay: true,
			autoplaySpeed: 5000
		}
		);
		$(".ls_div").slick({
			
			slidesToShow: 4,
			slidesToScroll: 4,
			prevArrow : "<button type='button' class='ls_div_content_prev'>이전</button>",		// 이전 화살표 모양 설정
			nextArrow : "<button type='button' class='ls_div_content_next'>다음</button>",		// 다음 화살표 모양 설정
			
		});
		
		/* 이미지 삽입 */
		$(".image_wrap").each(function(i, obj){
			
			const bobj = $(obj);
			
			if(bobj.data("productid")){
				const uploadPath = bobj.data("path");
				const uuid = bobj.data("uuid");
				const fileName = bobj.data("filename");
				
				const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
				
				$(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
			} else {
				$(this).find("img").attr('src', '/resources/img/productNoImage.png');
			}
			
		});
		
	});

	/* gnb_area 로그아웃 버튼 작동 */
	$("#gnb_logout_button").click(function() {
		//alert("버튼 작동");
		$.ajax({
			type : "POST",
			url : "/member/logout.do",
			success : function(data) {
				//alert("로그아웃 성공");
				document.location.reload();
			}
		}); // ajax	
	});
</script>
</html>