<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>


	
	<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<th bgcolor="orange" width="100">글번호
				<th bgcolor="orange" width="200">제목
				<th bgcolor="orange" width="150">내용
				<th bgcolor="orange" width="150">등록일
				<th bgcolor="orange" width="150">조회수
				<th bgcolor="orange" width="150">아이디
			</tr>
		<c:forEach items="${notice_List}" var="notice">
				<tr>
					<td>${ notice.notice_seq }</td>
					<td align="left"><a	href="getNotice.do?notice_seq=${ notice.notice_seq }">
					 ${ notice.notice_title }</a></td>
					<td>${notice.notice_content  }</td>
					<%-- <td><fmt:formatDate value="${ notice.wdate }" pattern="yyyy-MM-dd" /></td> --%>
					<td>${notice.wdate  }</td>
					<td>${notice.notice_hit  }</td>
					<td>${notice.user_id  }</td>
				</tr>
			</c:forEach>
		</table>
		<br> <a href="go_insertNotice.do">새 글 등록</a>

</body>
</html>