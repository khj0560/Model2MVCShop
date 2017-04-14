<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>ȸ����������</title>

<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
 
 <!-- jQuery UI toolTip ��� CSS-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip ��� JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
<!-- Bootstrap core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/starter-template.css" rel="stylesheet">
 
<script type="text/javascript">

function fncUpdateProduct(){
	//Form ��ȿ�� ����
	
	var name=$("input[name='prodName']").val();
	var	detail=$("input[name='prodDetail']").val();
	var manuDate=$("input[name='manuDate']").val();
	var price=$("input[name='price']").val();

	if(name == null || name.length<1){
		alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(price == null || price.length<1){
		alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
		
	//document.detailForm.action='/updateProduct.do';
	//document.detailForm.submit();
	$("form").attr("method" , "POST").attr("action" , "/product/updateProduct").submit();
	
}

$(function() {
	$(".btn.btn-primary").on("click" , function() {
		fncUpdateProduct();
	});
	$( "btn.btn-default" ).on("click" , function() {
		history.go(-1);
	});
});
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
        monthNamesShort : ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
        dayNamesMin : ['��', '��', 'ȭ', '��', '��', '��', '��'],
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
<!-- <form name="detailForm" method="post" > -->

<input type="hidden" name="prodNo" value="${product.prodNo}"/>

<div class="container">
	<div class="starter-template">
		<p class="medium">UPDATE PRODUCT</p><br>
	</div>
</div>

<div class="container">
	<div class="col-sm-10 col-md-offset-2">
		<label class="col-sm-2 control-label" for="formGroupInputSmall" align="right">��ǰ��</label>
	    <div class="col-sm-6">
	      <input class="form-control" type="text" id="prodName" value="${product.prodName}" name="prodName">
	    </div>
	</div>
</div>
<br>
<div class="container">
	<div class="col-sm-10 col-md-offset-2">
		<label class="col-sm-2 control-label" for="formGroupInputSmall" align="right">��ǰ������</label>
	    <div class="col-sm-6">
	      <input class="form-control" type="text" id="prodDetail" value="${product.prodDetail}" name="prodDetail">
	    </div>
	</div>
</div>
<br>
<div class="container">
	<div class="col-sm-10 col-md-offset-2">
		<label class="col-sm-2 control-label" for="formGroupInputSmall" align="right">��������</label>
	    <div class="col-sm-6">
	      <input class="form-control" type="text" id="manuDate" value="${product.manuDate}" name="manuDate">
	    </div>
	</div>
</div>
<br>
<div class="container">
	<div class="col-sm-10 col-md-offset-2">
		<label class="col-sm-2 control-label" for="formGroupInputSmall" align="right">����</label>
	    <div class="col-sm-6">
	      <input class="form-control" type="text" id="price" value="${product.price}" name="price">
	    </div>
	</div>
</div>
<br>
<div class="container">
	<div class="col-sm-10 col-md-offset-2">
		<label class="col-sm-2 control-label" for="formGroupInputSmall" align="right">��ǰ �̹���</label>
	    <div class="col-sm-6">
	    	<input class="form-control" type="file" id="fileNameText" placeholder="image file" name="fileNameText">
	      <%-- <input class="form-control" type="text" id="fileName" value="${product.fileName}" name="fileName"> --%>
	    </div>
	</div>
</div>
<br>
<div class="container">
	<div class="col-sm-10 col-md-offset-2">
		<label class="col-sm-2 control-label" for="formGroupInputSmall" align="right">��ǰ �̹���</label>
	    <div class="col-sm-6">
	    	<input class="form-control" type="text" id="fileName" placeholder="image file" name="fileName">
	      <%-- <input class="form-control" type="text" id="fileName" value="${product.fileName}" name="fileName"> --%>
	    </div>
	</div>
</div>
<br>
<br>
<div class="container">
	<div class="col-xs-4 col-md-offset-5">
	<button type="button" class="btn btn-primary">����</button>
	<button type="button" class="btn btn-default">���</button>
</div>

<%-- 
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ�� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">
						<input 	type="text" name="prodName" class="ct_input_g" 
										style="width: 100px; height: 19px" maxLength="20" value="${product.prodName}">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ������ <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="prodDetail" value="${product.prodDetail}" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10"	minLength="6">
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			�������� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" readonly="readonly" name="manuDate" value="${product.manuDate}" 	
						class="ct_input_g" style="width: 100px; height: 19px" maxLength="10" minLength="6">&nbsp;
						<img 	src="../images/ct_icon_date.gif" width="15" height="15" 
									onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)" />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			���� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="price" value="${product.price}"
						class="ct_input_g" style="width: 100px; height: 19px" maxLength="50"/>&nbsp;��
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">��ǰ�̹���</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input	type="file" name="fileName" class="ct_input_g" 
						style="width: 200px; height: 19px" maxLength="13" value="${product.fileName}"/>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01"	style="padding-top: 3px;">
						<!-- <a href="javascript:fncAddProduct();"></a> -->
						����
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif"width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<!-- <a href="javascript:history.go(-1)"></a> -->
						���
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table> 
--%>
</form>

</body>
</html>