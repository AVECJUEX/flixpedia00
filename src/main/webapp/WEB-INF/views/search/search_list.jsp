<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.semi.flix.common.Pager"%>
<%@page import="com.semi.flix.search.*"%>
<%@page import="java.util.List"%>
<%@page import="com.semi.flix.common.StringUtil"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<%@include file="../include/css.jsp" %>
	<title>FlixGo – Online Movies, TV Shows & Cinema HTML Template</title>
</head>
<body class="body">
	
	<%
		request.setAttribute("commonURL", request.getContextPath());
		String key = StringUtil.nullToValue(request.getParameter("key"), "1");
		String keyword = StringUtil.nullToValue(request.getParameter("keyword"), "");
		String pg = StringUtil.nullToValue(request.getParameter("pg"), "0");
		int totalCnt = (Integer)request.getAttribute("totalCnt");
	%>
	
	<%
		List<SearchDto> searchList = (List<SearchDto>)request.getAttribute("searchList");
	%>
	
	<%@include file="../include/header.jsp" %>

		
	

	<!-- page title -->
	<section class="section section--first section--bg" data-bg="<%=request.getContextPath() %>/resources/img/section/section.jpg">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section__wrap">
						<!-- section title -->
						<h2 class="section__title">검색결과</h2>
						<!-- end section title -->

						<!-- breadcrumb -->
						
						<!-- end breadcrumb -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end page title -->
<form name="myform" method="get">
	<input type="hidden" name="pg"  id="pg" value="<%=pg%>"/>
	<input type="hidden" name="key" id="key" value="<%=key%>"/>
	<input type="hidden" name="board_seq"  id="board_seq" value=""/>
	<input type="hidden" name="category_code"  id="category_code" value=""/>
	
		<!-- filter -->
		<div class="filter">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="filter__content">
							<div class="filter__items">
								<!-- filter item -->
								<div class="filter__item" id="filter__genre">
									<span class="filter__item-label">GENRE:</span>
	
									<div class="filter__item-btn dropdown-toggle" role="navigation" id="filter-genre" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										<input type="button" value="선택하세요" id="searchItem">
										
									</div>
	
									<ul class="filter__item-menu dropdown-menu scrollbar-dropdown" aria-labelledby="filter-genre">
										
										<li><a onclick="changeSearch('7')">전체</a></li>
										<li><a onclick="changeSearch('0')">Action</a></li>
										<li><a onclick="changeSearch('1')">Romance</a></li>
										<li><a onclick="changeSearch('2')">Comedy</a></li>
										<li><a onclick="changeSearch('3')">Thriller/Crime</a></li>
										<li><a onclick="changeSearch('4')">Horror</a></li>
										<li><a onclick="changeSearch('5')">Fantasy</a></li>
										<li><a onclick="changeSearch('6')">Drama</a></li>
										
									</ul>
									<button class="sign__btn" type="button" onclick="goSearch()" 
											style="width:100px; height: 30px; margin:2px;">검색</button>
								</div>
								<!-- end filter item -->
	
								<!-- filter item -->
								
							</div>
							
							<!-- filter btn -->
							<button class="filter__btn" type="button">apply filter</button>
							<!-- end filter btn -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end filter -->
	
		<!-- catalog -->
		<div class="catalog">
			<div class="container">
				<div class="row">
					<!-- card -->
					
					
					<%
						for(SearchDto tempDto: searchList){
					%>
					<div class="col-6 col-sm-4 col-lg-3 col-xl-2">
						<div class="card">
							<div class="card__cover">
								
								<img src="${commonURL}/resources/imgview/<%=tempDto.getImages() %>" style="height: 230px;object-fit: cover;">
								<a href="#" class="card__play" onclick="goView('<%=tempDto.getCategory_code()%>', '<%=tempDto.getBoard_seq()%>')">
									
								</a>
						
								
							</div>
							<div class="card__content">
							
								<h3 class="card__title"><a href="#" onclick="goView('<%=tempDto.getCategory_code()%>', '<%=tempDto.getBoard_seq()%>')"><%=tempDto.getTitle() %></a></h3>
								<span class="card__category" style="color:white">
								<%=tempDto.getGenre_name() %>
								</span>
								<span class="card__rate"><i class="icon ion-ios-star"></i><%=tempDto.getRatings() %></span>
							</div>
						</div>
					</div>
					<%} %>
					<!-- end card -->
	
				
	
					<!-- paginator -->
					
					<div class="col-12">
						<%=Pager.makeTag(request, 12, totalCnt) %>
					</div>
					<!-- end paginator -->
				</div>
			</div>
		</div>
		<!-- end catalog -->
</form>
	

	
	 <%@include file="../include/footer.jsp" %>
		<!-- JS -->

</body>
</html>
<script>
window.onload=function(){
	let key = '<%=key%>';
	var texts=["Action", "Romance", "Comedy", "Thriller/Crime", "Horror","Fantasy","Drama","전체"];
	
	document.getElementById("searchItem").value=texts[key];
}
function changeSearch(id)
{
	var texts=["Action", "Romance", "Comedy", "Thriller/Crime", "Horror","Fantasy","Drama","전체"];
	document.getElementById("searchItem").value=texts[id]; //화면에 보이기 위해서 
	document.getElementById("key").value=id;//컨트롤러로 넘기기 위해서
	
}
function goSearch(){
	let frm = document.myform;
	frm.pg.value=0;
	frm.action = "<%=request.getContextPath()%>/search/search_list";
	frm.method="get";
	frm.submit();
}


///////// 카테고리 코드 별로 분기
function goView(code, id)
{
	
	frm = document.myform;
	frm.board_seq.value=id;///////////
	frm.method="get";
	
	
	if(code=='00'){
		frm.category_code.value="00";
		frm.action="${pageContext.request.contextPath}/movie/view";
	} else if(code=='01') {
		frm.category_code.value="01";
		frm.action="${pageContext.request.contextPath}/drama/view";
	} else if(code=='02') {
		frm.category_code.value="02";
		frm.action="${pageContext.request.contextPath}/enter/view";
	} else if(code=='03') {
		frm.category_code.value="03";
		frm.action="${pageContext.request.contextPath}/animation/view";
	} else if(code=='04') {
		frm.category_code.value="04";
		frm.action="${pageContext.request.contextPath}/webtoon/view";
	}
	
	//frm.action="${pageContext.request.contextPath}/drama/view";
	frm.submit();
}
function goPage(pg)
{
	frm = document.myform;
	frm.pg.value=pg;///////////
	frm.method="get";
	frm.action="${pageContext.request.contextPath}/search/search_list";
	frm.submit();
}
</script>