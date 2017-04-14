<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>상품 목록조회</title>

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
 
  
<script type="text/javascript">

	function fncGetAllList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)		
	   	//document.detailForm.submit();		
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=search").submit();
	}
	
	$(function() {
		$("button").on("click" , function() {
			fncGetAllList(1);
		});

		
		$(".ct_list_pop td:nth-child(12)").on("click", function() {
			alert($(this).parents('tr').find('input').val());
			alert($(this).parents('tr').find('input').next().next().val());
			self.location="/purchase/updateTranCodeByProd?prodNo="+$(this).parents('tr').find('input').val()+"&tranCode="+$(this).parents('tr').find('input').next().next().val();
		});
		
		//==> UI 수정 추가부분  :  userId LINK Event End User 에게 보일수 있도록 
		$( ".ct_list_pop td:nth-child(6)" ).css("color" , "red");
		$("h7").css("color" , "red");
		
	});
	
	$( document ).ready(function() { 
	       $('.ct_list_pop td:nth-child(6)').click(function(){ 
	        $('#popup_layer, #overlay_t').show(); 
	        $('#popup_layer').css("top", Math.max(0, $(window).scrollTop() + 100) + "px"); 
	        // $('#popup_layer').css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px");
	        
	        var prodNo = $(this).parents('tr').find('input').val();
			var menu = $(this).parents('tr').find('input').next().val();
			alert(prodNo);
			alert(menu);
			
			if(menu=="manage"){
				self.location="/product/getProduct?prodNo="+prodNo+"&menu="+menu;
			}else{
				
				$.ajax( 
						{
							url : "/product/getJsonProduct/"+prodNo+"/"+menu,
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
															+"상품번호 : "+JSONData.product.prodNo+"<br/>"
															+"상품명 : "+JSONData.product.prodName+"<br/>"
															+"상품이미지 : "+JSONData.product.fileName+"<br/>"
															+"상품상세정보 : "+JSONData.product.prodDetail+"<br/>"
															+"제조일자 : "+JSONData.product.manuDate+"<br/>"
															+"가격	 : "+JSONData.product.price+"<br/>"
															+"등록일자 : "+JSONData.product.regDate+"<br/>"
															+"</h3>";
								//Debug...									
								//alert(displayValue);
								$("h3").remove();
								$( "#abc" ).html(displayValue);
							}
					});
				}
	    }); 
	    $('#overlay_t, .close').click(function(e){ 
	        e.preventDefault(); 
	        $('#popup_layer, #overlay_t').hide(); 
	    }); 
	});

</script>
</head>

<body>

<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/layout/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->
<form>	
<!-- ///Product list 검색바/// -->
<div class="container">
	<div class="starter-template">
		<p class="medium">PRODUCT LIST</p><br>
		<div class="col-md-12">
			<div class="col-xs-1 col-md-offset-3" align="left">
				<select name="searchCondition" class="form-control" style="width:80px">
					<%-- /////////////////////// EL / JSTL 적용 ////////////////////////--%>
					<option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : ""}>상품번호</option>
					<option value="1" ${! empty search.searchCondition && search.searchCondition==1 ? "selected" : ""}>상품명</option>
					<option value="2" ${! empty search.searchCondition && search.searchCondition==2 ? "selected" : ""}>가격</option>
				</select>		
			</div>
			<div class="col-md-4" align="center">
			<input class="form-control" type="text" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : ""}" 
				 placeholder="Search">
			</div>
			<div class="col-xs-1" align="left">
				<button class="btn btn-default" type="submit">검색</button>
			</div>
		</div>
	</div>
</div>

<p class="trigger"></p>
<div id="overlay_t"></div> 
<div id="popup_layer">
<div id="abc">
<button>버튼</button>
</div>
</div>





<!-- user로 로그인한 경우 상품검색 -->
<c:if test="${param.menu=='search'}">

	<div class="container">
	<table class="table">
		<tr>
			<%-- /////////////////////// EL / JSTL 적용 ////////////////////////--%>
			<td colspan="11" >전체 ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage} 페이지</td>
		</tr>
		<tr>
			<td></td>
		</tr>
	</table>
	</div>

	<div class="container">
	 	<c:set var="i" value="0"/>
		<c:forEach var="product" items="${list}">
		<c:set var="i" value="${i+1}"/>
		
		<c:if test="${i%3==1}">
			<div class="row">
		</c:if>
		
            <div class="col-md-4 portfolio-item">
            <input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}"/>
			<input type="hidden" id="menu" name="menu" value="${param.menu}"/>
			<input type="hidden" id="tranCode" name="tranCode" value="${product.proTranCode}"/>
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/600x400" <%-- src="/images/uploadFiles/${product.fileName}"  width="600px" height="400px" --%> alt="" >
                </a>
                <h3>
                    ${product.prodName}
                </h3>
                <p>${product.price}</p>
                <p>${product.prodDetail}</p>       
            </div>
        <c:if test="${i%3==0}">
        	</div>
        </c:if>
        
        </c:forEach>
	</div>
</c:if>





<c:if test="${param.menu=='manage'}">

<div class="container">
<table class="table">
	<tr>
		<%-- /////////////////////// EL / JSTL 적용 ////////////////////////--%>
		<td colspan="11" >전체 ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage} 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">상품명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">가격</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">등록일</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">현재상태</td>	
	</tr>

	<%-- /////////////////////// EL / JSTL 적용 ////////////////////////--%>
	
	<c:set var="i" value="0"/>
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${i+1}"/>
		<tr class="ct_list_pop">
			<td align="left">${ i }</td>
			<input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}"/>
			<input type="hidden" id="menu" name="menu" value="${param.menu}"/>
			<input type="hidden" id="tranCode" name="tranCode" value="${product.proTranCode}"/>
			<td></td>
					
			<td align="left">
			
			<%-- <a href="/product/getProduct?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a> --%>					
			${product.prodName}
			
			</td>
			
			<td></td>
			<td align="left">${product.price}</td>
			<td></td>
			<td align="left">${product.manuDate}</td>
			<td></td>
			<td align="left">
			
				
				<c:if test="${param.menu=='search'}">
					<c:choose>
						<c:when test="${product.proTranCode.trim()=='0'}" >
							판매중
							<br/>
						</c:when>
						<c:otherwise>
							재고없음
							<br/>
						</c:otherwise>
					</c:choose>
				</c:if> 
				
				
				<c:if test="${param.menu=='manage'}">
					<c:choose>
						<c:when test="${product.proTranCode.trim()=='0'}" >
							판매중
							<br/>
						</c:when>
						<c:when test="${product.proTranCode.trim()=='1'}" >
							구매완료
							<%-- <a href="/purchase/updateTranCodeByProd?prodNo=${product.prodNo}&tranCode=${product.proTranCode}">배송하기<br/> --%>
							배송하기
						</c:when>
						<c:when test="${product.proTranCode.trim()=='2'}" >
							배송중
							<br/>
						</c:when>
						<c:when test="${product.proTranCode.trim()=='3'}" >
							배송완료
							<br/>
						</c:when>
					</c:choose>
				</c:if> 				
					
			</td>
		
		</tr>

	</c:forEach>
</table>

</c:if>




<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
			<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/>
	
		<jsp:include page="../common/pageNavigator_new.jsp"/>	
		
    	</td>
	</tr>
</table>
</form>

</body>
</html>
