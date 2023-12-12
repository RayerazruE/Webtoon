<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<title>업로드</title>
<div class="card">
	<div class="card-header">검색</div>
	<div class="card-body">

		<form action="wt_upload" method="post">
		
		<textarea rows="30" cols="200" name="WTJson"></textarea>
		<br>
		<button type="submit">등록</button>
		</form>
	</div>
</div>