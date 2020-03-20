<!DOCTYPE html>
<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- head -->
<%@include file="/WEB-INF/view/include/test_head.jsp" %>

<body class="kt-header--fixed kt-header-mobile--fixed kt-subheader--fixed kt-subheader--enabled kt-subheader--solid kt-aside--enabled kt-aside--fixed kt-page--loading">
<!-- begin:: Page -->
<div class="kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor kt-wrapper" id="kt_wrapper">

    <!-- hader 시작  -->
    <div id="kt_header" class="kt-header kt-grid__item  kt-header--fixed">

        <!--  로고 접기 기능 시작 -->
        <div class="kt-aside__brand kt-grid__item " id="kt_aside_brand">
            <div class="kt-aside__brand-logo">
                <a href="index.html">
                    <img alt="Logo" src="../resources/images/logo-light.png"/>
                </a>
            </div>
            <div class="kt-aside__brand-tools">
                <button class="kt-aside__brand-aside-toggler" id="kt_aside_toggler">
								<span><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                           width="24px" height="24px" viewBox="0 0 24 24" version="1.1"
                                           class="kt-svg-icon">
										<g stroke="none" stroke-width="1" fill="#3f2676" fill-rule="evenodd">
											<polygon id="Shape" points="0 0 24 0 24 24 0 24"/>
											<path d="M5.29288961,6.70710318 C4.90236532,6.31657888 4.90236532,5.68341391 5.29288961,5.29288961 C5.68341391,4.90236532 6.31657888,4.90236532 6.70710318,5.29288961 L12.7071032,11.2928896 C13.0856821,11.6714686 13.0989277,12.281055 12.7371505,12.675721 L7.23715054,18.675721 C6.86395813,19.08284 6.23139076,19.1103429 5.82427177,18.7371505 C5.41715278,18.3639581 5.38964985,17.7313908 5.76284226,17.3242718 L10.6158586,12.0300721 L5.29288961,6.70710318 Z"
                                                  id="Path-94" fill="#000000" fill-rule="nonzero"
                                                  transform="translate(8.999997, 11.999999) scale(-1, 1) translate(-8.999997, -11.999999) "/>
											<path d="M10.7071009,15.7071068 C10.3165766,16.0976311 9.68341162,16.0976311 9.29288733,15.7071068 C8.90236304,15.3165825 8.90236304,14.6834175 9.29288733,14.2928932 L15.2928873,8.29289322 C15.6714663,7.91431428 16.2810527,7.90106866 16.6757187,8.26284586 L22.6757187,13.7628459 C23.0828377,14.1360383 23.1103407,14.7686056 22.7371482,15.1757246 C22.3639558,15.5828436 21.7313885,15.6103465 21.3242695,15.2371541 L16.0300699,10.3841378 L10.7071009,15.7071068 Z"
                                                  id="Path-95" fill="#000000" fill-rule="nonzero" opacity="0.3"
                                                  transform="translate(15.999997, 11.999999) scale(-1, 1) rotate(-270.000000) translate(-15.999997, -11.999999) "/>
										</g>
									</svg></span>
                    <span><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                               width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="kt-svg-icon">
										<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
											<polygon id="Shape1" points="0 0 24 0 24 24 0 24"/>
											<path d="M12.2928955,6.70710318 C11.9023712,6.31657888 11.9023712,5.68341391 12.2928955,5.29288961 C12.6834198,4.90236532 13.3165848,4.90236532 13.7071091,5.29288961 L19.7071091,11.2928896 C20.085688,11.6714686 20.0989336,12.281055 19.7371564,12.675721 L14.2371564,18.675721 C13.863964,19.08284 13.2313966,19.1103429 12.8242777,18.7371505 C12.4171587,18.3639581 12.3896557,17.7313908 12.7628481,17.3242718 L17.6158645,12.0300721 L12.2928955,6.70710318 Z"
                                                  id="Path-96" fill="#000000" fill-rule="nonzero"/>
											<path d="M3.70710678,15.7071068 C3.31658249,16.0976311 2.68341751,16.0976311 2.29289322,15.7071068 C1.90236893,15.3165825 1.90236893,14.6834175 2.29289322,14.2928932 L8.29289322,8.29289322 C8.67147216,7.91431428 9.28105859,7.90106866 9.67572463,8.26284586 L15.6757246,13.7628459 C16.0828436,14.1360383 16.1103465,14.7686056 15.7371541,15.1757246 C15.3639617,15.5828436 14.7313944,15.6103465 14.3242754,15.2371541 L9.03007575,10.3841378 L3.70710678,15.7071068 Z"
                                                  id="Path-97" fill="#000000" fill-rule="nonzero" opacity="0.3"
                                                  transform="translate(9.000003, 11.999999) rotate(-270.000000) translate(-9.000003, -11.999999) "/>
										</g>
									</svg></span>
                </button>
            </div>
        </div>    <!--로고 접기 기능 끝 -->

        <div class="kt-header__topbar" style="float: right;">
            <div style="margin:10px 0px 0px 10px;"> 메세지: <span class="kt-badge kt-badge--brand">3</span></div>
            <div style="margin:10px 10px 0px 10px;"> 이메일: <span class="kt-badge kt-badge--warning"> 38</span></div>
            <div style="margin:10px;"><span style="font-weight:bold;">염승훈님</span>환영합니다.</div>
            <span class="kt-badge kt-badge--username kt-badge--unified-success kt-badge--lg kt-badge--rounded kt-badge--bold"
                  style="margin-top:9px; width: 100px; height: 25px; font-size: 13px;"> 로그아웃
					<span class="la la-sign-out"
                          style="color:#666; font-size: 1.5rem !important; margin-left: 4px;"></span>
					</span>
        </div>

    </div>
    <!-- hader 끝  -->

    <!-- menu 시작 -->
    <div class="kt-aside  kt-aside--fixed  kt-grid__item kt-grid kt-grid--desktop kt-grid--hor-desktop" id="kt_aside"
         style="margin-top: 59px;">

    <!-- Aside 시작 -->
        <%@include file="../include/test_aside.jsp"%>
    <!-- Aside 끝 -->

    <!--  Content   시작 -->
    <div class="kt-content  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-xl-12">
                <div class="kt-portlet">
                    <!-- 사원정보 관리 타이틀 시작  title start -->
                    <div class="kt-portlet__head">
                        <div class="tixtop_s001">
                            <span class="fa fa-check-circle co77"></span>
                            사원정보 관리
                        </div>
                        <div style="width: 100px; float: right;">
                            <span id="registerBtn" class="btn_addnew  he30 " data-toggle="modal" data-target="#kt_modal_6">+ 등록</span>
                        </div>
                    </div>
                    <!-- 사원정보 타이틀 끝    title end -->

                    <!-- 검색박스 시작  search start -->
                    <div class="boxs">
                        <div class="w10 fl">
                            <span style="font-weight: 600;"> *총 <span class="point_co">${listAllCnt}</span>건</span>
                        </div>
                        <div class="fr he20 w90">
			                <span class="btn_findnew fr">
			                    검색
			                </span>
                            <input type="text" class="form-control_22 w12 fr" placeholder="">

                            <div class="fr w115 mgr4">
                                <select class="form-control kt-selectpicker">
                                    <option>전체</option>
                                    <option>사원명</option>
                                    <option>사원아이디</option>
                                    <option>내선번호</option>
                                    <option>부서</option>
                                    <option>권한</option>
                                </select>
                            </div>
                            <div class="fr w115 mgr4">
                                <select class="form-control kt-selectpicker">
                                    <option>재직상태</option>
                                    <option>재직</option>
                                    <option>퇴직</option>
                                    <option>휴직</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <!-- 검색박스 끝  search end -->

                    <div class="kt-portlet__body">
                        <div class="kt-section">
                            <div class="kt-section__content">
                                <!--  테이블 시작 -->
                                <table class="table table-new1 table-hover">
                                    <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>사원아이디</th>
                                        <th>사원명</th>
                                        <th>내선번호</th>
                                        <th>팀명</th>
                                        <th>권한</th>
                                        <th>재직상태</th>
                                        <th>입사일자</th>
                                        <th>퇴사일자</th>
                                        <th>비밀번호 오류</th>
                                        <th>비밀번호 초기화</th>
                                        <th>등록자</th>
                                        <th>등록일시</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${board}" var="board">
                                        <tr>
                                            <td>${board.bno}</td>
                                            <th><a href='#' onclick="openEmpModifyModal(${board.bno})">${board.empId}</a></th>
                                            <th>${board.empName}</th>
                                            <th>${board.interphone}</th>
                                            <th>${board.companyName}</th>
                                            <th>${board.athority}</th>
                                            <th>${board.isWorking}</th>
                                            <th>${board.inDate}</th>
                                            <th>${board.outDate}</th>
                                            <th>${board.pwdErCnt}</th>
                                            <th><img src="/resources/images/icon_r.png"></th>
                                            <th>${board.register}</th>
                                            <th>${board.regDate}</th>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <!-- 테이블 끝 -->

                                <!-- 페이징 시작-->
                                <div class="kt-datatable__pager kt-datatable--paging-loaded">
                                    <ul class="kt-datatable__pager-nav" style="text-align:center;">

                                        <!-- jstl 코어 태그 -->
                                        <!-- c:if test="조건 판별식"
                                            var="변수명"
                                            scope="변수 공유 범위"-->
                                        <c:if test="${PageMaker.prev}">
                                            <li>
                                                <a title="Previous" id="prevBtn"
                                                   class="kt-datatable__pager-link kt-datatable__pager-link--prev kt-datatable__pager-link--prev"
                                                   data-page="${PageMaker.curPage-1}" href="${PageMaker.curPage-1});">
                                                    <i class="flaticon2-back"></i>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:forEach begin="${PageMaker.startPage}"
                                                   end="${PageMaker.endPage}" var="page">
                                            <li>
                                                <a class="kt-datatable__pager-link kt-datatable__pager-link-number"
                                                   id="page${page}"
                                                   data-page="${page}" title="${page}"
                                                   href="(${page});">${page}</a> <%-- addclass, hasclass, removeclass,
                                                                   kt-datatable__pager-link--active--%>
                                            </li>
                                        </c:forEach>
                                        <c:if test="${PageMaker.next}">
                                            <li>
                                                <a title="Next" id="nextBtn"
                                                   class="kt-datatable__pager-link kt-datatable__pager-link--next"
                                                   data-page="${PageMaker.curPage+1}" href="(${PageMaker.curPage+1});">
                                                    <i class="flaticon2-next"></i>
                                                </a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </div>
                                <!-- 페이징 끝 -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 사원 등록 모달 팝업 시작 -->
            <%@include file="../include/test_empRegForm.jsp"%>
            <!-- 사원 등록 모달 팝업 끝 -->

            <!-- 사원 정보 모달 팝업 시작 -->
            <%@include file="../include/test_empModForm.jsp"%>
            <!-- 사원 정보 모달 팝업 끝 -->
        </div>
    </div>
    <!--  Content  끝 -->
</div>
<!-- page 끝 -->

<!-- test_plugin_js.jsp -->
<%@include file="/WEB-INF/view/include/test_plugin_js.jsp" %>

<!-- page script -->
<script>
    //Modal 관련 이벤트 처리
    //사원 정보 저장 Modal 처리
    $(function () {
        $("#registerBtn").click(function () {
            $("#empRegModal").modal();
        });

        //Modal창에서 Submit 이벤트 처리 (저장)
        $("#modalSubmit").click(function () {
            let reg_data = $("#empRegForm").serialize();
            console.log("reg_data : "+reg_data);

            //summit 클릭시 이벤트 처리 (사원 저장 버튼)
            $.ajax({
                url: '/write',
                type: 'POST',
                //contentType : "application/x-www-form-urlencoded; charset=UTF-8",
                data: reg_data,
                //dataType : "json",
                success: function (result) {
                    alert("사원 등록 성공");
                    $("#empRegModal").modal('toggle'); // .modal('toggle') : modal이 켜져있을때 호출하면 꺼지고, 꺼졌을때 호출하면 켜짐(==스위치)
                },
                error: function (xhr, status) {
                    console.log("error xhr: "+xhr, "error status: "+status);
                },
                complete: function () {
                    location.reload();
                }
            });
        });
    });

    //사원 정보 읽기 Modal 처리
    function openEmpModifyModal(boardNo) {
        console.log(boardNo);
        $.ajax({
            url: '/read',
            type: 'GET',
            //contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            data: {boardNo : boardNo},
            success: function (result) {
                $("#empModifyModal").modal();
                setInfoToModal(result);
            },
            error: function (xhr, status) {
                console.log("error xhr: "+xhr, "error status: "+status);
            }
        });
    };

    //사원정보 폼에 넣는 함수
    function setInfoToModal(empInfo) {
        $('#empModId').val(empInfo.empId);
        $('#empModName').val(empInfo.empName);
        $('#companyModName').val(empInfo.companyName);
        $('#teamModName').val(empInfo.teamName);
        $('#interphoneMod').val(empInfo.interphone);
        $('#isModWorking').val(empInfo.isWorking);
        $('#taskMod').val(empInfo.task);
        $('#athorityMod').val(empInfo.athority);
        $('#inModDate').val(empInfo.inDate);
        $('#outModDate').val(empInfo.outDate);
        $('#extraModInfo').val(empInfo.extraInfo);
        $('input[name=bno]').val(empInfo.bno); // name 값으로 element 선택
    }

    //사원 정보 수정 요청 처리
    $('#modalModSubmit').click(function () {
        let mod_data = $('#empModifyForm').serialize();
        console.log("mod_data : "+mod_data);
        $.ajax({
            url: '/modify',
            type: 'POST',
            data: mod_data,
            success: function (result) {
                alert("사원 정보 수정 성공");
                $("#empModifyModal").modal('toggle'); // .modal('toggle') : modal이 켜져있을때 호출하면 꺼지고, 꺼졌을때 호출하면 켜짐(==스위치)
            },
            error: function (xhr, status) {
                console.log("error xhr: " + xhr, "error status: " + status);
            },
            complete: function () {
                location.reload();
            }
        });
    })

    //사원 정보 삭제 요청 처리
    $('#modalDeleteSubmit').click(function () {
        let boardNo = $('input[name=bno]').val();
        console.log("Delete bno: "+boardNo);
        $.ajax({
            url: '/delete',
            type: 'POST',
            data: {boardNo : boardNo},
            success: function () {
                alert("사원 정보 삭제 성공");
                $("#empModifyModal").modal('toggle');
            },
            error: function (xhr, status) {
                console.log("error xhr: "+xhr, "error status: "+status);
            },
            complete: function () {
                location.reload();
            }
        });
    })

</script>
</body>
</html>
