<%--
  Created by IntelliJ IDEA.
  User: kbsjob
  Date: 2020-03-27
  Time: 오전 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">

<!-- begin::Head -->
<head>
    <title>KG이니시스 상담관리 시스템</title>
    <%@include file="include/head.jsp" %>
</head>
<body class="kt-header--fixed kt-header-mobile--fixed kt-subheader--fixed kt-subheader--enabled kt-subheader--solid kt-aside--enabled kt-aside--fixed kt-page--loading">
<!-- begin:: Page -->
<div class="kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor kt-wrapper" id="kt_wrapper">


    <!-- hader 시작  -->
    <%@include file="include/header.jsp" %>
    <!-- hader 끝  -->

    <!-- menu 시작 -->
    <div class="kt-aside  kt-aside--fixed  kt-grid__item kt-grid kt-grid--desktop kt-grid--hor-desktop" id="kt_aside"
         style="margin-top: 59px;">


        <!-- begin:: Aside Menu -->
        <%@include file="include/aside.jsp" %>
        <!--Menu 끝 -->

        <!--  Content   시작 -->
        <div class="kt-content  kt-grid__item kt-grid__item--fluid">

            <!--<div class="page_title" ><span style="color: #333a49;">KG Inicis</span>  상담관리 시스템  </div-->

            <div class="KGbox_warp">
                <div class="KGbox">
                    <span class="flaticon-notes KGicon_01"> </span>
                    <span class="KGfont"> 기초 정보</span>
                </div>
                <div class="m20">
                    <div class="KG_sicon01"></div>
                    <span class="fo18 fl">조직관리</span>
                </div>
            </div>

            <div class="KGbox_warp">
                <div class="KGbox">
                    <span class="flaticon-support KGicon_02"> </span>
                    <span class="KGfont">통화 이력</span>
                </div>
                <div class="m20">
                    <div class="KG_sicon02"></div>
                    <span class="fo18 fl">통화청취</span>
                </div>
            </div>

            <div class="KGbox_warp">
                <div class="KGbox">
                    <span class="flaticon-graphic-2 KG_icon03"> </span>
                    <span class="KGfont"> 통계</span>
                </div>
                <div class="m20">
                    <div class="KG_sicon03"></div>
                    <span class="fo18 fl">시간 및 상담원별 통계</span>
                </div>
            </div>
            <div style="font-size: 35px; margin: 20px;  width: 300px; height: 300px; padding: 20px ;    background-color: #FFF; float: left; border-radius: 4px !important;">
                <div style="border-radius: 4px !important; background-color: rgba(77, 89, 149, 0.06);">
                    <span class="flaticon-analytics" style="color:#666; margin-left: 20px; font-size: 33px;"> </span>
                    <span style="font-size: 30px; margin-left: 10px; color:#666; letter-spacing:-0.8px;"> 모니터링</span>
                </div>
                <div style=" margin: 20px; width: 260px; display:block;">
                    <div style="height: 8px;
    width: 8px;
    border-radius: 50%; background-color: #666; margin: 10px; float: left;"></div>
                    <span style="font-size: 18px; float: left; ">전광판</span>
                </div>
                <div style=" margin: 18px 0px 0px 20px; width: 100%; float: left;">
                    <div style="height: 8px;
    width: 8px;
    border-radius: 50%; background-color: #666;  margin: 10px; float: left;"></div>
                    <span style="font-size: 18px;  float:left;">상담현황</span>
                </div>
            </div>

        </div>
        <!--  Content  끝 -->
    </div>
    <!-- page 끝 -->

    <!-- Global Config, Global Mandatory, Optional Vendors -->
    <%@include file="include/plugin_js.jsp" %>

</body>

<!-- end::Body -->
</html>
