<%@page import="com.semi.flix.common.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.semi.flix.Q_A.*" %>
<%@page import="com.semi.flix.common.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%String userid= StringUtil.nullToValue(session.getAttribute("userid"), ""); %>
</head>
<body>

	<%
		String key = StringUtil.nullToValue(request.getParameter("key"), "1");
		String keyword = StringUtil.nullToValue(request.getParameter("keyword"), "");
		String pg = StringUtil.nullToValue(request.getParameter("pg"), "0");
	%>
	
	
	

		 <form action="updateQ_A.do" method="post" name="myform"> 
			<input name="q_a_seq" type="hidden" value="${ q_a.q_a_seq }" />

			<table border="1" cellpadding="0" cellspacing="0">
			
			

				<tr>
					<td bgcolor="orange" width="80">제목</td>
					<td align="left"><input name="q_a_title" type="text"
						value="${ q_a.q_a_title }" />
				</tr>
				<tr>
					<td bgcolor="orange">내용</td>
					<td align="left"><textarea name="q_a_contents" cols="70"
							rows="23">${ q_a.q_a_contents }</textarea></td>
				</tr>
				<tr>
					<td bgcolor="orange">등록일</td>
					<td align="left"><input name="q_a_wdate" type="text"
						value="${ q_a.q_a_wdate }" />
				</tr>
				<%-- <tr>
					<td bgcolor="orange">조회수</td>
					<td align="left"><input name="q_a_hit" type="text"
						value="${ q_a.q_a_hit }" />
				</tr> --%>
				
				 <tr>
					<td bgcolor="orange">조회수</td>
					<td align="left"><input name="q_a_hit" type="text"
						value= 0 />
				</tr> 
				
				<tr>
					<td bgcolor="orange">아이디</td>
					<td align="left"><input name="user_id" type="text"
						value="${ q_a.user_id }" />
				</tr>
				
				
				
				

				<%-- <input name="member_id" type="hidden" value="${ Member_ID }" /> --%>


				
			</table>
	
		<hr>
		
		<a href="go_insertQ_A.do">글 등록</a>&nbsp;&nbsp;&nbsp;
		
		<% 
	
		Q_A_DTO dto = (Q_A_DTO)request.getAttribute("q_a");
		System.out.print("----------------2--------------");
		//System.out.println(dto.getUser_id());
		if(userid.equals(dto.getUser_id())){%>
		<a href="deleteQ_A.do?q_a_seq=${ q_a.q_a_seq }">글 삭제</a>&nbsp;&nbsp;&nbsp;
		<a href="getQ_A_List.do">글 목록</a>
		<a href="#" onclick="javascript:document.myform.submit();">글 수정</a>
		
		<%} %>
		
    </form>

</body>
</html>

<script>
function goModify(){
	document.myform.submit();
}
</script>





