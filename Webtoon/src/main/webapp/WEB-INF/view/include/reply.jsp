<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.List" %>
<%@ page import="com.teamb.domain.ReplyVO" %>
<%@ page import="com.teamb.domain.Criteria" %>
<%@ page import="com.teamb.service.ReplyService" %>

<%
    ReplyService replyService = (ReplyService) request.getAttribute("replyService");
    Long boardNum = Long.parseLong(request.getParameter("board_num"));
    Criteria cri = new Criteria(); // 기본 생성자는 pageNum=1, amount=10으로 설정
    List<ReplyVO> replies = replyService.getList(cri, boardNum);
%>



<br>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<div class="reply-section">
    <h4>댓글 목록</h4>
    <ul class="list-group">
        <c:forEach items="${reply}" var="reply">
            <li class="list-group-item">
                <div><strong>작성자:</strong> <c:out value="${reply.user_id}"/></div>
                <div><strong>내용:</strong> <c:out value="${reply.reply_content}"/></div>
                <div><strong>등록일:</strong> <fmt:formatDate value="${reply.reply_regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
                <div><strong>수정일:</strong> <fmt:formatDate value="${reply.reply_w_updatedate}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
            </li>
        </c:forEach>
    </ul>
</div>



    