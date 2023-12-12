<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	min-height: 100vh;
	overflow-y: scroll
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
}

.id_ok {
	color: #008000;
	display: none;
}

.id_already {
	color: #A63641;
	display: none;
}
</style>

</head>

<body>
	<!-- 부트스트랩 및 jQuery 스크립트를 포함합니다 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>


	<%@ include file="../include/menu.jsp"%>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">회원가입</h4>

				<form name="joinForm" action="/page/memberjoin" method="post"
					class="validation-form" id="joinForm" novalidate>

					<div class="form-group mb-3">
						<label for="user_id" class="form-label mt-2">아이디</label> <input
							type="text" class="form-control" id="user_id" name="user_id"
							placeholder="ID" autocomplete='off' required>
						<div id="id_check"></div>
					</div>

					<div class="form-group mb-3">
						<label for="password" class="form-label mt-2">패스워드</label> <input
							type="password" class="form-control" id="password"
							name="password" placeholder="" required>
					</div>

					<div class="form-group mb-3">
						<label for="passwordRe" class="form-label mt-2">패스워드확인</label> <input
							type="password" class="form-control" id="passwordRe"
							name="passwordRe" placeholder="" required>
						<div id="pw_check"></div>
					</div>

					<div class="form-group mb-3">
						<label for="name" class="form-label mt-2">닉네임</label> <input
							type="text" class="form-control" id="name" name="name"
							placeholder="" value="" autocomplete='off' required>
							<div id="name_check"></div>
					</div>

					<div class="form-group mb-3">
						<label for="email" class="form-label mt-2">이메일</label> <input
							type="email" class="form-control" id="email" name="email"
							placeholder="you@example.com" required autocomplete='off'>
					</div>

					<div class="form-group mb-3">
						<label for="phone" class="form-label mt-2">전화번호</label> <input
							type="tel" class="form-control" id="phone" name="phone"
							placeholder="010-0000-0000" required autocomplete='off'>
					</div>

					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<label class="custom-control-label" for="aggrement">개인정보
							수집 및 이용에 동의합니다.</label> <input type="checkbox"
							class="custom-control-input" id="aggrement" required>
					</div>
					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" id="signupbtn"
						type="button" onclick="signup()" >가입완료</button>
				</form>
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
					<button type="button" class="btn btn-secondary" id="cancelmodal">확인</button>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="../include/footer.jsp"%>

`
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script>

var idclear = 0;
var pwclear = 0;
var nameclear = 0;

// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#user_id").blur(function() {
		// id = "id_reg" / name = "userId"
		var user_id = $('#user_id').val();
		$.ajax({
			url : '/page/checkId?user_id='+ user_id,
			type : 'get',
			success : function(cnt) {
				console.log("1 = 중복o / 0 = 중복x : "+ cnt);							
				
				if (cnt == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다.");
						$("#id_check").css("color", "red");
						idclear = 0;
					} else {
						// 0 : 아이디가 중복없음.
						$("#id_check").text("사용가능한 아이디입니다.");
						$("#id_check").css("color", "green");
						idclear = 1;
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});

// 패스워드 유효성 검사
$('#passwordRe').blur(function() {
    var passwordval = $('#password').val();
    var passwordokval = $('#passwordRe').val();
    var passwordcheck = /^[a-zA-Z0-9]+$/;

    if (!passwordcheck.test(passwordval) || passwordval.length < 8) {
        $("#pw_check").text("비밀번호는 영대소문자, 숫자로 구성된 8글자 이상으로 조합하세요.");
        $("#pw_check").css("color", "orange");
    } else {
        if (passwordokval) {
            if (passwordval !== passwordokval) {
                $("#pw_check").text("비밀번호가 다릅니다.");
                $("#pw_check").css("color", "red");
                pwclear = 0;
            } else {
                $("#pw_check").text("사용가능한 비밀번호 입니다.");
                $("#pw_check").css("color", "green");
                pwclear = 1;
            }
        } else {
            $("#pw_check").text("비밀번호 확인을 입력해주세요.");
            $("#pw_check").css("color", "black");
            pwclear = 0;
        }
    }
});

// 닉네임 유효성 검사(1 = 중복 / 0 != 중복)
	$("#name").blur(function() {
		var name = $('#name').val();
		$.ajax({
			url : '/page/checkName?name='+ name,
			type : 'get',
			success : function(cnt) {
				console.log("1 = 중복o / 0 = 중복x : "+ cnt);							
				
				if (cnt == 1) {
						// 1 : 중복되는 문구
						$("#name_check").text("사용중인 닉네임입니다.");
						$("#name_check").css("color", "red");
						nameclear = 0;
					} else {
						// 0 : 중복없음.
						$("#name_check").text("사용가능한 닉네임입니다.");
						$("#name_check").css("color", "green");
						nameclear = 1;
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
		
		
// 회원가입 제출시 재확인
// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	function checkIdValidity() {
	    var user_id = $('#user_id').val();
	    $.ajax({
	        url: '/page/checkId?user_id=' + user_id,
	        type: 'get',
	        success: function (cnt) {
	            console.log("1 = 중복o / 0 = 중복x : " + cnt);

	            if (cnt == 1) {
	                // 1 : 아이디가 중복되는 문구
	                $("#id_check").text("사용중인 아이디입니다.");
	                $("#id_check").css("color", "red");
	                idclear = 0; // 중복된 경우 idclear를 0으로 설정
	            } else {
	                // 0 : 아이디가 중복없음.
	                $("#id_check").text("사용가능한 아이디입니다.");
	                $("#id_check").css("color", "green");
	                idclear = 1;
	            }
	        },
	        error: function () {
	            console.log("실패");
	        }
	    });
	}

	$("#user_id").blur(checkIdValidity);

	// 패스워드 유효성 검사
	function checkPasswordValidity() {
	    var passwordval = $('#password').val();
	    var passwordokval = $('#passwordRe').val();
	    var passwordcheck = /^[a-zA-Z0-9]+$/;

	    if (!passwordcheck.test(passwordval) || passwordval.length < 8 || passwordval !== passwordokval) {
	        $("#pw_check").text("비밀번호 조건을 다시 확인하세요.");
	        $("#pw_check").css("color", "red");
	        pwclear = 0;
	    } else {
	        $("#pw_check").text("사용가능한 비밀번호 입니다.");
	        $("#pw_check").css("color", "green");
	        pwclear = 1;
	    }
	}

	$('#passwordRe').blur(checkPasswordValidity);

	// 닉네임 유효성 검사(1 = 중복 / 0 != 중복)
	function checkNameValidity() {
	    var name = $('#name').val();
	    $.ajax({
	        url: '/page/checkName?name=' + name,
	        type: 'get',
	        success: function (cnt) {
	            console.log("1 = 중복o / 0 = 중복x : " + cnt);

	            if (cnt == 1) {
	                // 1 : 중복되는 문구
	                $("#name_check").text("사용중인 닉네임입니다.");
	                $("#name_check").css("color", "red");
	                nameclear = 0;
	            } else {
	                // 0 : 중복없음.
	                $("#name_check").text("사용가능한 닉네임입니다.");
	                $("#name_check").css("color", "green");
	                nameclear = 1;
	            }
	        },
	        error: function () {
	            console.log("실패");
	        }
	    });
	}

	$("#name").blur(checkNameValidity);
	
	// 동의여부
	var checkbox = document.getElementById("aggrement");

	// 회원가입제출
	function signup() {
	    checkIdValidity(); // 아이디 유효성 검사 다시 실행
	    checkPasswordValidity(); // 패스워드 유효성 검사 다시 실행
	    checkNameValidity(); // 닉네임 유효성 검사 다시 실행
	    console.log("idclear : " + idclear);
	    console.log("pwclear : " + pwclear);
	    console.log("nameclear : " + nameclear);
	    console.log("check1 : "+checkbox.checked);
	    console.log("check2 : "+document.getElementById("aggrement").checked);
	    
	    if (checkbox.checked == false) {
	    	$("#errorText").text("개인정보 수집이용에 동의해주세요.");
	    	$("#errorModal").modal("show");
	    	return false;
	    }
	
		if (idclear != 1) {
	    	$("#errorText").text("아이디를 확인해 주세요.");
	    	$("#errorModal").modal("show");
			$('#user_id').focus();
			return false;
		}
		if (pwclear != 1) {
	    	$("#errorText").text("비밀번호를 확인해 주세요.");
	    	$("#errorModal").modal("show");
			$('#password').focus();
			return false;
		}
		if (nameclear != 1) {
			$("#errorText").text("닉네임을 확인해 주세요.");
	    	$("#errorModal").modal("show");
			$('#name').focus();
			return false;
		}
		
		document.getElementById("joinForm").submit();
	}
	
	//취소버튼
	$("#cancelmodal").click(function() {
		
	// 모달 대화 상자를 닫습니다
	$("#errorModal").modal("hide");
	});


</script>

</body>

</html>