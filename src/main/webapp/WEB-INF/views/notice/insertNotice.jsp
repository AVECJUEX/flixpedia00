<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.semi.flix.notice.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
HttpSession session1 = request.getSession();

String id = (String) session1.getAttribute("id");
String user_id = (String) session1.getAttribute("userid");
NoticeDTO dto = (NoticeDTO)request.getAttribute("notice");
dto = dto == null ? new NoticeDTO():dto;

%>
<body>
<form action="insertNotice.do" method="post">
	<input type="hidden" name="notice_seq" value = "<%=dto.getNotice_seq()%>"/>
	<input type="hidden" name="id" value = "<%=id%>"/>
	<input type="hidden" name="user_id" value = "<%=user_id%>"/>
	
	<table border="1" cellpadding="0" cellspacing="0">
	    <tr>
	        <td width="70">제목</td><td align="left">
	        <input type="text" name="notice_title"/></td>
	    </tr>
	    <tr>
	        <td>내용</td><td align="left">
	        <textarea name="notice_content" cols="70" rows="23"></textarea></td>
	       
	    </tr>
	    <!-- <tr>
	        <td>조회수</td><td align="left">
	        <input type="text" name="q_a_hit" size="10"/></td>
	    </tr> -->
	    
	    <tr>
	        <td colspan="2" align="center">
	        <input type="submit" value=" 새글 등록 "/></td>
	    </tr>
	</table>
	</form>
	<hr>
	<a href="getNotice_List.do">글 목록 가기</a>

</body>
</html>