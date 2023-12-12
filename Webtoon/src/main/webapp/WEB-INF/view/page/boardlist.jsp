<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자유 게시판</title>
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <!-- Core theme CSS (includes Bootstrap)-->
<!--     <link href="css/styles.css" rel="stylesheet" /> -->
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.2.3/css/bootstrap.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css">
	    <style>
		    .dataTables_filter { margin-bottom: 5px;}
		</style>
    <%@include file="../include/menu.jsp" %>
</head>

<body>
    <!-- 메뉴 -->
    <div style="height: 300px; margin: 0 auto; width: 70%; margin-bottom: 250px;">
        <!-- 보드 컨텐츠 -->
        <div id="content" class="container-fluid">
            <h1 class="h1 mb-2 text-gray-800"><b>자유 게시판</b></h1>
            <p class="mb-4">모두가 소통하는 공간입니다. 서로 존중해주세요<br> 선정적이거나 부적절한 콘텐츠 광고성 게시글의 경우 무통보 삭제입니다.</p>
            <hr>
            <div class="mb-4">
                <div class="card-header py-3"></div>
                <div class="card-body"style="margin-top: 20px; margin-bottom: 20px;">
                    <div class="text-end"> 
                        <button class="btn btn-primary" id="writeButton">글쓰기</button>
                    </div>  
                </div>


                <div class="table-responsive">
                    <table id="dataTable" class="table table-bordered">
                        <thead>
                            <tr>
                                <th>글번호</th>
                                <th>글쓴이</th>
                                <th>글제목</th>
                                <th>작성일</th>
                                <th>수정일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="board">
                                <tr>
                                    <td><c:out value="${board.board_num}" /></td>
                                    <td><c:out value="${board.user_id}" /></td>
                                    <td><a href='/page/boardget?board_num=<c:out value="${board.board_num }"/>'>
                                        <c:out value="${board.title}"/>
                                        </a></td>
                                    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.board_regdate}"/></td>
                                    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.board_w_updatedate}"/></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        	<div style="height: 300px; auto; width: 100%; margin-top: 20px;">
                <%@include file="../include/carousel.jsp" %>
            </div>
            <br>
        <hr>
        <%@include file="../include/footer.jsp" %> 
        <!-- 보드 컨텐츠 종료합니다. -->
    </div>  
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <!-- jQuery and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>
    
<!-- 	푸터 -->
    <%@include file="../include/boardmodal.jsp" %>

<!-- 테이블 스크립트 103까지 -->
    <script>
        $(document).ready(function() {
            $('#dataTable').DataTable({
                "order": [[ 0, "desc" ]],
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/1.11.3/i18n/Korean.json"
                },
                "pagingType": "full_numbers"
            });
        });
    </script>
    
<!--     글쓰기 버튼 스크립트 -->
   <script>
	    $(document).ready(function() {
	        // 로그인 상태 확인을 위한 AJAX 요청
	        $.ajax({
	            url: '/page/isLoggedIn',
	            type: 'GET',
	            dataType: 'json',
	            success: function(response) {
	                // 로그인 상태 확인
	                if (response.loggedIn) {
	                    // 로그인 상태일 때 글쓰기 버튼 표시
	                    $("#writeButton").show();
	                } else {
	                    // 비로그인 상태일 때 글쓰기 버튼 숨김
	                    $("#writeButton").hide();
	                }
	            },
	            error: function(error) {
	                console.log('Error: ', error);
	            }
	        });
	
	        // 글쓰기 버튼 클릭 이벤트 처리
	        $("#writeButton").click(function() {
	            window.location.href = '/page/boardregister'; // 등록 페이지로 이동
	        });
	    });
	</script>

    
    
</body>
</html>
