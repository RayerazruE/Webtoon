<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>내정보</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>

body {
	min-height: 100vh;
	overflow-y: scroll;
}


/* 미리보기 이미지의 스타일 */
.preview-image {
	max-width: 150px; /* 최대 너비 설정 */
	max-height: 150px; /* 최대 높이 설정 */
	width: 150px; /* 너비 자동 조정 */
	height: 150px; /* 높이 자동 조정 */
	border: 0.5px solid gray; /* 회색 점선 테두리 설정 */
	display: flex;
    align-items: center;
    justify-content: center;
}
</style>

</head>
<body>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
	</script>

   	<%@ include file="../include/menu.jsp" %>
	<div class="container mx-auto my-auto">
		<div class="row mx-auto my-auto">
		
		<h4 class="mb-3 mx-auto my-auto text-center">내정보</h4>
		
			<div class="col-3 mx-auto my-auto">
				<form method="post" action="/page/uploadProfileImage" enctype="multipart/form-data">
					
					<div class="upload-img mx-auto my-auto">
					<label for="imageInput" class="preview-image-label">
					<img src="<c:url value='/resources/img/upload/${member.profile_photo}' />" alt="" id="imageUploadPreview" class="preview-image">
					</label>
					</div>
					<input type="file" name="file" accept="image/*"
						id="imageInput" style="display: none;">
						
					<div class="upload-form-detail mx-auto my-auto">
						<input class="btn btn-primary" type="submit" value="프로필 사진 업로드" onclick="return validateImageUpload();">
					</div>
				</form>
			</div>

			<div class="col-6 mx-auto my-auto">
				<form name="updateMember" action="/page/updateMember" method="post">

					<div class="form-group row">

						<label class="col-3" for="user_id">아이디</label>
						<div class="col-6">
							<input type="text" name="user_id" id="user_id"
								class="form-control inputbox_readonly" value="${member.user_id}"
								autocomplete='off' readonly>
						</div>
					</div>

					<div class="form-group row">

						<label class="col-3" for="name">닉네임</label>

						<div class="col-6">
							<input type="text" name="name" id="name" class="form-control inputbox"
								value="${member.name}" autocomplete='off' required>
						</div>
					</div>

					<div class="form-group row">

						<label class="col-3" for="email">이메일</label>

						<div class="col-6">
							<input type="text" name="email" id="email" class="form-control inputbox"
								value="${member.email}" autocomplete='off' required>
						</div>
					</div>

					<div class="form-group row">

						<label class="col-3" for="phone">휴대폰번호</label>

						<div class="col-6">
							<input type="text" id="phone" name="phone" class="form-control inputbox"
								value="${member.phone}" autocomplete='off' required>
						</div>
					</div>

					<div class="form-group row mt-2">
						<div class="col-sm-offset-2 col-sm-10 ">
							<c:if test="${member.admin_code == 1}">
								<a href="/page/wt_upload" class="btn btn-primary">웹툰관리</a>
								<input type="button" value="회원관리" id="memberlistbtn" class="btn btn-primary">
							</c:if>
						</div>
					</div>
					
					<div class="form-group row mt-2">
						<div class="col-sm-offset-2 col-sm-10 ">
							<input type="submit" value="회원정보수정" class="btn btn-primary">
							<input type="button" value="비밀번호변경" id="editpwbtn" class="btn btn-primary">
							<input type="button" value="회원탈퇴" id="deletebtn" class="btn btn-outline-primary col-3">
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
	<script>

	// 비밀번호변경
	const editpwbtn = document.getElementById("editpwbtn");
	editpwbtn.addEventListener("click", function() {
		window.location.href = "membereditpw";
	});

	// 회원탈퇴
	const deletebtn = document.getElementById("deletebtn");
	deletebtn.addEventListener("click", function() {
		window.location.href = "memberdelete";
	});
	
	// 회원목록
	const memberlistbtn = document.getElementById("memberlistbtn");
	memberlistbtn.addEventListener("click", function() {
		window.location.href = "memberlist";
	});
	
	// 파일 선택 대화 상자를 트리거하는 함수
	function triggerFileInput() {
		const fileInput = document.getElementById('imageInput');
		fileInput.click();
	}

	// 이미지 입력 필드가 변경될 때 실행되는 함수
	document
			.getElementById('imageInput')
			.addEventListener(
					'change',
					function() {
						if (this.files && this.files[0]) {
							const reader = new FileReader();
							reader.onload = function(e) {
								// 미리보기 이미지의 src를 업데이트하여 선택한 이미지를 표시합니다.
								document
										.getElementById('imageUploadPreview').src = e.target.result;
							};
							reader.readAsDataURL(this.files[0]);
						}
					});

	// 이미지 입력 필드와 미리보기 이미지 엘리먼트를 가져옵니다.
	const imageInput = document.getElementById('imageInput');
	const imageUploadPreview = document
			.getElementById('imageUploadPreview');

	// 이미지 입력 필드가 변경될 때 실행되는 함수
	imageInput.addEventListener('change', function() {
		if (imageInput.files && imageInput.files[0]) {
			const reader = new FileReader();
			reader.onload = function(e) {
				// 미리보기 이미지의 src를 업데이트하여 선택한 이미지를 표시합니다.
				imageUploadPreview.src = e.target.result;
			};
			reader.readAsDataURL(imageInput.files[0]);
		}
	});
	
	// 이미지 업로드 버튼 클릭 시 실행되는 함수
    function validateImageUpload() {
        const fileInput = document.getElementById('imageInput');

        // 파일이 선택되었는지 확인
        if (fileInput.files.length === 0) {
            alert('이미지를 선택해주세요.'); // 팝업 알림 표시
            return false; // 폼 제출을 중단
        }

        // 파일이 선택된 경우 폼을 제출
        return true;
    }
	</script>
	
</body>
</html>