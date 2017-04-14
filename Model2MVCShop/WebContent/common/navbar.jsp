<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
      <!-- <ul class="nav navbar-nav"> 여기에 navbar-right를 추가하면 오른쪽 정렬이 된다. -->
        <li class="active"><a href="#">로그인</a></li>
        <li><a href="#about">회원가입</a></li>
        <li><a href="#contact">상품검색</a></li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>