<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<title>검색</title>
<div class="card">
	<div class="card-header">검색</div>
	<div class="card-body">
		<form action="" method="post">




			<!-- 장르태그 -->
			<h5 class="card-title text-primary">
				<b>장르</b>
			</h5>
			<c:forEach items="${GenreButton}" var="genre" >
				<div class="form-check form-check-inline">
					<c:set var="isChecked" value="false" />

					<c:forEach items="${Check.genre_code}" var="selectedGenreCode">
						<c:if test="${selectedGenreCode == genre.genre_code}">
							<c:set var="isChecked" value="true" />
						</c:if>
					</c:forEach>

					<input class="form-check-input" type="checkbox" name="genre_code"
						value="${genre.genre_code}" ${isChecked ? 'checked' : ''}>
					<label class="form-check-label"><b>${genre.genre_name}</b></label>
				</div>
			</c:forEach>






			<!-- 플랫폼태그 -->
			<h5 class="card-title text-primary">
				<b>플랫폼</b>
			</h5>			
			<c:forEach items="${PlatformButton}" var="platform">
				<div class="form-check form-check-inline">
					<c:set var="isChecked" value="false" />

					<c:forEach items="${Check.platform_code}" var="selectedPlatformCode">
						<c:if test="${selectedPlatformCode == platform.platform_code}">
							<c:set var="isChecked" value="true" />
						</c:if>
					</c:forEach>

					<input class="form-check-input" type="checkbox" name="platform_code"
						value="${platform.platform_code}" ${isChecked ? 'checked' : ''} >
						
						
					<label class="form-check-label"><b>${platform.platform_name}</b></label>
				</div>
			</c:forEach>
			
			



			<!-- 결제태그 -->
			<h5 class="card-title text-primary">
				<b>결제</b>
			</h5>
			
			
			<c:forEach items="${PaymentButton}" var="Payment">
				<div class="form-check form-check-inline">
					<c:set var="isChecked" value="false" />

					<c:forEach items="${Check.payment_code}" var="selectedPaymentCode">
						<c:if test="${selectedPaymentCode == Payment.payment_code}">
							<c:set var="isChecked" value="true" />
						</c:if>
					</c:forEach>

					<input class="form-check-input" type="checkbox" name="payment_code"
						value="${Payment.payment_code}" ${isChecked ? 'checked' : ''}>
					<label class="form-check-label"><b>${Payment.payment_type}</b></label>
				</div>
			</c:forEach>




			<!-- 요일태그 -->
			<h5 class="card-title text-primary">
				<b>요일</b>
			</h5>
			
			
			
			<c:forEach items="${WeekdayButton}" var="Weekday">
				<div class="form-check form-check-inline">
					<c:set var="isChecked" value="false" />

					<c:forEach items="${Check.weekday_code}" var="selectedWeekdayCode">
						<c:if test="${selectedWeekdayCode == Weekday.weekday_code}">
							<c:set var="isChecked" value="true" />
						</c:if>
					</c:forEach>

					<input class="form-check-input" type="checkbox" name="weekday_code"
						value="${Weekday.weekday_code}" ${isChecked ? 'checked' : ''}>
					<label class="form-check-label"><b>${Weekday.weekday_day}</b></label>
				</div>
			</c:forEach>
			
			
			
			<!-- 작가태그 -->
			<h5 class="card-title text-primary">
				<b>작가</b>
			</h5>
			<div class="input-group mb-3">
				<input class="form-control" type="text" placeholder="작가이름" value="${Check.author_name}"
					name="author_name" aria-label="default input example">
			</div>


			<!-- 제목태그 -->
			<h5 class="card-title text-primary">
				<b>제목</b>
			</h5>
			<div class="input-group mb-3">
				<input class="form-control" type="text" placeholder="작품제목" value="${Check.webtoon_title}"
					name="webtoon_title" aria-label="default input example">
			</div>

			<br>

			<!-- 검색 -->
			<div class="d-grid gap-2">
				<button class="btn btn-primary" type="submit" id="searchButton">
					<b>검색</b>
				</button>
			</div>



		</form>
	</div>
</div>
