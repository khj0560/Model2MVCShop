<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>



<html>
<head>
<title>상품등록</title>

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

function fncAddProduct() {
	
	var name=$("input[name='prodName']").val();
	var	detail=$("input[name='prodDetail']").val();
	var manuDate=$("input[name='manuDate']").val();
	var price=$("input[name='price']").val();
	
	if(name == null || name.length < 1){
		alert("상품명은 반드시 입력하셔야 합니다.");
		return;
	}
	
	if(detail == null || detail.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	
	if(manuDate == null || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	
	if(price == null || price.length < 1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}
	
	//document.detailForm.action='/product/addProduct';
	//document.detailForm.submit();
	$("form").attr("method" , "POST").attr("action" , "/product/addProduct").submit();
}




$(function() {
	
	$(".btn.btn-primary").on("click" , function() {
		fncAddProduct();
	});
	
	$(".btn.btn-default").on("click" , function() {		
		$("form")[0].reset();
	});
	
	$("#manuDate").datepicker({
    	showOn:'button',
		buttonImage:'../images/ct_icon_date.gif',
    	
		dateFormat : "yy-mm-dd",
        monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNamesMin : ['일', '월', '화', '수', '목', '금', '토'],
        changeMonth : true,
        changeYear : true,
        yearRange : "c-70:c+70",
        showMonthAfterYear : true
    });
});



</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/layout/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->


<form name="detailForm">
<!-- <form name="detailForm" method="post"> -->
<!-- <form name="detailForm" method="post" enctype="multipart/form-data"> 이 부분이 이미지 파일 업로드 시키는 아이인데 얘 쓰면 getParameter를 쓸 수 없음  -->

<div class="container">
	<div class="starter-template">
		<p class="medium">ADD PRODUCT</p><br>
	</div>
</div>

<div class="container">
	<div class="col-sm-10 col-md-offset-2">
		<label class="col-sm-2 control-label" for="formGroupInputSmall" align="right">상품명</label>
	    <div class="col-sm-6">
	      <input class="form-control" type="text" id="prodName" placeholder="Product Name" name="prodName">
	    </div>
	</div>
</div>
<br>
<div class="container">
	<div class="col-sm-10 col-md-offset-2">
		<label class="col-sm-2 control-label" for="formGroupInputSmall" align="right">상품상세정보</label>
	    <div class="col-sm-6">
	      <input class="form-control" type="text" id="prodDetail" placeholder="Product Detail" name="prodDetail">
	    </div>
	</div>
</div>
<br>
<div class="container">
	<div class="col-sm-10 col-md-offset-2">
		<label class="col-sm-2 control-label" for="formGroupInputSmall" align="right">제조일자</label>
	    <div class="col-sm-6">
	      <input class="form-control" type="text" id="manuDate" placeholder="Manufacture Date" name="manuDate">
	    </div>
	</div>
</div>
<br>
<div class="container">
	<div class="col-sm-10 col-md-offset-2">
		<label class="col-sm-2 control-label" for="formGroupInputSmall" align="right">가격</label>
	    <div class="col-sm-6">
	      <input class="form-control" type="text" id="price" placeholder="price" name="price">
	    </div>
	</div>
</div>
<br>
<div class="container">
	<div class="col-sm-10 col-md-offset-2">
		<label class="col-sm-2 control-label" for="formGroupInputSmall" align="right">상품 이미지</label>
	    <div class="col-sm-6">
	      <input class="form-control" type="file" id="fileNameText" placeholder="image file" name="fileNameText">
	    </div>
	</div>
</div>
<br>
<div class="container">
	<div class="col-sm-10 col-md-offset-2">
		<label class="col-sm-2 control-label" for="formGroupInputSmall" align="right">상품 이미지</label>
	    <div class="col-sm-6">
	      <input class="form-control" type="text" id="fileName" placeholder="image file" name="fileName">
	    </div>
	</div>
</div>
<br>
<br>
<div class="container">
	<div class="col-xs-4 col-md-offset-5">
	<button type="button" class="btn btn-primary">등록</button>
	<button type="button" class="btn btn-default">취소</button>
</div>

</form>
</body>
</html>