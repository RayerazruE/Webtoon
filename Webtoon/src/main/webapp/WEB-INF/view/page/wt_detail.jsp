<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>웹툰추천!!!!</title>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
		<!-- menu -->
		<div>
    	<%@ include file="../include/menu.jsp" %>
		</div>
        <!-- Section 1 -->
        <%@ include file="../include/wt_desc.jsp" %>
        <!-- Section 2 -->
        <div style="height: 300px; margin: 0 auto; width: 70%; margin-top: 50px; margin-bottom: 250px;">
        <%@ include file="../include/wt_comments.jsp" %>
        </div>
        <!-- Section 3 -->
<!--         <div style="height: 300px; margin: 0 auto; width: 70%; margin-top: 50px; margin-bottom: 250px"> -->
<%--         <%@ include file="../include/wt_recommend.jsp" %> --%>
<!--         </div> -->
    </body>
</html>

