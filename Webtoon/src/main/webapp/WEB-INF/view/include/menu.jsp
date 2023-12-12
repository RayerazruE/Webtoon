<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 드롭다운, 팝오버, 툴팁을 안쓴다면 -->
<!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script> -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>

<script>
	//로그아웃
	function logoutbtn() {
		window.location.href = "/page/logout";
	}
</script>

<div class="container">

	<header
		class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
		<a href="/"
			class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
			<svg class="bi me-2" width="40" height="32" role="img"
				aria-label="Bootstrap">
				<use xlink:href="#bootstrap"></use></svg>
		</a>


		<ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
			<li><a href="/page/main" class="nav-link px-2 link-dark"
				id="mainpage">웹툰</a></li>
			<li><a href="/page/wt_favorites" class="nav-link px-2 link-dark"
				id="favorites">즐겨찾기</a></li>
			<li><a href="/page/boardlist" class="nav-link px-2 link-dark">게시판</a></li>
		</ul>

		<!-- 비회원일때 멤버메뉴 -->
		<c:if test="${member == null }">
			<div class="col-md-3 text-end">
				<img src="../resources/img/notlogin.png"
					style="max-width: 25px; height: 25px;"> <span>비회원 입니다.</span>
				<a href="/page/memberlogin" class="btn btn-outline-primary me-2"
					id="loginbtn">로그인</a>
				<a href="/page/memberjoin" class="btn btn-primary" id="joinbtn">회원가입</a>
			</div>
		</c:if>

		<!-- 로그인중일때 멤버메뉴 -->
		<c:if test="${member != null }">
			<div class="col-md-3 text-end">
				<img src="/resources/img/upload/${member.profile_photo}"
					style="max-width: 25px; height: 25px;"> <span>${member.name}</span>
				<a href="/page/myinfo"class="btn btn-outline-primary me-2"
					id="myinfobtn">내정보</a>
				<button type="button" class="btn btn-primary" onclick="logoutbtn()"
					id="logoutbtn">로그아웃</button>
			</div>
		</c:if>

	</header>
</div>
