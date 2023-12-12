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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
    
    <!-- 헤더  -->
    <%@ include file="../include/menu.jsp" %>
    <!-- 제이 쿼리  -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- 글번호 ui 에서 숨기기 -->
    <style>.hidden {display: none;}</style>
    </head>
<body class="bg-gradient-primary">

    <div class="container">
    
<!--     수정/삭제 동작 스크립트 -->
	<script type="text/javascript">
		$(function() {
		    const formObj = $("#operForm");
		
		    $('button').on("click", function(e) {
		        e.preventDefault();
		        
		        const operation = $(this).data("oper");
		
		        if (operation === "remove") {
		            formObj.attr("action", "/page/boardremove");
		        } else if (operation === "list") {
		            formObj.find("#board_num").remove();
		            formObj.attr("action", "/page/boardlist");
		        } else if (operation === "modify") {
		            formObj.attr("action", "/page/boardmodify");
		        }
		        
		        formObj.submit();
		    });
		});
	</script>


        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-5">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"><c:out value="${board.title}"/></h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                
                <div class="row">
                    <div class="panel panel-default">
                        
                        <div class="form-group mb-3 hidden">
                            <label>글번호</label> 
                            <input class="form-control" name='board_num' value='<c:out value="${board.board_num }"/>' readonly="readonly">
                        </div>
                        
                        <div class="form-group mb-3">
                            <label>글쓴이</label> 
                            <input class="form-control" name='user_id' value='<c:out value="${board.user_id }"/>' readonly="readonly">
                        </div>
                        
                        <div class="form-group mb-3">
                            <label>글내용</label>
                            <textarea class="form-control" rows="3" name='board_content' readonly="readonly"><c:out value="${board.board_content }"/></textarea>
                        </div>
                        
                            <button type="submit" data-oper='modify' class="btn btn-warning">수정</button>
                           	<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
                            <button type="submit" data-oper='list' class="btn btn-primary">목록</button>
                  
                  		<form id='operForm' action="page/boardmodify" method="get"> <!-- get이다 수정창 띄우는거니까 -->
                  			<input type='hidden' id='board_num' name='board_num' value='<c:out value="${board.board_num}"/>'>
                  		</form>
                  		<hr>
                  			
<!--                   			댓글 인클루두 하기 -->
<%-- 							<%@ include file="../include/reply.jsp" %> --%>
                  			
                    </div>
                    <!-- end panel-body -->
                </div>
                <!--  end panel-body -->
            </div>
            <!-- end panel -->
        </div>
        <!-- /. -->
        
    </div>
    
<!--     버튼 처리 스크립트 -->
   	<script>
	    $(document).ready(function() {
	        // 서버로부터 로그인 정보 가져오기
	        $.ajax({
	            url: '/page/isLoggedIn',
	            type: 'GET',
	            dataType: 'json',
	            success: function(response) {
	                const loggedInUserId = response.user_id;
	                const adminCode = response.admin_code;
	                const authorId = $("input[name='user_id']").val(); // 글쓴이 ID
	
	                // 관리자 체크
	                if (parseInt(adminCode) === 1) {   // parseInt(adminCode) === 1 문자열로 반환되어도 일치하면 넘겨주기
	                    // 관리자는 모든 글에 대해 삭제 버튼 표시
	                    $("button[data-oper='remove']").show();
	
	                    // 관리자이면서 본인이 작성한 글인 경우 수정 버튼 표시
	                    if (loggedInUserId === authorId) {
	                        $("button[data-oper='modify']").show();
	                    } else {
	                        // 본인이 작성하지 않은 글은 수정 버튼 숨김
	                        $("button[data-oper='modify']").hide();
	                    }
	                } else if (loggedInUserId) {
	                    // 일반 사용자는 본인이 작성한 글에 대해 수정 및 삭제 버튼 표시
	                    if (loggedInUserId === authorId) {
	                        $("button[data-oper='modify']").show();
	                        $("button[data-oper='remove']").show();
	                    } else {
	                        // 본인이 작성하지 않은 글은 수정 및 삭제 버튼 숨김
	                        $("button[data-oper='modify']").hide();
	                        $("button[data-oper='remove']").hide();
	                    }
	                } else {
	                    // 로그인하지 않은 사용자는 모든 버튼 숨김
	                    $("button[data-oper='modify']").hide();
	                    $("button[data-oper='remove']").hide();
	                }
	            },
	            error: function(error) {
	                console.log('Error: ', error);
	            }
	        });
	    });
	</script>

    
</body>
</html>
