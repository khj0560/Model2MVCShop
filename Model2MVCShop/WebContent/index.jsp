<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="EUC-KR">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    

    <!-- Bootstrap CDN -->
	<!-- http://getbootstrap.com/getting-started/ ���� -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	<!-- jQuery CDN -->
	<!-- http://getbootstrap.com/javascript/ Ȯ�� -->
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>MODEL2 MVC SHOP</title>

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../css/starter-template.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
    
  	//============= �α��� ȭ���̵� =============
		$( function() {
			//==> �߰��Ⱥκ� : "addUser"  Event ����
			$(".btnwt").on("click" , function() {
				alert("�α�������!!");
				self.location = "/user/login"
			});
		});
  	
		//============= ȸ�������� ȭ���̵� =============
		$( function() {
			//==> �߰��Ⱥκ� : "addUser"  Event ����
			$(".btnbd").on("click" , function() {
				alert("ȸ����������!!!!!");
				self.location = "/user/addUser"
			});
		});
		
		//============= ��������ũ�� =============
		function fnMove(seq){
	        var offset = $("#div" + seq).offset();
	        $('html, body').animate({scrollTop : offset.top}, 400);
	    }

    
    </script>

  </head>

  <body class="body-index">

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

    <!-- navbar ����. �ϴ� ������ ���� �ּ�ó�� 
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">MVCSHOP</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-right">
          <ul class="nav navbar-nav"> ���⿡ navbar-right�� �߰��ϸ� ������ ������ �ȴ�.
            <li class="active"><a href="#">�α���</a></li>
            <li><a href="#about">ȸ������</a></li>
            <li><a href="#contact">��ǰ�˻�</a></li>
          </ul>
        </div>/.nav-collapse
      </div>
    </nav> -->

    <div class="container">

      <div class="starter-template-main">
        <p class="black">MODEL2 MVC SHOP</p>
        <div class="p1">
        	<p class="small-light">Model 2 MVC Shop�� Model 2 Web Architecture�� ���ظ� ���� ������� ���θ� ������ �Դϴ�. �α��� �� �̿����ּ���.</p>
      	</div>
      	<hr class="hrMedium"><br><br>
      	<button type="button" class="btnwt" name="login">LOGIN</button><br><br>
      	<button type="button" class="btnbd" name="addUser">ADD USER</button>
      </div>

    </div><!-- /.container -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/bootstrap/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
