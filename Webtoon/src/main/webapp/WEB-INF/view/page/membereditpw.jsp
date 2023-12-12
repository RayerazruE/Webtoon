<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>

<style>
body {
	min-height: 100vh;
	overflow-y: scroll;
}
</style>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<body>
	<!-- 부트스트랩 및 jQuery 스크립트를 포함합니다 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>

	<%@ include file="../include/menu.jsp"%>
	<div class="container">
		<h4 class="mb-3 mx-auto my-auto text-center">비밀번호변경</h4>
		<div class="col-8">
			<form name="editPassword" action="/page/editPassword" method="post">

				<div class="form-group row">
					<label class="col-4" for="user_id">아이디</label>
					<div class="col-8">
						<input type="text" name="user_id" id="user_id"
							class="form-control inputbox_readonly" value="${member.user_id}"
							autocomplete='off' readonly>
					</div>
				</div>

				<div class="form-group row">
					<label class="col-4" for="password">현재비밀번호</label>
					<div class="col-8">
						<input type="password" class="form-control inputbox" id="password"
							name="password" placeholder="" autocomplete='off' required>
					</div>
				</div>

				<div class="form-group row">
					<label class="col-4" for="password">새비밀번호</label>
					<div class="col-8">
						<input type="password" class="form-control inputbox"
							id="new_password" name="new_password" placeholder=""
							autocomplete='off' required>
					</div>
				</div>

				<div class="form-group row">
					<label class="col-4" for="password">비밀번호확인</label>
					<div class="col-8">
						<input type="password" class="form-control inputbox"
							id="new_passwordRe" name="new_passwordRe" placeholder=""
							autocomplete='off' required>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10 mt-2 ">
						<input type="button" value="변경" class="btn btn-outline-primary"
							id="changePasswordButton" onclick="submitForm()"> <input
							type="button" value="돌아가기" onclick="history.back()"
							class="btn btn-primary">
					</div>
				</div>

			</form>
		</div>
	</div>

	<%@ include file="../include/footer.jsp"%>

	<!-- 모달 대화 상자 -->
	<div class="modal fade" id="errorModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
				</div>
				<div class="modal-body">
					<p id="errorText"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" id="cancelmodal">확인</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		function submitForm() {
			// 사용자가 입력한 값 가져오기
			var password = $("#password").val();
			var new_password = $("#new_password").val();
			var new_passwordRe = $("#new_passwordRe").val();

			// 현재 비밀번호 일치 여부 확인
			var user_id = $("#user_id").val(); // 사용자 아이디 (현재 세션에서 가져옴)

			$.ajax({
				type : "POST",
				url : "/page/checkCurrentPassword", // 비밀번호 확인을 수행하는 컨트롤러 경로
				data : {
					user_id : user_id,
					password : password
				},      
				dataType: "json",
				 success: function (cnt) {
					 console.log ("cnt : " + cnt);
			            
					if (cnt == 1) {
						// 현재 비밀번호가 일치하는 경우 비밀번호 변경을 진행
						if (new_password === new_passwordRe) {
							// 비밀번호 변경 로직 수행
							$.ajax({
								type : "POST",
								url : "/page/editPassword", // 비밀번호 변경을 수행하는 컨트롤러 경로
								data : {
									user_id : user_id,
									new_password : new_password
								},
								success : function(data) {
									$("#errorText").text("비밀번호가 변경되었습니다. 다시 접속해주세요.");
									$("#errorModal").modal("show");
									// 5초 후에 리디렉션 실행
								    setTimeout(function() {
								        window.location.href = "/page/main";
								    }, 5000);
								},
								error : function(error) {
									$("#errorText").text("비밀번호 변경에 실패했습니다.");
									$("#errorModal").modal("show");
								}
							});
						} else {
							$("#errorText").text("비밀번호가 일치하지 않습니다.");
							$("#errorModal").modal("show");
						}
					} else {
						$("#errorText").text("비밀번호를 확인해주세요.");
						$("#errorModal").modal("show");
					}
				},
				error : function(error) {
					alert("비밀번호 확인에 실패했습니다.");
				}
			});
		}
		
		// 취소버튼
		$("#cancelmodal").click(function() {
			// 모달 대화 상자를 닫습니다
			$("#errorModal").modal("hide");
		});
	</script>
	
	


</body>
</html>
