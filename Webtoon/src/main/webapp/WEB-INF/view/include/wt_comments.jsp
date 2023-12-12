<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>





<div class="form-floating">
	<textarea class="form-control" placeholder="Leave a comment here"
		id="NewComment" name="NewComment"></textarea>
	<label for="floatingTextarea">한줄평 : <span id="charCount">50자</span></label>

	<br>

	<div class="d-grid gap-2">
		<button id="CommentSubmitButton" class="btn btn-primary">등록</button>
	</div>

</div>

<hr>



<ol class="list-group">
	<c:forEach items="${cmtList}" var="cmtList" varStatus="loop">
		<li
			class="list-group-item d-flex justify-content-between align-items-start">
			<div class="ms-2 me-auto">
				<div class="fw-bold text-primary">
					<c:out value="${cmtList.name}" />
				</div>
				
<!-- 				<div id="displayText"> -->
					<c:out value="${cmtList.comments_content}" />	
<!-- 				</div> -->
				
				
				<c:if test="${cmtList.user_id == User_id}">
				<textarea id="editableText" style="display: none"
					class="form-control" rows="2" cols="70" placeholder="한줄평 : 50자"
					id="ModifyComment" name="ModifyComment"></textarea>
				</c:if>
					
				<c:set var="cmt_user_id" value="${User_id}" />
				<input type="hidden" value="<c:out value="${User_id}"/>">
				 <c:set var="users_ids" value="${cmtList.user_id}" />
				 <input id="user_id" type="hidden"
					value="<c:out value="${cmtList.user_id}"/>">
					
			</div>
			
				<c:if test="${cmtList.user_id == User_id}">
					&nbsp; <button class="btn btn-primary mt-auto " id="editButton1"
						onclick="editText()">수정하기</button>
					<button class="btn btn-primary mt-auto" id="editButton2"
						onclick="saveText()" style="display: none">수정완료</button>
					<button class="btn btn-warning mt-auto" id="editButton3"
						onclick="cancelText()" style="display: none">수정취소</button> &nbsp;
					<c:set var="Webtoon_id" value="${webtoon_id}" />
					<input type="hidden" value="<c:out value="${Webtoon_id}"/>">
					<c:choose>
					<c:when test="${member.admin_code == 1}">
					<button class="btn btn-danger mt-auto" id="CommentDeleteButton" style="display: none;">삭제</button>	
					</c:when>
					<c:when test="${member.admin_code == 2}">
					<button class="btn btn-danger mt-auto" id="CommentDeleteButton">삭제</button>	
					</c:when>
					</c:choose>
				</c:if>
				
					
				
				
					<c:set var="index" value="${loop.index}"/>
					<c:set var="Webtoon_id" value="${webtoon_id}" />
					
					<c:if test="${member.admin_code == 1}">
					<button class="btn btn-danger mt-auto" onclick="admindeleteComment('${users_ids}')">삭제</button>
					</c:if>
					
				
				
		</li>
	</c:forEach>

</ol>
<!-- createElement -->

<%@ include file="./wt_recommend.jsp"%>

<script>
	$("#CommentSubmitButton").click(function() {
		
		var textareaValue = document.getElementById("NewComment").value.trim();
		
		if (textareaValue === "") {
	        alert("내용을 입력해 주세요.");
	        return false; // 폼 전송을 중단합니다.
	    }
		
		$.ajax({
			type : 'POST',
			url : 'wt_contents', // 서버 측 코드의 URL
			data : {
				user_id : user_id.value,
				webtoon_id : webtoon_id.value,
				NewComment : $('#NewComment').val()

			},
			cache : false, // 캐시 사용하지 않음
			dataType : 'json', // 서버에서 받아온 데이터의 형식
			success : function(commentSuccess) {

				// 			alert(commentSuccess)
				if (commentSuccess == 1) {
					// 				alert("한줄평이 등록되었습니다.");
					location.reload();

				} else if (commentSuccess == 0) {
					alert("등록실패");

				}

			},
			error : function(xhr, textStatus, errorThrown) {
				// 서버 요청 자체가 실패한 경우 (예: 네트워크 문제 등)
				// 에러 처리를 수행하거나 사용자에게 오류 메시지를 표시할 수 있음
				console.error('서버 요청 실패:', textStatus, errorThrown);
				alert("요청실패")
			}
		});
		
		return true;
	});

	//HTML 요소를 가져옵니다.
	const textarea = document.getElementById('NewComment');
	const charCount = document.getElementById('charCount');

	// 최대 글자 수를 정의합니다.
	const maxLength = 50;

	// textarea의 입력 이벤트를 모니터링합니다.
	textarea.addEventListener('input', function() {
		const text = textarea.value;
		const remainingChars = maxLength - text.length;

		// 글자 수를 업데이트합니다.
		charCount.textContent = remainingChars;

		// 글자 수가 제한을 초과하면 잘라냅니다.
		if (remainingChars < 0) {
			textarea.value = text.slice(0, maxLength);
			charCount.textContent = 0;
		}
	});

	// function cmtdelete() {
	// 	var result = confirm("삭제하시겠습니까?");

	// 	if (result) {
	// 	    window.location.href = "/page/wt_cmt_delete?webtoon_id=" + Webtoon_id + "&user_id=" + cmt_user_id;
	// 	    alert("삭제완료!");
	// 	    location.reload();
	// 	} else {
	// 	    return false;
	// 	}

	// }

	// var Webtoon_id = "${Webtoon_id}";
	// var cmt_user_id = "${cmt_user_id}";

	$("#CommentDeleteButton").click(function() {

		var userConfirmed = confirm("한줄평을 삭제하시겠습니까?");

		if (userConfirmed) {

			$.ajax({
				type : 'GET',
				url : 'wt_cmt_delete', // 서버 측 코드의 URL
				data : {
					webtoon_id : webtoon_id.value

				},
				cache : false, // 캐시 사용하지 않음
				dataType : 'json', // 서버에서 받아온 데이터의 형식
				success : function(cmtdelete) {

					//  			alert(cmtdelete)
					if (cmtdelete == 1) {
						// 				alert("삭제");
						location.reload();

					} else if (cmtdelete == 0) {
						alert("삭제실패");

					}

				},
				error : function(xhr, textStatus, errorThrown) {
					// 서버 요청 자체가 실패한 경우 (예: 네트워크 문제 등)
					// 에러 처리를 수행하거나 사용자에게 오류 메시지를 표시할 수 있음
					console.error('서버 요청 실패:', textStatus, errorThrown);
					alert("요청실패")
				}
			});

		} else {
		}

	});

	// $("#CommentSubmitButton").click(function() {
	// 	$.ajax({
	// 		type : 'GET',
	// 		url : 'wt_detail', // 서버 측 코드의 URL
	// 		cache : false, // 캐시 사용하지 않음
	// 		dataType : 'json', // 서버에서 받아온 데이터의 형식
	// 		success : function(commentSuccess) {

	// 			alert(commentSuccess)
	// 			if(commentSuccess == 1){

	// 			} else {

	// 			}

	// 		},
	// 		error : function(xhr, textStatus, errorThrown) {
	// 			// 서버 요청 자체가 실패한 경우 (예: 네트워크 문제 등)
	// 			// 에러 처리를 수행하거나 사용자에게 오류 메시지를 표시할 수 있음
	// 			console.error('서버 요청 실패:', textStatus, errorThrown);
	// // 			alert("요청실패")
	// 		}
	// 	});

	// });

	//var users_id = ${users_id}

	 function admindeleteComment(users_id) {
		 
		//var users_id = $('#users_id').val();
		
		 
// 		 alert("Button " + users_id + "이 클릭되었습니다.");
		 
		var userConfirmed = confirm("사용자의 한줄평을 삭제하시겠습니까?");


 		
		if (userConfirmed) {

			$.ajax({
				type : 'GET',
				url : 'admin_cmt_delete', // 서버 측 코드의 URL
				data : {
					webtoon_id : webtoon_id.value,
					users_id : users_id
				},
				cache : false, // 캐시 사용하지 않음
				dataType : 'json', // 서버에서 받아온 데이터의 형식
				success : function(admincmtdelete) {

					//  			alert(admincmtdelete)
					if (admincmtdelete == 1) {
						// 				alert("삭제");
						location.reload();

					} else if (admincmtdelete == 0) {
						alert("삭제실패");

					}

				},
				error : function(xhr, textStatus, errorThrown) {
					// 서버 요청 자체가 실패한 경우 (예: 네트워크 문제 등)
					// 에러 처리를 수행하거나 사용자에게 오류 메시지를 표시할 수 있음
					console.error('서버 요청 실패:', textStatus, errorThrown);
					alert("요청실패")
				}
			});

		} else {
		}
	}

	function editText() {
// 		var displayText = document.getElementById('displayText');
		var editableText = document.getElementById('editableText');
		var editButton = document.getElementById('editButton1');
		var saveButton = document.getElementById('editButton2');
		var cancelButton = document.getElementById('editButton3');

// 		displayText.style.display = 'none';
		editableText.style.display = 'block';
		editButton.style.display = 'none';
		saveButton.style.display = 'inline-block';
		cancelButton.style.display = 'inline-block';

		// 기존 텍스트를 textarea에 복사
// 		editableText.value = displayText.innerText;
	}

	function saveText() {
// 		var displayText = document.getElementById('displayText');
		var editableText = document.getElementById('editableText');
		var editButton = document.getElementById('editButton1');
		var saveButton = document.getElementById('editButton2');
		var cancelButton = document.getElementById('editButton3');

		var cmtmodify = editableText.value;
		
		var textValue = document.getElementById("editableText").value.trim();
		
		if (textValue === "") {
	        alert("내용을 입력해 주세요.");
	        return false; // 폼 전송을 중단합니다.
	    }

		$.ajax({
			type : 'GET',
			url : 'wt_cmt_modify', // 서버 측 코드의 URL
			data : {
				webtoon_id : webtoon_id.value,
				ModifyComment : cmtmodify

			},
			cache : false, // 캐시 사용하지 않음
			dataType : 'json', // 서버에서 받아온 데이터의 형식
			success : function(wtcmtmodify) {

				//     			alert(wtcmtmodify)
				if (wtcmtmodify == 1) {
					//     				alert("한줄평이 등록되었습니다.");
					location.reload();

				} else if (wtcmtmodify == 0) {
					alert("등록실패");

				}

			},
			error : function(xhr, textStatus, errorThrown) {
				// 서버 요청 자체가 실패한 경우 (예: 네트워크 문제 등)
				// 에러 처리를 수행하거나 사용자에게 오류 메시지를 표시할 수 있음
				console.error('서버 요청 실패:', textStatus, errorThrown);
				alert("요청실패")
			}
		});

		//     displayText.innerText = editableText.value;

// 		displayText.style.display = 'block';
		editableText.style.display = 'none';
		editButton.style.display = 'inline-block';
		saveButton.style.display = 'none';
		cancelButton.style.display = 'none';
		
		return true;
	}

	function cancelText() {
// 		var displayText = document.getElementById('displayText');
		var editableText = document.getElementById('editableText');
		var editButton = document.getElementById('editButton1');
		var saveButton = document.getElementById('editButton2');
		var cancelButton = document.getElementById('editButton3');



		//     displayText.innerText = editableText.value;

// 		displayText.style.display = 'block';
		editableText.style.display = 'none';
		editButton.style.display = 'inline-block';
		saveButton.style.display = 'none';
		cancelButton.style.display = 'none';
	}
	
	const editextarea = document.getElementById('editableText');
    const editmaxLength = 50;

    editextarea.addEventListener('input', function () {
        if (editextarea.value.length > editmaxLength) {
        	editextarea.value = editextarea.value.slice(0, editmaxLength);
        }
    });
	
	
</script>





<!-- 회원과 관리자만 보이는것 -->
<!-- 회원 -->
<!--     <a href="../page/wtcmt_modify" class="btn btn-primary btn-sm">수정</a> -->
<!-- 	<button type="button" class="btn btn-danger btn-sm">삭제</button> -->
<!-- 관리자 -->
<!-- 	<button type="button" class="btn btn-danger btn-sm">삭제</button> -->
