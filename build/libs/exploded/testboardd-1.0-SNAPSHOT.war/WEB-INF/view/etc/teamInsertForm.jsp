<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--begin insert modal--%>
<div class="col-xl-12">
    <!--begin::Portlet-->
    <div class="kt-portlet">
        <div class="modal fade" tabindex="-1" role="dialog"  aria-hidden="true" id="teamInsertForm">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">조직정보(팀 등록)</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        </button>
                    </div>
                    <div class="modal-body">
                        <form name="teamInsertForm" method="post">

                            <div class="mdb">
                                <div class="w30 fl">고객사명</div>
                                <div class="w70 fl">
                                    <select class="form-control selectpicker" name="dept_nm_company" onchange="companyChange()" id="dept_nm_company">
                                        <option value="0">선택</option>
                                        <c:forEach var="companyList" items ="${modelMap.selectCompanyNm}" varStatus="status">
                                            <option value="${companyList.dept_cd}">
                                                    ${companyList.dept_nm_company}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div  class="po fs11 fr"  style="width: 69%; padding:1px; display: none;" id="dept_nm_company_error"> *고객사를 선택 해주세요.</div>

                            <div class="mdb">
                                <div class="w30 fl">부서명</div>
                                <div class="w70 fl">
                                    <select class="form-control kt-selectpicker" id="dept_select">
                                        <option value="0">선택</option>
                                    </select>
                                </div>
                            </div>
                            <div  class="po fs11 fr"  style="width: 69%; padding:1px; display: none;" id="dept_select_error"> *부서를 선택 해주세요.</div>

                            <div class="mdb">
                                <div class="w30 fl"> 팀명 <span class="po">* </span> </div>
                                <div class="w70 fl">
                                    <input type="text" name="dept_nm" class="form-control control2 m-input w100 fl he30" placeholder="팀명을을 입력해주세요" id="dept_nm">
                                    <input type="hidden" name="dept_cd_company" id="dept_cd_company"/>
                                    <input type="hidden" name="dept_cd_head" id="dept_cd_head"/>
                                    <input type="hidden" name="ref_dept_cd" id="ref_dept_cd"/>
                                    <input type="hidden" name="depth" value="2" id="depth"/>
                                    <input type="hidden" name="use_yn" id="use_yn"/>
                                </div>
                            </div>
                            <div  class="po fs11 fr"  style="width: 69%; padding:1px; display: none;" id="dept_nm_error"> *팀명을 입력 해주세요.</div>
                            <div  class="po fs11 fr"  style="width: 69%; padding:1px; display: none;" id="dept_nm_dupl_error"> *팀명이 중복되었습니다.</div>
                            <div  class="po fs11 fr"  style="width: 69%; padding:1px; display: none; color: blue" id="dept_nm_available"> *사용 가능한 팀명 입니다..</div>
                            <div  class="po fs11 fr"  style="width: 69%; padding:1px; display: none;" id="dept_nm_check_error"> *중복검색 시도해 주시기 바랍니다.</div>

                            <div class="mdb">
                                <div class="w30 fl">팀상태<span class="po">* </span>  </div>
                                <div class="w70 fl">
                                    <select name="dept_status" class="form-control selectpicker" id="dept_status">
                                        <option value="DS001" id="in_yes_dept_status">사용중</option>
                                        <option value="DS002" id="in_no_dept_status">업무중지</option>
                                    </select>
                                </div>
                            </div>


                            <div class="mdb">
                                <div class="w30 fl"> 정렬순서<span class="po">* </span> </div>
                                <div class="w70 fl">
                                    <input type="text" name="sort_seq" class="form-control control2 m-input w100 fl he30" placeholder="" id="sort_seq" >
                                </div>
                            </div>
                            <div  class="po fs11 fr"  style="width: 69%; padding:1px; display: block;" id="sort_seq_error"> 정렬값을 입력해주세요.</div>

                            <div class="mdb">
                                <div class="w30 fl"> 비고 </div>
                                <div class="form-group form-group-last w70 fl">
                                    <textarea name="remark" class="form-control " id="exampleTextarea" rows="12"  style="height: 45px ! important "></textarea>
                                </div>
                            </div>
                            <input type="hidden" name="insert_id" value=${sessionScope.login.getId()}></input>
                            <input type="hidden" name="update_id" value=${sessionScope.login.getId()}></input>
                        </form>
                    </div>


                    <div class="modal-footer">
                        <span class="po fs11"  style="float: left; width: 70%;">*항목은 필수항목입니다. </span><br><br>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="teamCloseBtn">닫기</button>
                        <button type="button" name="insertBtn" class="btn btn-primary" id="teamInsertBtn">저장</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<%--end insertmodal--%>


<script src="/resources/assets/vendors/general/jquery/dist/jquery.js" type="text/javascript"></script>
<script>

    // 팀명 중복 체크
    function team_nm_duplCheck(){

        let duplCheckCount = 0;

        let dept_nm = $("#dept_nm").val().replace(/ /g, "");
        $("#dept_nm").val(dept_nm);

        if($("#dept_nm").val() == ""){
            $("#dept_nm_error").show();
            return false;
        }else{
            $.ajax({
                url : "/group/teamNmCheck",
                contentType : "application/x-www-form-urlencoded; charset=UTF-8",
                type : "POST",
                data : {"dept_nm": dept_nm },
                dataType : "text",
                async : false,
                success : function(data){
                    if(data == "Y"){
                        $("#dept_nm_dupl_error").show();
                        $("#dept_nm_available").hide();
                        $("#dept_nm_check_error").hide();
                    }else{
                        $("#dept_nm_dupl_error").hide();
                        $("#dept_nm_available").show();
                        $("#dept_nm_check_error").hide();
                        duplCheckCount++;
                        $("#dupl_check_count").val(duplCheckCount);
                    }
                },
                error : function(request, status, error){
                }
            });
        }



    }


    // 팀 등록 모달 [저장] 버튼 클릭시 유효성 처리
    $("#teamInsertBtn").click(function(){

        let deptSelectVal = $("#dept_select").val();            // 부서명 select 값
        let duplCheckCount = $("#dupl_check_count").val();      // 중복체크 Count 확인
        let sortSeqVal = $("#sort_seq").val();                  // 정렬값
        let dept_nm = $("#dept_nm").val().replace(/ /g, "");    // 팀명 공백제거

        $("#dept_nm").val(dept_nm);


        if(duplCheckCount == ""){                                // 중복 체크 여부 확인
            $("#dept_nm_check_error").show();
            return false;
        }


        if($("#dept_nm_company").val() === "0"){              // 고객사 선택 미입력 오류 구현
            $("#dept_nm_company_error").show();
            if($("#dept_nm").val() === "") {              // 팀명 미입력시 오류 구현
                $("#dept_nm_error").show();
                if ($("#sort_seq").val() === "") {        // 정령값 미입력시 오류 구현
                    $("#sort_seq_error").show();
                    return false;
                }
                return false;
            }
            return false;
        }else if ($("#dept_nm").val() === "") {
            $("#dept_nm_error").show();
            if ($("#sort_seq").val() === "") {
                $("#sort_seq_error").show();
                return false;
            }
            return false;
        }else if ($("#sort_seq").val() === "") {
            $("#sort_seq_error").show();
            return false;
        }else if($("#sort_seq").val() === "") {
            $("#sort_seq_error").show();
            return false;
        }



        if($("#dept_status").val() == "DS001"){     // 사용유무 값 설정 (dept_status code를 바탕)
            $("#use_yn").val("Y");
        }else{
            $("#use_yn").val("N");
        }

        document.teamInsertForm.action = "/group/teamInsert";
        document.teamInsertForm.submit();

    });

    // 고객 SelectBox 선택시 Code 입력 구현
    $("#dept_nm_company").change(function(){

        let dept_cd_company = $(this).val();
        $("#dept_cd_company").val(dept_cd_company);

    });


    // deptInsertForm 부서상태 코드(사용중,업무중지) 선택시  value 값 변경 및 error 문구 hide처리
    $("#dept_status").change(function(){

        if(($(this).val()) === "DS001"){
            $("#use_yn").val("Y");
            $("#dept_status_error").hide();
        }else{
            $("#use_yn").val("N");
            $("#dept_status_error").hide();
        }

    });

    // 팀명 등록값이 변경되면 오류문구 메시지 hide
    $("#dept_nm").change(function(){
        if(($(this).val()) != ""){
            $("#dept_nm_error").hide();
        }
    });

    // 정렬 등록값이 변경 되면 오류문구 메시지 hide
    $("#sort_seq").change(function(){
        if(($(this).val()) != ""){
            $("#sort_seq_error").hide();
        }
    });

    // 부서명 selectbox 값 선택시 오류문구 hide
    $("#dept_select").change(function(){
       if($("#dept_select").val() != 0){
           $("#dept_select_error").hide();
       }
    });

    // 고객사 선택에 따른 부서 리스트 호출 #1
    function companyChange(){
        let dept_cd_head = document.getElementById("dept_nm_company").value;
        setDeptSelect(dept_cd_head);

    }

    // 고객사 선택에 따른 부서 리스트 호출 #2
    function setDeptSelect(dept_cd_head){
        let deptSelect = $("#dept_select");

        $.ajax({
            url : "/group/getDeptSelect",
            contentType : "application/x-www-form-urlencoded;charset=UTF-8",
            type : "post",
            data : { "dept_cd_head": dept_cd_head }, // 서버로 전달 인자
            async : false, // 동기식
            dataType : "json",  // 서버에서 받을 데이터형
            success : function(list) {
                deptSelect.empty();
                deptSelect.append("<option value=''>선택</option>");
                list.forEach(dept => {
                    deptSelect.append("<option value='" + dept.dept_cd_head + "'>" + dept.dept_nm_head + "</option>");


                });
                deptSelect.selectpicker('refresh');
            },
            error : function(request,status,error) {
                alert("***code***:"+request.status+"\n"+"***message***:"+request.responseText+"\n"+"***error***:"+error);
            }
        });
    }

    // 부서 SelectBox 선택시 Code 입력 구현
    $("#dept_select").change(function(){

        let ref_dept_cd = $(this).val();
        $("#ref_dept_cd").val(ref_dept_cd);
        $("#dept_cd_head").val(ref_dept_cd);

    });

    //고객사 선택 유효성 처리
    $("#dept_nm_company").change(function(){
        if($(this).val() === "0"){
            $("#dept_nm_company_error").show();
        } else{
            $("#dept_nm_company_error").hide();
        }
    });


    // 팀명 입력 유효성 처리
    $("#dept_nm").change(function(){
        if(($(this).val()) != ""){
            $("#dept_nm_error").hide();
        }else{
            $("#dept_nm_error").show();
        }
    });

    // 정렬 값 입력 유효성 처리
    $("#sort_seq").change(function(){
        if(($(this).val()) != ""){
            $("#sort_seq_error").hide();
        }else{
            $("#sort_seq_error").show();
        }
    });



</script>