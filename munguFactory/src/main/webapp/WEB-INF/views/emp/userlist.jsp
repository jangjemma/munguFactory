<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<%
	String context = request.getContextPath();
%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function userlistDeptSearch()
{
	var dept_no = $('#dept_no').val();
	
	location.href= '<%=context%>/admin/userlistDeptSearch?dept_no=' + dept_no;
}
	

</script>
</head>
<body>
	<c:set var="no" value="${page.total-page.start+1 }"></c:set>
	<div class="container-fluid">
		<h3>사원 목록</h3>
		<div>
			부서별 조회:
			<select name="dept_no" id="dept_no">
				<option value="0">전체</option>
				<c:forEach var="dept" items="${deptlist}">
					<option value="${dept.dept_no}">${dept.dept_name}</option>
				</c:forEach>
			</select>
			<button onclick="userlistDeptSearch()">조회하기</button>
		</div>
		<table class="table table-hover text-center">
			<tr><th>사원명</th><th>사원 번호</th><th>사원 아이디</th><th>부서명</th><th>직급</th><th>사용자 등급</th><th>정보 수정</th></tr>
			<c:forEach var="emp" items="${emplist}">
				<tr>
					<td>${emp.emp_name}</td>
					<td>${emp.emp_no}</td>
					<td>${emp.emp_id}</td>
					<td>${emp.dept_name}</td>
					<td>${emp.posit_name}</td>
					<td>${emp.auth_name}</td>
					<td><button type="button" class="btn btn-primary" onclick="location.href = '/admin/adminGetUserInfo?emp_no=${emp.emp_no}'">정보 수정</button></td>
				</tr>
				<c:set var="no" value="${no - 1 }"></c:set>
	
			</c:forEach>
		</table>
		
		<c:choose>
			<c:when test="${dept_no eq 0}">
				<c:if test="${page.startPage > page.pageBlock }">
					<a href="/admin/userlist?currentPage=${page.startPage-page.pageBlock}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					<a href="/admin/userlist?currentPage=${i}">[${i}]</a>
				</c:forEach>
				<c:if test="${page.endPage < page.totalPage }">
					<a href="/admin/userlist?currentPage=${page.startPage+page.pageBlock}">[다음]</a>
				</c:if>	
			</c:when>
			
			<c:otherwise>
				<c:if test="${page.startPage > page.pageBlock }">
					<a href="/admin/userlistDeptSearch?currentPage=${page.startPage-page.pageBlock}&&dept_no=${dept_no}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					<a href="/admin/userlistDeptSearch?currentPage=${i}&&dept_no=${dept_no}">[${i}]</a>
				</c:forEach>
				<c:if test="${page.endPage < page.totalPage }">
					<a href="/admin/userlistDeptSearch?currentPage=${page.startPage+page.pageBlock}&&dept_no=${dept_no}">[다음]</a>
				</c:if>	
			</c:otherwise>
		</c:choose>
	
	</div>
</body>
</html>