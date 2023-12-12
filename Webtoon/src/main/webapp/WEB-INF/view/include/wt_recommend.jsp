<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<section class="py-5">
	<h1>
		<b>작가의 다른 작품</b>
	</h1>
	<hr>
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-right">





			<c:forEach items="${WTSimilar}" var="WTSimilar">

				<div class="col mb-5">
					<div class="card h-100">
						<img style="height: 300px; width: 300px;"
							class="card-img-top img-thumbnail"
							src="<c:out value="${WTSimilar.thumbnail}"/>" alt="..." />
						<div class="card-body p-4">
							<div class="text-center">
								<h5 class="fw-bolder">
									<c:out value="${WTSimilar.webtoon_title}" />
								</h5>
								<div class="d-grid gap-2">
									<a class="btn btn-outline-primary mt-auto"
										href='/page/wt_detail?webtoon_id=<c:out value="${WTSimilar.webtoon_id}"/>&platform_code=<c:out value="${WTSimilar.min_platform_code}"/>'>상세보기</a>
								</div>
							</div>
						</div>
					</div>
				</div>

			</c:forEach>








		</div>
	</div>


	<h1>
		<b>비슷한 작품</b>
	</h1>
	<hr>
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-right">

		<c:forEach items="${WTAuthor}" var="WTAut">

				<div class="col mb-5">
					<div class="card h-100">
						<img style="height: 300px; width: 300px;"
							class="card-img-top img-thumbnail"
							src="<c:out value="${WTAut.thumbnail}"/>" alt="..." />
						<div class="card-body p-4">
							<div class="text-center">
								<h5 class="fw-bolder">
									<c:out value="${WTAut.webtoon_title}" />
								</h5>
								<div class="d-grid gap-2">
									<a class="btn btn-outline-primary mt-auto"
										href='/page/wt_detail?webtoon_id=<c:out value="${WTAut.webtoon_id}"/>&platform_code=<c:out value="${WTAut.min_platform_code}"/>'>상세보기</a>
								</div>
							</div>
						</div>
					</div>
				</div>

			</c:forEach>


		</div>
	</div>
</section>

<!-- Footer-->
<!--         <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer> -->
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<%@ include file="./footer.jsp"%>
