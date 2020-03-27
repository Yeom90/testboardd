<%--
  Created by IntelliJ IDEA.
  User: kbsjob
  Date: 2020-03-16
  Time: 오후 6:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- begin::Head -->
    <meta charset="utf-8" />
    <meta name="description" content="Static table examples">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="/resources/css/perfect-scrollbar.css" rel="stylesheet" type="text/css" />
    <link href="/resources/css/bootstrap-datepicker_new.css" rel="stylesheet" type="text/css" />
    <link href="/resources/css/daterangepicker.css" rel="stylesheet" type="text/css" />
    <link href="/resources/css/bootstrap-select.css" rel="stylesheet" type="text/css" />
    <link href="/resources/css/line-awesome.css" rel="stylesheet" type="text/css" />
    <link href="/resources/css/flaticon.css" rel="stylesheet" type="text/css" />
    <link href="/resources/css/flaticon2.css" rel="stylesheet" type="text/css" />
    <link href="/resources/css/all.min.css" rel="stylesheet" type="text/css" />
    <link href="/resources/css/style.bundle_new.css" rel="stylesheet" type="text/css" />
    <link href="/resources/css/light.css" rel="stylesheet" type="text/css" />
    <link href="/resources/css/dark.css" rel="stylesheet" type="text/css" />
    <link href="/resources/css/common.css?v=20191104" rel="stylesheet" type="text/css" />

    <!-- 2019-0806 jquery.js > 하단 에서 상단으로 위치 변경: 모달팝업 인풋박스 아래 텍스트 유동적 나오는 소스 포함+기존 셀렉트 박스 등 -->
    <script src="/assets/vendors/general/jquery/dist/jquery.js" type="text/javascript"></script>
    <!-- 2019-0806  bootstrapvalidator.min.js > 모달팝업 인풋박스 아래 유동적 테스트 나오게 하는 소스 추가 -->
    <script src="/assets/vendors/general/jquery/dist/bootstrapvalidator.min.js"></script>
    <link rel="shortcut icon" href="/resources/images/favicon.ico" />

    <style>
        .kt-header--fixed.kt-aside--minimize .kt-header {
            /* left: 70px;*/
            left: 0px !important;
            -webkit-transition: all 0.3s ease;
            transition: all 0.3s ease;
        }
        .kt-aside--enabled .kt-header.kt-header--fixed {
            /* left: 255px; */
            left: 0px !important;
        }
        .kt-aside__brand {
            background-color:#3f2676 !important;
            -webkit-box-shadow: none;
            box-shadow: none;
        }

        .kt-aside__brand .kt-aside__brand-tools .kt-aside__brand-aside-toggler svg {
            height: 25px;
            width: 25px;
            margin-right: -4px;
        }
    </style>
<!-- end::Head -->
