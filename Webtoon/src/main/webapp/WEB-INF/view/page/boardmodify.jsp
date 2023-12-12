<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ page import="com.teamb.domain.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>자유 게시판 글쓰기</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
    <!-- 헤더  -->
    <%@ include file="../include/menu.jsp" %>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <style>
    input[readonly], textarea[readonly] {background-color: #f0f0f0; cursor: not-allowed;}
    input[readonly]:focus, textarea[readonly]:focus { background-color: #f0f0f0; border-color: #f0f0f0; outline: none; box-shadow: none; }  
    /*리드온리 관련 스타일*/
    .hidden {display: none;} <!-- 글번호 ui 에서 숨기기 -->
	</style>

</head>
<body class="bg-gradient-primary">

	<!-- 글 삭제 함수 -->
    <script type="text/javascript">
	    $(function() {
	        const formObj = $("form");
	
	        $('button').on("click", function(e) {
	            e.preventDefault();
	            
	            const operation = $(this).data("oper");
	
	            if (operation === "remove") {
	                formObj.attr("action", "/page/boardremove");
	            } else if (operation === "list") {
	                self.location='/page/boardlist';
	                return;
	            }
	            
	            formObj.submit();
	        });
	    });
	</script>

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-5">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="h2 mb-4 text-gray-800">게시글 내용 수정</h1>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-lg-12">
                        <form role="form" action="/page/boardmodify" method="post">
                        	<div class="form-group mb-3 hidden">
                                <label>글번호</label>
                                <input type="text" class="form-control" name='board_num' value='<c:out value="${board.board_num }"/>' readonly="readonly">
                            </div>
                            <div class="form-group mb-3 hidden">
                                <label>글쓴이</label>
                                <input type="text" class="form-control" name='user_id' value='<c:out value="${board.user_id }"/>' readonly="readonly">
                            </div>
                            <div class="form-group mb-3">
                                <label class="h5">글 제목</label>
                                <input type="text" class="form-control" name='title' value='<c:out value="${board.title }"/>'>
                            </div>
                            <div class="form-group mb-3">
                                <label class="h5">내용</label>
                                <textarea class="form-control" rows="5" name='board_content'><c:out value="${board.board_content }"/></textarea>
                            </div>
                            <div class="form-group mb-3">
                                <label>작성일</label>
                                <input type="text" class="form-control" name='board_regDate' value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.board_regdate}"/>' readonly="readonly">
                            </div>
                            <div class="form-group mb-3">
                                <label>수정일</label>
                                <input type="text" class="form-control" name='board_w_updateDate' value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.board_w_updatedate}"/>' readonly="readonly">
                            </div>
                                    <button type="submit" data-oper='modify' class="btn btn-warning">수정</button>
                                    <button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
                                    <button type="submit" data-oper='list' class="btn btn-primary">목록</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
	    $(document).ready(function() {
	        var userId = "<%= session.getAttribute("member") != null ? ((MemberVO) session.getAttribute("member")).getUser_id() : "" %>";
	        var authorId = "<c:out value="${board.user_id }"/>";
	
	        // 로그인하지 않은 경우
	        if(userId == "") {
	            alert("로그인이 필요한 서비스입니다.");
	            window.location.href = "/page/memberlogin"; // 로그인 페이지 경로를 입력하세요.
	        }
	        // 로그인은 했으나 글쓴이와 일치하지 않는 경우
	        else if(userId != authorId) {
	            alert("접근 권한이 없습니다.");
	            window.location.href = "/page/boardlist"; // 목록 페이지 경로를 입력하세요.
	        }
	    });
	</script>

	
</body>
</html>