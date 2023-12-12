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
    <!-- Bootstrap CSS and JS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" ></script>
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
    <!-- 헤더  -->
    <%@ include file="../include/menu.jsp" %>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <style>
    	/* 글쓴이 부분 스타일 고정  */
        #user_id {background-color: #f0f0f0; cursor: not-allowed;}
        #user_id:focus {background-color: #f0f0f0; border-color: #f0f0f0; outline: none; box-shadow: none;}
    </style>
    
</head>
<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-5">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">게시판 글쓰기</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <form role="form" action="/page/boardregister" method="post">
								    <div class="mb-3">
								        <label for="title" class="form-label">글제목</label>
								        <input type="text" class="form-control" name="title" id="title">
								    </div>
								
								    <div class="mb-3">
								        <label for="board_content" class="form-label">내용</label>
								        <textarea class="form-control" rows="3" name="board_content" id="board_content"></textarea>
								    </div>
								
								    <div class="mb-3">
								        <label for="user_id" class="form-label">글쓴이</label>
								        <input type="text" class="form-control" name="user_id" id="user_id">
								    </div>
								    
								        <button type="submit" class="btn btn-success">글등록</button>
								        <button type="button" class="btn btn-warning" id="resetButton">재작성</button>
								        <button type="button" class="btn btn-primary" id="goBackButton">글목록</button>
								</form>
                            </div>
                            <!-- end panel body -->
                        </div>
                        <!-- end panel -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    
<!-- 목록페이지 돌아가기 스크립트 -->
    <script>
        document.getElementById('goBackButton').addEventListener('click', function() {
        	window.location.href = "boardlist"; // 목록 페이지로 돌아가는 명령
        });
    </script>
    
<!-- 글쓴이를 로그인 유저로 고정하는 스크립트 -->
    <script type="text/javascript">
	    $(document).ready(function() {
	        var userId = "<%= session.getAttribute("member") != null ? ((MemberVO) session.getAttribute("member")).getUser_id() : "" %>";
	        if(userId != "") {
	            document.getElementById('user_id').value = userId;
	            document.getElementById('user_id').readOnly = true;
	        }
	    });
	</script>
	
	
	
<!-- 재작성 버튼 제목, 내용 초기화 -->
	<script type="text/javascript">
	 $('#resetButton').click(function() {
         document.getElementById('title').value = '';
         document.getElementById('board_content').value = '';
     });
	</script>
	
<!-- 제목/내용이 하나라도 비어있으면 제출 불가능 -->
	<script type="text/javascript">
	    $(document).ready(function() {
	        $('form').submit(function(event) {
	            var title = document.getElementById('title').value.trim();
	            var content = document.getElementById('board_content').value.trim();
	            
	            if(title === "" && content === "") {
	                alert("제목과 내용을 입력해주세요.");
	                document.getElementById('title').focus();
	                event.preventDefault(); // submit 이벤트를 중지합니다.
	            } else if(title === "") {
	                alert("제목을 입력해주세요.");
	                document.getElementById('title').focus();
	                event.preventDefault(); // submit 이벤트를 중지합니다.
	            } else if(content === "") {
	                alert("내용을 입력해주세요.");
	                document.getElementById('board_content').focus();
	                event.preventDefault(); // submit 이벤트를 중지합니다.
	            }
	        });
	    });
	</script>
	
<!--비정상적인 경로를 통해 등록페이지로 오면 알림창 띄우고 로그인페이지로 보내기 -->
	<script type="text/javascript">
	    $(document).ready(function() {
	        // 세션에 member가 있는지 확인합니다.
	        var userId = "<%= session.getAttribute("member") != null ? ((MemberVO) session.getAttribute("member")).getUser_id() : "" %>";
	        if(userId == "") {
	            // member가 없다면 알림을 표시하고 로그인 페이지로 리디렉션합니다.
	            alert("로그인이 필요한 서비스입니다.");
	            window.location.href = "/page/memberlogin"; // 로그인 페이지 경로를 입력하세요.
	        }
	    });
	</script>
	    
</body>
</html>
