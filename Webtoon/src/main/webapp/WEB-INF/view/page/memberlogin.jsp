<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인</title>

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<style>
body {
	min-height: 100vh;
	overflow-y: scroll;
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
</head>

<body class="text-center">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<%@ include file="../include/menu.jsp"%>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4>로그인</h4>

				<main class="form-signin">

					<form action="/page/memberlogin" method="post">
						<div class="mb-3">
							<div class="form-floating">
								<input type="text" class="form-control" id="user_id"
									name="user_id" placeholder=""> <label for="user_id">ID</label>
							</div>
						</div>
						<div class="mb-3">
							<div class="form-floating">
								<input type="password" class="form-control" id="password"
									name="password" placeholder=""> <label for="password">PASSWORD</label>
							</div>
						</div>
						<div class="mb-3">
							<c:if test="${result == 0 }">
								<div class="login_warn" style='color: red;'>아이디 또는 비밀번호를 확인해주세요.</div>
							</c:if>
						</div>
						
						<div class="mb-3">
							<button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
						</div>
						<%@ include file="../include/footer.jsp"%>

					</form>

				</main>

			</div>
		</div>
	</div>

</body>
</html>

