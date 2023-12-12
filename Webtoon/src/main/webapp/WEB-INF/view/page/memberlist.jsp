<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>

<style>
body {
	min-height: 100vh;
	overflow-y: scroll;
}

/* 테이블 가운데 정렬을 위한 스타일 */
.center-table {
    margin: 0 auto;
    float: none;
}

table {
	max-width: 1080px;
	margin: 0px auto;
}

th {
    text-align: center; /* 가로 가운데 정렬 */
}

th, td {
    vertical-align: middle; /* 세로 가운데 정렬 */
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

	<table class="table table-info table-bordered">
		<thead>
			<th scope="col" style="width: 5%;"><strong>NO</strong></th>
			<th scope="col" style="width: 15%;"><strong>아이디</strong></th>
			<th scope="col" style="width: 15%;"><strong>닉네임</strong></th>
			<th scope="col" style="width: 20%;"><strong>이메일</strong></th>
			<th scope="col" style="width: 20%;"><strong>휴대폰번호</strong></th>
			<th scope="col" style="width: 10%;"><strong>권한</strong></th>
			<th scope="col" style="width: 15%;"><strong>관리</strong></th>
		</thead>
		<c:forEach var="row" items="${list}" varStatus="loop">
    <tbody>
        <tr class="table-light">
            <td class="table-light">${loop.index + 1 }</td>
            <td class="table-light">${row.user_id}</td>
            <td class="table-light">${row.name}</td>
            <td class="table-light">${row.email}</td>
            <td class="table-light">${row.phone}</td>
            <td class="table-light">${row.admin_code}</td>
            <td class="table-light">
                <button class="btn btn-warning admin_editbtn">수정</button>
                <button class="btn btn-danger admin_delbtn">삭제</button>
            </td>
        </tr>
    </tbody>
</c:forEach>
	</table>

<%@ include file="../include/footer.jsp"%>

<!-- Add this modal to your HTML -->
<div class="modal" id="deleteModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">계정 삭제 확인</h5>
      </div>
      <div class="modal-body">
        <p>정말로 이 계정을 삭제하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="cancelmodal">취소</button>
        <button type="button" class="btn btn-danger" id="confirmDeleteBtn">삭제</button>
      </div>
    </div>
  </div>
</div>

<script>

// 취소버튼
	$("#cancelmodal").click(function() {
		// 모달 대화 상자를 닫습니다
		$("#deleteModal").modal("hide");
	});


	$(document).ready(function () {
	    // Click event for delete buttons
	    $(".admin_delbtn").on('click', function () {
	        // Get data from the selected row
	        var user_id = $(this).closest("tr").find("td:eq(1)").text();

	        // Show the delete confirmation modal
	        $("#deleteModal").modal("show");

	        // Set the user_id in a hidden field for later use
	        $("#deleteModal #userIdToDelete").val(user_id);
	    });

	    // Click event for confirm delete button
	    $("#confirmDeleteBtn").on('click', function () {
	        // Get the user_id from the hidden field
	        var userIdToDelete = $("#deleteModal #userIdToDelete").val();
			
	        console.log("ajax 전달");
	        
	        // Perform an AJAX request to delete the user on the server
	        $.ajax({
	            type: "POST", // or "DELETE" depending on your server-side implementation
	            url: "/page/deleteUser", // Change this to the actual endpoint for deleting user data
	            data: { user_id: userIdToDelete },
	            success: function (response) {
	                // Handle the success response (e.g., close the modal, update the table)
	                $("#deleteModal").modal("hide");
	                // Add additional logic as needed
	            },
	            error: function (error) {
	                // Handle the error (e.g., display an error message)
	                console.error("Error deleting user:", error);
	                // Add additional error handling logic as needed
	            }
	        });
	    });
	});
</script>


</body>
</html>