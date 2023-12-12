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
    	<%@ include file="../include/menu.jsp" %>
    	
		<!-- section -->
		<div style="height: 200px; margin: 0 auto; width: 70%; margin-top: 150px; margin-bottom: 10px;">
		<div class="form-floating">
			<div class="d-grid gap-2 col-6 mx-auto">
			  <a class="btn btn-lg btn-primary" type="button" href="/page/memberlogin">로그인 해주세요.</a>
			</div>
		</div>
	</div>
    	
    	<!-- Carousel -->
        <div style="height: 500px; margin: 0 auto; width: 70%;">
        <%@ include file="../include/carousel.jsp" %>
        </div>
    	
        <!-- Footer-->
<!--         <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer> -->
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <%@ include file="../include/footer.jsp" %>
        
    </body>
</html>
