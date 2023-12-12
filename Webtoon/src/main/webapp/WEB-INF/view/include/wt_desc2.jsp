<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>



<section class="py-5">
	<input type="hidden" id="User_id" value="${User_id}" />
	<input type="hidden" id="Webtoon_id" value="${webtoon_id}" />
	<input type="hidden" id="IsLiked" value="${isLiked}" /> <input type="hidden"
		id="IsFav" value="${isFav}" />
	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="col-md-6">
				<img class="card-img-top mb-5 mb-md-0"
					src="<c:out value="${WT.thumbnail}"/>" alt="..." />
			</div>
			<div class="col-md-6">




				<h1 class="display-5 fw-bolder">${WT.webtoon_title}</h1>
				<div class="fs-5 mb-5">


					<%--                         <input type="hidden" name="w_platform" value="${Platform.platform_code}"/> --%>

					<c:forEach items="${Platform}" var="Platform">
						<a
							href='/page/wt_detail?webtoon_id=<c:out value="${webtoon_id}"/>&platform_code=<c:out value="${Platform.platform_code}"/>'
							class="link-primary">#<c:out
								value="${Platform.platform_name}" /></a> &nbsp;
                        </c:forEach>


				</div>




				<div>
					<p>
						<b>장르 : </b>
						<c:forEach items="${Genre}" var="Genre">
							<span class="badge rounded-pill text-bg-primary"><c:out
									value="${Genre.genre_name}" /></span>
						</c:forEach>
					</p>




					<%--                         <c:forEach items="${Weekday}" var="Weekday" > --%>
					<p>
						<b>요일 : </b>
						<c:forEach items="${Weekday}" var="Weekday">
							<span class="badge rounded-pill text-bg-primary"><c:out
									value="${Weekday.weekday_day}" /></span>
						</c:forEach>
					</p>






					<p>
						<b>작가 : </b>
						<c:forEach items="${Author}" var="Author">
							<span class="badge rounded-pill text-bg-primary"><c:out
									value="${Author.author_name}" /></span>
						</c:forEach>
					</p>

					<!--                         <span class="badge rounded-pill text-bg-primary">작가이름2</span> -->



					<p>
						<b>결제 : </b>${PlatformChar.payment_type}
					</p>
					<p>
						<b>성인 : </b>${PlatformChar.w_adult}
					</p>
					<p>
						<b>설명 : </b>${WT.webtoon_explain}
					</p>
				</div>

				<div class="d-flex">
					<form action="" method="post">

						<button type="submit" class="btn btn-outline-primary mt-auto">보러가기</button>
						<!-- 					<a id="btnURL" class="btn btn-outline-primary mt-auto" -->
						<%-- 						href="${PlatformChar.url}">보러가기</a> --%>
					</form>
					&nbsp; <a class="btn btn-outline-primary mt-auto" href="./main">이전으로</a>

					<c:if test="${member.admin_code == 1}">
					
					&nbsp; <a class="btn btn-primary mt-auto" href="">수정하기</a> &nbsp;
					
					<a class="btn btn-danger mt-auto"
							href='/page/wt_delete?webtoon_id=<c:out value="${webtoon_id}"/>'>삭제</a>
					
					<button class="btn btn-danger mt-auto"
							onclick='deleteWebtoon(<c:out value="${webtoon_id}"/>)'>삭제</button>

					</c:if>

				</div>

				<br>

				<div class="d-flex">
					<button type="button" id="toggleButton1"
						class="btn btn-lg btn-info active">🤍</button>
					&emsp;
					<button type="button" id="toggleButton2"
						class="btn btn-lg btn-info inactive">⭐</button>
				</div>

			</div>
		</div>
	</div>
</section>




<script>
	var webtoon_id = document.getElementById("Webtoon_id");
	var user_id = document.getElementById("User_id");
	var toggleButton1 = document.getElementById("toggleButton1");
	var toggleButton2 = document.getElementById("toggleButton2");
	var isLikedInit = document.getElementById("IsLiked").value;
	var isFavInit = document.getElementById("IsFav").value;

	document.addEventListener("DOMContentLoaded", function() {
		if (user_id != "") {
			if (isLikedInit == 1) {
				toggleButton1.classList.remove("inactive");
				toggleButton1.classList.add("active");
				toggleButton1.textContent = "❤";
			} else {
				toggleButton1.classList.remove("active");
				toggleButton1.classList.add("inactive");
				toggleButton1.textContent = "🤍";
			}
			if (isFavInit == 1) {
				toggleButton2.classList.remove("inactive");
				toggleButton2.classList.add("active");
				toggleButton2.textContent = "⭐✔️";
			} else {
				toggleButton2.classList.remove("active");
				toggleButton2.classList.add("inactive");
				toggleButton2.textContent = "⭐";
			}
		}

	});
	
	$("#toggleButton1").click(function() {
		$.ajax({
			type : 'POST',
			url : 'like', // 서버 측 코드의 URL
			data : {
				user_id : user_id.value,
				webtoon_id : webtoon_id.value
			},
			cache : false, // 캐시 사용하지 않음
			dataType : 'json', // 서버에서 받아온 데이터의 형식
			success : function(isLiked) {

				if (document.getElementById("User_id").value != "") { //세션을 컨트롤로 부터 가져옴
					
					if (toggleButton1.classList.contains("active"))
						toggleButton1.classList.remove("active")
					if (toggleButton1.classList.contains("inactive"))
						toggleButton1.classList.remove("inactive")
						
					if(isLiked == 0){
						toggleButton1.classList.add("inactive");
						toggleButton1.textContent = "🤍";
					} else if(isLiked == 1){
						toggleButton1.classList.add("active");
						toggleButton1.textContent = "❤";
					}
				} else {
					alert("로그인을 해주세요.");
				}
			},
			error : function(xhr, textStatus, errorThrown) {
				// 서버 요청 자체가 실패한 경우 (예: 네트워크 문제 등)
				// 에러 처리를 수행하거나 사용자에게 오류 메시지를 표시할 수 있음
				console.error('서버 요청 실패:', textStatus, errorThrown);
				alert("요청실패")
			}
		});

	});
	
	$("#toggleButton2").click(function() {
		$.ajax({
			type : 'POST',
			url : 'fav', // 서버 측 코드의 URL
			data : {
				user_id : user_id.value,
				webtoon_id : webtoon_id.value
			},
			cache : false, // 캐시 사용하지 않음
			dataType : 'json', // 서버에서 받아온 데이터의 형식
			success : function(isFav) {

				if (document.getElementById("User_id").value != "") {

					if (toggleButton2.classList.contains("active")) {
						// 버튼 비활성화
						toggleButton2.classList.remove("active");
						toggleButton2.classList.add("inactive");
						toggleButton2.textContent = "⭐";

					} else {
						// 버튼 활성화
						toggleButton2.classList.remove("inactive");
						toggleButton2.classList.add("active");
						toggleButton2.textContent = "⭐✔️";
					}
				} else {
					alert("로그인을 해주세요.");
				}
			},
			error : function(xhr, textStatus, errorThrown) {
				// 서버 요청 자체가 실패한 경우 (예: 네트워크 문제 등)
				// 에러 처리를 수행하거나 사용자에게 오류 메시지를 표시할 수 있음
				console.error('서버 요청 실패:', textStatus, errorThrown);
				alert("요청실패")
			}
		});

	});
	
</script>



