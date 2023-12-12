<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>

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
	<%@ include file="../include/menu.jsp"%>
	
	<div class="container">
		<h4 class="mb-3 mx-auto my-auto text-center">회원탈퇴</h4>
		<div class="col-8">
			<form name="deleteMember" action="/page/deleteMember" method="post">
				<div class="form-group row">
					<label class="col-4" for="user_id">아이디</label>
					<div class="col-8">
						<input type="text" name="user_id" id="user_id"
							class="inputbox_readonly" value="${member.user_id}"
							autocomplete='off' readonly>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-4" for="password">비밀번호</label>
					<div class="col-8">
						<input type="password" class="inputbox" id="password"
							name="password" placeholder="" autocomplete='off' required>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10 mt-2 ">
						<input type="button" value="탈퇴" class="btn btn-outline-primary"
							id="deleteButton"> <input type="button" value="돌아가기"
							onclick="history.back()" class="btn btn-primary">
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- 모달 대화 상자 -->
	<div class="modal fade" id="confirmationModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">탈퇴 확인</h5>
				</div>
				<div class="modal-body">
					<p>정말 탈퇴하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" id="cancelmodal">취소</button>
					<button type="button" class="btn btn-primary"
						id="confirmDeleteButton">확인</button>
				</div>
			</div>
		</div>
	</div>
	
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
					<button type="button" class="btn btn-secondary" id="cancelmodal2">확인</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 부트스트랩 및 jQuery 스크립트를 포함합니다 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>

	<script>
		// 탈퇴 버튼을 클릭하면 모달 대화 상자를 띄웁니다
		$("#deleteButton").click(function() {
			// 여기에서 비밀번호 확인을 수행
			var password = $("#password").val(); // 입력된 비밀번호
			if (password === "") {
				$("#errorText").text("비밀번호를 입력하세요.");
				$("#errorModal").modal("show");
				return;
			}
			// 비밀번호 확인을 서버로 보내고, 서버에서 확인 후 모달을 띄우도록 변경할 수도 있습니다.

			$("#confirmationModal").modal("show");
		});

		// 취소버튼
		$("#cancelmodal").click(function() {
			// 모달 대화 상자를 닫습니다
			$("#confirmationModal").modal("hide");
		});
		
		// 취소버튼
		$("#cancelmodal2").click(function() {
			// 모달 대화 상자를 닫습니다
			$("#errorModal").modal("hide");
		});

		// 확인 버튼을 클릭하면 탈퇴 작업을 수행하거나 모달을 닫습니다
		$("#confirmDeleteButton").click(function() {
			// 여기에서 탈퇴 작업을 수행하고 서버로 POST 요청을 보냅니다
			var password = $("#password").val(); // 입력된 비밀번호
			if (password === "") {
				$("#errorText").text("비밀번호를 입력하세요.");
				$("#errorModal").modal("show");
				return;
			}

			// 탈퇴 작업을 서버로 보내는 AJAX 요청
			$.ajax({
				type : "POST",
				url : "/page/deleteMember", // 탈퇴 작업을 수행하는 컨트롤러 경로
				data : {
					user_id : $("#user_id").val(), // 사용자 아이디
					password : password
				// 비밀번호
				},
				success : function(data) {
					// 탈퇴 작업이 성공하면 이 부분이 실행됩니다.
					$("#errorText").text("탈퇴가 완료되었습니다.");
					$("#errorModal").modal("show");
					// 5초 후에 리디렉션 실행
				    setTimeout(function() {
				        window.location.href = "/page/main";
				    }, 5000);
				},
				error : function(error) {
					// 탈퇴 작업이 실패하면 이 부분이 실행됩니다.
					$("#errorText").text("비밀번호를 확인해주세요.");
					$("#errorModal").modal("show");
				}
			});

			// 모달 대화 상자를 닫습니다
			$("#confirmationModal").modal("hide");
		});
	
	</script>

	<%@ include file="../include/footer.jsp"%>
</body>
</html>