<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<section class="py-5">
<h1><b>즐겨찾기에 추가된 웹툰</b></h1>
<hr>
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-right">


			<c:forEach items="${fav_list}" var="fav">
               <div class="col mb-5">
                  <div class="card h-100">
                     <img style="height: 300px; width: 300px;"
                        class="card-img-top img-thumbnail" src="<c:out value="${fav.thumbnail}"/>"
                        alt="..." />
                     <div class="card-body p-4">
                        <div class="text-center">
                           <h5 class="fw-bolder"><c:out value="${fav.webtoon_title}"/></h5>
                           <div class="d-grid gap-2">
                              <a class="btn btn-outline-primary mt-auto"
                           href='/page/wt_detail?webtoon_id=<c:out value="${fav.webtoon_id}"/>&platform_code=<c:out value="${fav.min_platform_code}"/>'>상세보기</a>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </c:forEach>

		</div>
	</div>
	
</section>