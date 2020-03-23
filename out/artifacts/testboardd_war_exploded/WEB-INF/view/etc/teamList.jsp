<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<% String CONTEXT_PATH = request.getContextPath();%>

<!DOCTYPE html>
<html>
<!-- begin::Head -->
<head>
    <meta charset="utf-8" />
    <title>조직정보 [팀]관리</title>
    <meta name="description" content="Static table examples">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="<%=CONTEXT_PATH%>/resources/css/perfect-scrollbar.css" rel="stylesheet" type="text/css" />
    <link href="<%=CONTEXT_PATH%>/resources/css/bootstrap-datepicker_new.css" rel="stylesheet" type="text/css" />
    <link href="<%=CONTEXT_PATH%>/resources/css/daterangepicker.css" rel="stylesheet" type="text/css" />
    <link href="<%=CONTEXT_PATH%>/resources/css/bootstrap-select.css" rel="stylesheet" type="text/css" />
    <link href="<%=CONTEXT_PATH%>/resources/css/line-awesome.css" rel="stylesheet" type="text/css" />
    <link href="<%=CONTEXT_PATH%>/resources/css/flaticon.css" rel="stylesheet" type="text/css" />
    <link href="<%=CONTEXT_PATH%>/resources/css/flaticon2.css" rel="stylesheet" type="text/css" />
    <link href="<%=CONTEXT_PATH%>/resources/css/all.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=CONTEXT_PATH%>/resources/css/style.bundle_new.css" rel="stylesheet" type="text/css" />
    <link href="<%=CONTEXT_PATH%>/resources/css/light.css" rel="stylesheet" type="text/css" />
    <link href="<%=CONTEXT_PATH%>/resources/css/dark.css" rel="stylesheet" type="text/css" />
    <link href="<%=CONTEXT_PATH%>/resources/css/common.css?v=20190625" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="<%=CONTEXT_PATH%>/resources/images/favicon.ico" />
    <style>
        .kt-badge.kt-badge--unified-success {

            background: rgba(10, 187, 135, 0.1);
        }</style>
</head>
<!-- begin::Body -->
<body class="kt-header--fixed kt-header-mobile--fixed kt-subheader--fixed kt-subheader--enabled kt-subheader--solid kt-aside--enabled kt-aside--fixed kt-page--loading">
<!-- end:: Header Mobile -->
<div class="kt-grid kt-grid--hor kt-grid--root">
    <div class="kt-grid__item kt-grid__item--fluid kt-grid kt-grid--ver kt-page">
        <!-- begin:: Aside -->
        <button class="kt-aside-close " id="kt_aside_close_btn"><i class="la la-close"></i></button>
        <div class="kt-aside  kt-aside--fixed  kt-grid__item kt-grid kt-grid--desktop kt-grid--hor-desktop" id="kt_aside">

            <div class="kt-aside__brand kt-grid__item " id="kt_aside_brand">
                <div class="kt-aside__brand-logo">
                    <img alt="Logo" src="../../../resources/images/logo-light.png" onclick="popAgentApp();"  />
                </div>
                <div class="kt-aside__brand-tools">
                    <button class="kt-aside__brand-aside-toggler" id="kt_aside_toggler">
								<span class="fa fa-angle-double-left" style="color:#777;">
								</span>
                        <span class="fa fa-angle-double-right" style="color:#777;">
								</span>
                    </button>
                </div>
            </div>
            <!-- menu include -->

            <jsp:include page="../include/test_aside.jsp"></jsp:include>



        <div class="kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor kt-wrapper" id="kt_wrapper">

            <!-- begin:: Header -->
            <div id="kt_header" class="kt-header kt-grid__item  kt-header--fixed">
                <!-- begin:: Header Menu -->
                <button class="kt-header-menu-wrapper-close" id="kt_header_menu_mobile_close_btn"><i class="la la-close"></i></button>
                <div class="kt-header-menu-wrapper" id="kt_header_menu_wrapper">

                </div>
                <div class="kt-header__topbar">
                    <div style="margin:10px 0px 0px 10px;">  메세지: <span class="kt-badge kt-badge--brand">3</span>  </div>
                    <div style="margin:10px 10px 0px 10px;"> 이메일:   <span class="kt-badge kt-badge--warning"> 38</span>   </div>

                    <div style="margin:10px;">
                        <span  style="font-weight: bold;"> 내선번호[ ${sessionScope.login.getStation()} ] / </span>
                        <span  style="font-weight: bold;"> ${sessionScope.login.getName()}님 </span>  환영합니다.
                    </div>
                    <a href="/login/sessionLogout">
                        <span class="kt-badge kt-badge--username kt-badge--unified-success kt-badge--lg kt-badge--rounded kt-badge--bold" style="margin-top:9px; width: 100px; height: 25px; font-size: 13px;"> 로그아웃
                                <span class="la la-sign-out"   style="color:#666; font-size: 1.5rem !important; margin-left: 4px;"></span>
                        </span>
                    </a>
                </div>
            </div>
            <!-- Content include -->



            <form name="searchForm" action="teamList" method="post">
                <%--<input id="order_item" type="hidden" name ="order_item" value="${modelMap.order_item}" ></input>
                <input id="order_value" type="hidden" name ="order_value" value="${modelMap.order_value}"></input>--%>
                <input id="currentPage" type="hidden" name ="currentPage" value="${modelMap.currentPage}"></input>
                <input id="in_maxPost" type="hidden" name="maxPost" value="${modelMap.maxPost}"></input>
                <input id="start_dt" type="hidden" name="start_dt" value="${modelMap.start_dt}"></input>
                <input id="end_dt" type="hidden" name="end_dt" value="${modelMap.end_dt}"></input>

                <div class="kt-content  kt-grid__item kt-grid__item--fluid">
                    <div class="row">
                        <div class="col-xl-12">
                            <!--begin::Portlet-->
                            <div class="kt-portlet">
                                <div class="kt-portlet__head">
                                    <div class="tixtop_s001">
                                        <span class="fa fa-check-circle" style="color: #777;"></span>
                                        조직정보 [팀]관리</div>
                                    <div style="width: 100px; float: right;">
                                        <span id="insert_team_btn" class="btn_addnew  he30 " data-toggle="modal" data-target="#teamInsertForm" >+ 등록</span>
                                    </div>
                                </div>
                                <div class="boxs">
                                    <div class="w10 fl">
                                        <span style="font-weight: 600;"> *총 <span class="point_co" >${modelMap.totalRecords}</span>팀</span>
                                    </div>
                                    <div class="fr he20 w90">
												<span onclick="searchSubmit()" class="btn_findnew fr">
												 검색
												</span>
                                        <input type="text" class="form-control w20 fr"  placeholder="검색할 단어를 입력해 주세요" name="keyword" value = "${map.keyword}">

                                        <div class="fr mgr4"  style="width:120px;">
                                            <select name="searchOption" class="form-control kt-selectpicker" title="팀 선택값">
                                                <option value="dept_nm" <c:out value="${modelMap.searchOption == 'dept_nm'?'selected':''}"/> >팀명</option>
                                                <option value="dept_cd" <c:out value="${modelMap.searchOption == 'dept_cd'?'selected':''}"/> >부서코드</option>
                                            </select>
                                        </div>
                                        <div class="fr mgr4 w120">
                                            <select name="searchStatus" class="form-control kt-selectpicker" title="팀상태">
                                                <option value="deptStatusY" <c:out value="${modelMap.searchStatus == 'deptStatusY'?'selected':''}"/> >사용중</option>
                                                <option value="deptStatusN" <c:out value="${modelMap.searchStatus == 'deptStatusN'?'selected':''}"/> >업무종료</option>
                                            </select>
                                        </div>

                                        <span class="btn_findnew fr mgr4">
												 초기화
												</span>
                                        <div class='input-group' id='kt_daterangepicker_2'  style="width:300px; float:right;">
                                            <input id="calendarValue" type='text' class="form-control" readonly placeholder="" />
                                            <div class="input-group-append">
                                                <span class="input-group-text"><i class="la la-calendar-check-o"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="kt-portlet__body">
                                    <!--begin::Section-->
                                    <div class="kt-section">
                                        <div class="kt-section__content">
                                            <table class="table table-new1 table-hover">
                                                <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th>고객사명</th>
                                                    <th>부서명</th>
                                                    <th>팀명</th>
<%--                                                    <th>상태코드</th>--%>
                                                    <th>정렬</th>
                                                    <th>사용유무</th>
                                                    <th>등록자</th>
                                                    <th>등록일시</th>
<%--                                                    <th>수정자</th>--%>
<%--                                                    <th>수정일시</th>--%>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="allList" items="${modelMap.allListTeam}" varStatus="status">
                                                    <tr style=" text-align: center;" class="tbst">
                                                        <td>${modelMap.listStartNo-status.index}</td>
                                                        <td>${allList.dept_nm_company}</td>
                                                        <td>${allList.dept_nm_head}</td>
                                                        <td><a data-toggle="modal" data-target="#update_team_modal"
                                                               onclick="updateTeam('${allList.dept_cd_company}', '${allList.dept_nm_company}','${allList.dept_cd_head}', '${allList.dept_nm_head}', '${allList.dept_cd}', '${allList.dept_nm_team}', '${allList.dept_status}', '${allList.sort_seq}','${allList.remark}')">
                                                                ${allList.dept_nm_team}</a>
                                                        </td>
<%--                                                        <td>${allList.dept_status}</td>--%>
                                                        <td>${allList.sort_seq}</td>
                                                        <td>${allList.use_yn}</td>
                                                        <td>${allList.insert_id}</td>
                                                        <td>${allList.insert_dt}</td>
<%--                                                        <td>${allList.update_id}</td>--%>
<%--                                                        <td>${allList.update_dt}</td>--%>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                            <div id="pwary">
                                                <div class="pwar">
                                                    <div id="pagingNew">
                                                        <%-- <a href="#" class="numPrev_a">
                                                             <span class="flaticon2-fast-back" style="font-size: 0.6rem;"></span>
                                                         </a>
                                                         <a href="#" class="numPrev">
                                                             <span class="flaticon2-back" style="font-size: 0.6rem;"></span>
                                                         </a>
                                                         <span class="sel">1</span>
                                                         <a href="#" class="numBox">2</a>
                                                         <a href="#" class="numBox">3</a>
                                                         <a href="#" class="numBox">4</a>
                                                         <a href="#" class="numBox">5</a>
                                                         <a href="#" class="numBox">6</a>
                                                         <a href="#" class="numBox">7</a>
                                                         <a href="#" class="numBox">8</a>
                                                         <a href="#" class="numBox">9</a>
                                                         <a href="#" class="numBox">10</a>
                                                         <a href="#" class="numNext">
                                                             <span class="flaticon2-next" style="font-size: 0.6rem;"></span></a>
                                                         <a href="#" class="numNext_2">
                                                             <span class="flaticon2-fast-next" style="font-size: 0.6rem;"></span>

                                                         </a>--%>
                                                        <div> ${modelMap.pageHtml}</div>
                                                        <!--컬럼 정렬  -->

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end::Section-->
                                </div>
                                <!--end::Form-->
                            </div>
                        </div>
                        <!--end::Section-->
                    </div>
                    <!--end::Form-->
                </div>
            </form>
            <!--begin::modal-->
            <jsp:include page="./teamInsertForm.jsp"></jsp:include>
            <jsp:include page="./teamEditFrom.jsp"></jsp:include>

            <!--end::modal-->
            </div>
        </div>
    </div>
</div>



<script>
    var KTAppOptions = {
        "colors": {
            "state": {
                "brand": "#5d78ff",
                "dark": "#282a3c",
                "light": "#ffffff",
                "primary": "#5867dd",
                "success": "#34bfa3",
                "info": "#36a3f7",
                "warning": "#ffb822",
                "danger": "#fd3995"
            },
            "base": {
                "label": ["#c5cbe3", "#a1a8c3", "#3d4465", "#3e4466"],
                "shape": ["#f0f3ff", "#d9dffa", "#afb4d4", "#646c9a"]
            }
        }
    };
</script>
<!--begin:: Global Mandatory Vendors -->
<script src="/assets/vendors/general/jquery/dist/jquery.js" type="text/javascript"></script>
<script src="/assets/vendors/general/popper.js/dist/umd/popper.js" type="text/javascript"></script>
<script src="/assets/vendors/general/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/assets/vendors/general/js-cookie/src/js.cookie.js" type="text/javascript"></script>
<script src="/assets/vendors/general/moment/min/moment.min.js" type="text/javascript"></script>
<script src="/assets/vendors/general/tooltip.js/dist/umd/tooltip.min.js" type="text/javascript"></script>
<script src="/assets/vendors/general/perfect-scrollbar/dist/perfect-scrollbar.js" type="text/javascript"></script>
<script src="/assets/vendors/general/sticky-js/dist/sticky.min.js" type="text/javascript"></script>
<script src="/assets/vendors/general/wnumb/wNumb.js" type="text/javascript"></script>

<!--begin:: Global Optional Vendors -->
<script src="/assets/vendors/general/jquery-form/dist/jquery.form.min.js" type="text/javascript"></script>
<script src="/assets/vendors/general/block-ui/jquery.blockUI.js" type="text/javascript"></script>
<script src="/assets/vendors/general/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
<script src="/assets/vendors/custom/components/vendors/bootstrap-datepicker/init.js" type="text/javascript"></script>
<script src="/assets/vendors/general/bootstrap-datetime-picker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script src="/assets/vendors/general/bootstrap-timepicker/js/bootstrap-timepicker.min.js" type="text/javascript"></script>
<script src="/assets/vendors/custom/components/vendors/bootstrap-timepicker/init.js" type="text/javascript"></script>
<script src="/assets/vendors/general/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript"></script>
<script src="/assets/vendors/general/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.js" type="text/javascript"></script>
<script src="/assets/vendors/general/bootstrap-maxlength/src/bootstrap-maxlength.js" type="text/javascript"></script>
<script src="/assets/vendors/custom/vendors/bootstrap-multiselectsplitter/bootstrap-multiselectsplitter.min.js" type="text/javascript"></script>
<script src="/assets/vendors/general/bootstrap-select/dist/js/bootstrap-select.js" type="text/javascript"></script>
<script src="/assets/vendors/general/bootstrap-switch/dist/js/bootstrap-switch.js" type="text/javascript"></script>
<script src="/assets/vendors/custom/components/vendors/bootstrap-switch/init.js" type="text/javascript"></script>
<script src="/assets/vendors/general/select2/dist/js/select2.full.js" type="text/javascript"></script>
<script src="/assets/vendors/general/ion-rangeslider/js/ion.rangeSlider.js" type="text/javascript"></script>
<script src="/assets/vendors/general/typeahead.js/dist/typeahead.bundle.js" type="text/javascript"></script>
<script src="/assets/vendors/general/handlebars/dist/handlebars.js" type="text/javascript"></script>
<script src="/assets/vendors/general/inputmask/dist/jquery.inputmask.bundle.js" type="text/javascript"></script>
<script src="/assets/vendors/general/inputmask/dist/inputmask/inputmask.date.extensions.js" type="text/javascript"></script>
<script src="/assets/vendors/general/inputmask/dist/inputmask/inputmask.numeric.extensions.js" type="text/javascript"></script>
<script src="/assets/vendors/general/nouislider/distribute/nouislider.js" type="text/javascript"></script>
<script src="/assets/vendors/general/owl.carousel/dist/owl.carousel.js" type="text/javascript"></script>
<script src="/assets/vendors/general/autosize/dist/autosize.js" type="text/javascript"></script>
<script src="/assets/vendors/general/clipboard/dist/clipboard.min.js" type="text/javascript"></script>
<script src="/assets/vendors/general/dropzone/dist/dropzone.js" type="text/javascript"></script>
<script src="/assets/vendors/general/summernote/dist/summernote.js" type="text/javascript"></script>
<script src="/assets/vendors/general/markdown/lib/markdown.js" type="text/javascript"></script>
<script src="/assets/vendors/general/bootstrap-markdown/js/bootstrap-markdown.js" type="text/javascript"></script>
<script src="/assets/vendors/custom/components/vendors/bootstrap-markdown/init.js" type="text/javascript"></script>
<script src="/assets/vendors/general/bootstrap-notify/bootstrap-notify.min.js" type="text/javascript"></script>
<script src="/assets/vendors/custom/components/vendors/bootstrap-notify/init.js" type="text/javascript"></script>
<script src="/assets/vendors/general/jquery-validation/dist/jquery.validate.js" type="text/javascript"></script>
<script src="/assets/vendors/general/jquery-validation/dist/additional-methods.js" type="text/javascript"></script>
<script src="/assets/vendors/custom/components/vendors/jquery-validation/init.js" type="text/javascript"></script>
<script src="/assets/vendors/general/toastr/build/toastr.min.js" type="text/javascript"></script>
<script src="/assets/vendors/general/raphael/raphael.js" type="text/javascript"></script>
<script src="/assets/vendors/general/morris.js/morris.js" type="text/javascript"></script>
<script src="/assets/vendors/general/chart.js/dist/Chart.bundle.js" type="text/javascript"></script>
<script src="/assets/vendors/custom/vendors/bootstrap-session-timeout/dist/bootstrap-session-timeout.min.js" type="text/javascript"></script>
<script src="/assets/vendors/custom/vendors/jquery-idletimer/idle-timer.min.js" type="text/javascript"></script>
<script src="/assets/vendors/general/waypoints/lib/jquery.waypoints.js" type="text/javascript"></script>
<script src="/assets/vendors/general/counterup/jquery.counterup.js" type="text/javascript"></script>
<script src="/assets/vendors/general/es6-promise-polyfill/promise.min.js" type="text/javascript"></script>
<script src="/assets/vendors/general/sweetalert2/dist/sweetalert2.min.js" type="text/javascript"></script>
<script src="/assets/vendors/custom/components/vendors/sweetalert2/init.js" type="text/javascript"></script>
<script src="/assets/vendors/general/jquery.repeater/src/lib.js" type="text/javascript"></script>
<script src="/assets/vendors/general/jquery.repeater/src/jquery.input.js" type="text/javascript"></script>
<script src="/assets/vendors/general/jquery.repeater/src/repeater.js" type="text/javascript"></script>
<script src="/assets/vendors/general/dompurify/dist/purify.js" type="text/javascript"></script>

<!--end:: Global Optional Vendors -->

<!--begin::Global Theme Bundle(used by all pages) -->
<script src="/assets/demo/default/base/scripts.bundle.js" type="text/javascript"></script>

<!--end::Global Theme Bundle -->

<!--begin::Page Scripts(used by this page) -->
<script src="/assets/app/custom/login/login-general.js" type="text/javascript"></script>
<script src="/assets/app/custom/general/crud/forms/widgets/bootstrap-select.js" type="text/javascript"></script>
<script src="/assets/app/custom/general/crud/forms/widgets/bootstrap-datepicker.js" type="text/javascript"></script>
<script src="/assets/app/custom/general/crud/metronic-datatable/base/data-local.js" type="text/javascript"></script>
<script src="/assets/app/custom/general/crud/forms/widgets/bootstrap-daterangepicker.js" type="text/javascript"></script>

<!--end::Page Scripts -->

<!--begin::Global App Bundle(used by all pages) -->
<script src="/assets/app/bundle/app.bundle.js" type="text/javascript"></script>

<script>
    function popAgentApp() {
        let url = "/agent/agentApp";
        let w = "1450";
        let h = "285";
        let name = "agentApp";
        let option = "scroll";

        var pozX, pozY;
        var sw = screen.availWidth;
        var sh = screen.availHeight;
        var scroll = 0;
        if (option == 'scroll') {
            scroll = 1;
        }
        pozX = (sw - w) / 2;
        pozY = (sh - h) / 2;
        window.open(url, name, "location=0,status=0,scrollbars=" + scroll + ",resizable=1,width=" + w + ",height=" + h +
            ",left=" + pozX + ",top=" + pozY);
    }
</script>

<script type = text/javascript>
    //현제페이지 이동
    function movePage(getPage){

        // $("#currentPage").attr("value", getPage);
        $("#currentPage").val(getPage);

        document.searchForm.submit();
    }



    // 팀 게시판 등록 버튼 클릭시 설정
    $("#insert_team_btn").click(function(){

        // selectbox의 id 값으로 속성 값을 집어넣는다. 주의) option:eq(0) 은 0번째 인덱스 값으로 selected default 하라는 것이다. value 값이 아니다
        $("#dept_nm_company option:eq(0)").prop("selected", true);
        $("#dept_select option:eq(0)").prop("selected", true);
        $("#dept_status option:eq(0)").prop("selected", true);
        $("#dept_nm_company").selectpicker('refresh');
        $("#dept_select").selectpicker('refresh');
        $("#dept_status").selectpicker('refresh');

        $("#dept_nm").val("");          // input 부서명 값 초기화
        $("#sort_seq").val("");         // input 정렬 값 초기화


        $("#dept_nm_company_error, #dept_nm_error, #dept_status_error, #sort_seq_error, #dept_nm_dupl_error, #dept_nm_available, #dept_select_error, #dept_nm_check_error ").hide();        // Error 문구 숨기기

    });

    // 검색 기능 구현
    function searchSubmit(){

        let calendarValue = $("#calendarValue").val();

        let start_dt = calendarValue.substr(0,10);
        let end_dt = calendarValue.substr(13,22);

        $("#start_dt").val(start_dt);
        $("#end_dt").val(end_dt);

        document.searchForm.submit();
    }

</script>

</body>
</html>