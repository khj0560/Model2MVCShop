<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>


<!-- Bootstrap Dropdown Hover CSS -->
 <link href="/css/animate.min.css" rel="stylesheet">
 <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
  <!-- Bootstrap Dropdown Hover JS -->
 <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
 
 <!-- jQuery UI toolTip 사용 CSS-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
<!-- Bootstrap core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/starter-template.css" rel="stylesheet">

<title>구매 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

	function fncGetAllList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)		
	   	//document.detailForm.submit();		
		$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
	}
	
	$(function() {
		$(".ct_list_pop td:nth-child(1)").on("click" , function() {
			alert($(this).next().val());
			self.location="/purchase/getPurchase?tranNo="+$(this).next().val();
		});

		$(".ct_list_pop td:nth-child(5)").on("click" , function() {		
			
			//$(this).val()은 value에 있는 값을 가져오는 거고 $(this).text().trim()는 text를 가져오는 거니까 잘 구분해서 사용하기!
			alert($(this).text().trim());
			//self.location="/user/getUser?userId="+$(this).text().trim();
			
			var userId = $(this).text().trim();
			$.ajax( 
					{
						url : "/user/getJsonUser/"+userId ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {

							//Debug...
							//alert(status);
							//Debug...
							alert("JSONData : \n"+JSONData);
							alert( "JSON.stringify(JSONData) : \n"+JSON.stringify(JSONData) );
							
							var displayValue = "<h3>"
														+"아이디 : "+JSONData.user.userId+"<br/>"
														+"이  름 : "+JSONData.user.userName+"<br/>"
														+"이메일 : "+JSONData.user.email+"<br/>"
														+"ROLE : "+JSONData.user.role+"<br/>"
														+"등록일 : "+JSONData.user.regDate+"<br/>"
														+"</h3>";
							//Debug...									
							//alert(displayValue);
							$("h3").remove();
							$( "#"+userId+"" ).html(displayValue);
						}
				});
		});
		
		$(".ct_list_pop td:nth-child(13)").on("click" , function() {	
			alert($(this).parents('tr').find('input').val());
			alert($(this).parents('tr').find('input').next().val());
			
			self.location="/purchase/updateTranCode?tranNo="+$(this).parents('tr').find('input').val()+"&tranCode="+$(this).parents('tr').find('input').next().val();
		});
	});
	
	
	
	
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/layout/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->

<div class="container">
	<div class="starter-template">
		<p class="medium">PURCHASE LIST</p><br>
	</div>
</div>

<%-- <form name="detailForm" action="/purchase/listPurchase.do?userId=${purchase.buyer.userId}" method="post"> --%>

<div class="container">
<table class="table">
	<tr>
		<td colspan="11">전체 ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage} 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">전화번호</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">배송현황</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">정보수정</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	
	<c:set var="i" value="0"/>
	<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${i+1}"/>
		<tr class="ct_list_pop">
			<td align="center">
			<%-- <a href="/purchase/getPurchase.do?tranNo=${purchase.tranNo}">${ i }</a> --%>
			${ i }</td>
			<input type="hidden" id="tranNo" name="tranNo" value="${purchase.tranNo}"/>
			<input type="hidden" id="tranCode" name="tranCode" value="${purchase.tranCode}"/>
			<td></td>
					
			<td align="left"><%-- <a href="/user/getUser.do?userId=${purchase.buyer.userId}">${purchase.buyer.userId}</a> --%>
			${purchase.buyer.userId}</td>
			
			<td></td>
			<td align="left">${purchase.receiverName}</td>
			<td></td>
			<td align="left">${purchase.receiverPhone}</td>
			<td></td>
			<td align="left">
			
				현재
								
				<c:choose>
					<c:when test="${purchase.tranCode.trim()=='1'}">
						
						구매완료
						
					</c:when>
					<c:when test="${purchase.tranCode.trim()=='2'}">
						
						배송중
						
					</c:when>
					<c:when test="${purchase.tranCode.trim()=='3'}">
						
						배송완료
						
					</c:when>
				</c:choose>				
						
				상태입니다.
				
			</td>	
			<td></td>
			<td align="left">
			
				<c:if test="${purchase.tranCode.trim()=='2'}">
				<%-- <a href="/purchase/updateTranCode.do?tranNo=${purchase.tranNo}&tranCode=${purchase.tranCode.trim()}">물건도착</a><br/> --%>
				물건도착<br/>
				</c:if>
			
			</td>	
		</tr>
	
		<tr>
			<!-- <td colspan="11" bgcolor="D6D7D6" height="1"></td> -->
			<td id="${purchase.buyer.userId}" colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>	
	</c:forEach>
</table>
</div>
	

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		 	<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/>
			
		<jsp:include page="../common/pageNavigator_new.jsp"/>
		
		</td>
	</tr>
</table>
<!--  페이지 Navigator 끝 -->

</body>
</html>