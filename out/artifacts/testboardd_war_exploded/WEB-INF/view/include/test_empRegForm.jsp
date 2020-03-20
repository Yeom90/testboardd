<%--
  Created by IntelliJ IDEA.
  User: kbsjob
  Date: 2020-03-18
  Time: 오후 4:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-xl-12">
    <div class="kt-portlet">
        <div class="modal fade" id="empRegModal" onsubmit="return checkForm()" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle"><span
                                class="fa fa-pencil-alt mgr8 co77"></span>사원정보 등록</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        </button>
                    </div>
                    <div class="modal-body">
                        <div style="width: 100%;">
                            <form id="empRegForm" class="form-horizontal martop8" method="post">
                                <fieldset>
                                    <!-- 사원아이디 중복검색 시작 -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label margin-top7">사원아이디<span
                                                class="po">* </span> </label>
                                        <div class="col-md-6  inputGroupContainer" style="width: 100%;">
                                            <div class="input-group">
                                                <input id="empId" name="empId" type="text" class="form-control_1"
                                                       placeholder="아이디를 입력해주세요">
                                                <div class="input-group-append">
                                                    <button id="checkIdBtn" class="btn btn-primary_777" type="button">중복검색
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <span id="empIdChecked" style="color: red; text-align: right">""</span>
                                    </div>
                                    <!-- 사원아이디 중복검색 끝 -->
                                    <!-- 사원명 시작 -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label margin-top7 ">사원명<span
                                                class="po">* </span> </label>
                                        <div class="col-md-6  inputGroupContainer">
                                            <div class="input-group">
                                                <input id="empName" name="empName" type="text" class="form-control_22" placeholder=" ">
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <span id="empNameChecked" style="color: red; text-align: right">""</span>
                                    </div>
                                    <!-- 사원명  끝 -->
                                    <!-- 부서코드 셀렉트 박스 시작  -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label margin-top7">부서코드<span
                                                class="po">* </span></label>
                                        <div class="col-md-6  inputGroupContainer">
                                            <div class="input-group_1">
                                                <div class="fl w115 mgr4">
                                                    <select id="companyName" name="companyName" class="form-control kt-selectpicker">
                                                        <option>본부명선택</option>
                                                        <option>LG</option>
                                                        <option>루키스</option>
                                                        <option>삼성</option>
                                                        <option>유비콤</option>
                                                        <option>한국고용정보</option>
                                                        <option>현대자동차</option>
                                                    </select>
                                                </div>
                                                <div class="fl w115">
                                                    <select id="teamName" name="teamName" class="form-control kt-selectpicker">
                                                        <option>팀명선택</option>
                                                        <option>A팀</option>
                                                        <option>B팀</option>
                                                        <option>미정</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <span id="companyNameChecked" style="color: red; text-align: right">""</span>
                                        <span id="teamNameChecked" style="color: red; text-align: right">""</span>
                                    </div>
                                    <!-- 부서코드 셀렉트 박스 끝 -->
                                    <!-- 내선번호 중복검색 시작 -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label margin-top7 ">내선번호<span
                                                class="po">* </span> </label>
                                        <div class="col-md-6  inputGroupContainer" style="width: 100%;">
                                            <div class="input-group">
                                                <input id="interphone" type="text" name="interphone" class="form-control_1"
                                                       placeholder="숫자 4자리만 입력해주세요">
                                                <div class="input-group-append">
                                                    <button id="checkInterphoneBtn" class="btn btn-primary_777" type="button">중복검색
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <span id="interphoneChecked" style="color: red; text-align: right">""</span>
                                    </div>
                                    <!-- 내선번호 중복검색 끝 -->
                                    <!-- 재직여부 시작 -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label margin-top7">재직여부<span
                                                class="po">* </span></label>
                                        <div class="col-md-6 inputGroupContainer">
                                            <div class="input-group">
                                                <select id="isWorking" name="isWorking" class="form-control kt-selectpicker">
                                                    <option>선택</option>
                                                    <option>재직</option>
                                                    <option>퇴사</option>
                                                    <option>휴직</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <span id="isWorkingChecked" style="color: red; text-align: right">""</span>
                                    </div>
                                    <!-- 재직여부 끝 -->
                                    <!-- 업무 시작 -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label margin-top7">업무<span
                                                class="po">* </span></label>
                                        <div class="col-md-6 inputGroupContainer">
                                            <div class="input-group">
                                                <select id="task" name="task" class="form-control kt-selectpicker">
                                                    <option>선택</option>
                                                    <option>상담</option>
                                                    <option>관리</option>
                                                    <option>기사</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <span id="taskChecked" style="color: red; text-align: right">""</span>
                                    </div>
                                    <!-- 업무 끝 -->
                                    <!-- 권한 시작 -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label margin-top7">권한<span
                                                class="po">* </span></label>
                                        <div class="col-md-6 inputGroupContainer">
                                            <div class="input-group">
                                                <select id="athority" name="athority" class="form-control kt-selectpicker">
                                                    <option>선택</option>
                                                    <option>AM</option>
                                                    <option>MANAGER</option>
                                                    <option>INSTRUCTOR</option>
                                                    <option>ASSIST</option>
                                                    <option>SUPERVISOR</option>
                                                    <option>AGENT</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <span id="athorityChecked" style="color: red; text-align: right">""</span>
                                    </div>
                                    <!-- 권한 끝 -->
                                    <!-- 입사일자 시작 -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label margin-top7">입사일자<span
                                                class="po">* </span></label>
                                        <div class="col-md-6 inputGroupContainer">
                                            <div class='input-group ' id='kt_daterangepicker_2'
                                                 style="height: 30px;">
                                                <input id="inDate" name="inDate" type='text' class="form-control he30new"
                                                       placeholder="" style="height: 30px !important;">
                                                <div class="input-group-append">
                                                    <span class="input-group-text">
                                                        <i class="la la-calendar-check-o"></i>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <span id="inDateChecked" style="color: red; text-align: right">""</span>
                                    </div>
                                    <!-- 입사일자 끝 -->
                                    <!-- 퇴사일자 시작 -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label margin-top7">퇴사일자</label>
                                        <div class="col-md-6 inputGroupContainer">
                                            <div class='input-group ' id='kt_daterangepicker_1'
                                                 style="height: 30px;">
                                                <input id="outDate" name="outDate" type='text' class="form-control he30new"
                                                       placeholder="" style="height: 30px !important;">
                                                <div class="input-group-append">
                                                    <span class="input-group-text">
                                                        <i class="la la-calendar-check-o"></i>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <span id="outDateChecked" style="color: red; text-align: right">""</span>
                                    </div>
                                    <!-- 퇴사일자 끝 -->
                                    <!-- 비고 시작 -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label margin-top7">비고 </label>
                                        <div class="col-md-6  inputGroupContainer">
                                            <div class="input-group">
                                                <textarea class="form-control " id="extraInfo" name="extraInfo" rows="12" style="height: 45px ! important "></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <span class=" fs11" style="float: left; width:72%;">*항목은 <span class="po">필수항목</span>입니다.</span>
                        <br>
                        <br>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" style="height: 30px;">닫기</button>
                        <button id="modalSubmit" type="button" class="btn btn-primary" style="height: 30px;">저장</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
