<%--
  Created by IntelliJ IDEA.
  User: jongho.shin
  Date: 2019-07-09
  Time: 오후 4:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--begin updatemodal--%>
<div class="col-xl-12">
    <!--begin::Portlet-->
    <div class="kt-portlet">
        <div class="modal fade" tabindex="-1" role="dialog"  aria-hidden="true" id="update_team_modal">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">조직정보(팀 수정)</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        </button>
                    </div>
                    <div class="modal-body">
                        <form name="updateForm" method="post">


                            <div class="mdb">
                                <div class="w30 fl"> 고객사명 <span class="po">* </span> </div>
                                <div class="w70 fl">
                                    <input type="text" name="dept_nm_company" class="form-control control2 m-input he30 fl w100" id="edit_dept_nm_company" readonly>
                                    <input type="hidden" name="dept_cd_company" id="edit_dept_cd_company"/>
                                </div>
                            </div>


                            <div class="mdb">
                                <div class="w30 fl">부서명</div>
                                <div class="w70 fl">
                                    <select class="form-control kt-selectpicker" id="edit_dept_select">
                                        <option value="0000">선택</option>
                                    </select>
                                </div>
                            </div>
                            <input type="hidden" name="dept_cd_head" id="edit_dept_cd_head"/>


                            <div class="mdb">
                                <div class="w30 fl"> 팀명 <span class="po">* </span> </div>
                                <div class="w70 fl">
                                    <input type="text" name="dept_nm" class="form-control control2 m-input w100 fl he30" placeholder="팀명을 입력해주세요" id="dept_nm_team">
                                    <input type="hidden" name="dept_cd" id="edit_dept_cd"/>
                                    <input type="hidden" name="ref_dept_cd" id="edit_ref_dept_cd"/>
                                    <input type="hidden" name="depth" value="2" id="depth"/>
                                    <input type="hidden" name="use_yn" id="update_team_use_yn"/>
                                    <input type="hidden" name="change_dept_cd" id="change_dept_cd"/>
                                    <input type="hidden" name="change_dept_yn" id="change_dept_yn"/>
                                </div>
                            </div>
                            <div  class="po fs11 fr"  style="width: 69%; padding:1px; display: block;" id="update_dept_nm_error"> *부서명을 입력 해주세요.</div>


                            <div class="mdb">
                                <div class="w30 fl">팀상태<span class="po">* </span>  </div>
                                <div class="w70 fl">
                                    <select name="dept_status" class="form-control kt-selectpicker" id="update_team_status">
                                        <option value="DS001" id="in_yes_dept_status">사용중</option>
                                        <option value="DS002" id="in_no_dept_status">업무중지</option>
                                    </select>
                                </div>
                            </div>


                            <div class="mdb">
                                <div class="w30 fl"> 정렬순서<span class="po">* </span> </div>
                                <div class="w70 fl">
                                    <input type="text" name="sort_seq" class="form-control control2 m-input w100 fl he30" placeholder="기본값은 0입니다." id="update_sort_seq" >
                                </div>
                            </div>
                            <div  class="po fs11 fr"  style="width: 69%; padding:1px; display: block;" id="update_sort_seq_error"> 정렬값을 입력해주세요.</div>


                            <div class="mdb">
                                <div class="w30 fl"> 비고 </div>
                                <div class="form-group form-group-last w70 fl">
                                    <textarea name="remark" class="form-control " id="update_remark" rows="12"  style="height: 45px ! important "></textarea>
                                </div>
                            </div>
                            <input type="hidden" name="insert_id" value=${sessionScope.login.getId()}></input>
                            <input type="hidden" name="update_id" value=${sessionScope.login.getId()}></input>
                        </form>
                    </div>

                    <div class="modal-footer">
                        <span class="po fs11"  style="float: left; width: 70%;">*항목은 필수항목입니다. </span><br><br>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="closeBtn">닫기</button>
                        <button type="button" name="insertBtn" class="btn btn-primary" id="updateBtn">수정</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<%--end updatemodal--%>

<script src="/resources/assets/vendors/general/jquery/dist/jquery.js" type="text/javascript"></script>

<script>

    // 수정 진행 onclick
    function updateTeam(dept_cd_company, dept_nm_company, dept_cd_head, dept_nm_head, dept_cd, dept_nm_team, dept_status, sort_seq, remark){

        $("#update_dept_nm_error").hide();                          // 부서명 오류문구 숨김
        $("#update_sort_seq_error").hide();                         // 정렬값 오류문구 숨김


        $("#edit_dept_nm_company").val(dept_nm_company);          // 고객사명
        $("#edit_dept_cd_company").val(dept_cd_company);          // 고객사명 code


        // 수정에 따른 부서 리스트 호출 #1
        let edit_dept_cd_head = document.getElementById("edit_dept_cd_company").value;
        editDeptSelect(edit_dept_cd_head);

        if(dept_cd_head == "-"){                                        // 부서값이 없는경우
            let dept_cd_head = "0000"
            $("#edit_dept_select").selectpicker("val", dept_cd_head);
            $("#edit_dept_cd_head").val(dept_cd_head);                  // 부서 code
            $("#edit_ref_dept_cd").val(dept_cd_head);
        }else{                                                          // 부서값이 있는경우
            $("#edit_dept_select").selectpicker("val", dept_cd_head);

        }

        $("#dept_nm_team").val(dept_nm_team);                       // 팀명
        $("#edit_dept_cd").val(dept_cd);                            // 팀 code
        $("#edit_dept_cd_company").val(dept_cd_company);          // 고객사 code
        $("#update_team_status").selectpicker("val", dept_status);  // selectBox의 경우 값을 넣으려면 selectpicker로 넣고 "val" 로 해야한다
        $("#update_sort_seq").val(sort_seq);                        // 정렬값
        $("#update_remark").val(remark);                            // 비고값

        $("#dept_nm_head").change(function(){
            let test = $("#dept_nm_head").val()
        });

    }

    // 수정에 따른 부서 리스트 호출 #2
    function editDeptSelect(edit_dept_cd_head){
        let editDeptSelect = $("#edit_dept_select");

        $.ajax({
            url : "/group/getEditDeptSelect",
            contentType : "application/x-www-form-urlencoded;charset=UTF-8",
            type : "post",
            data : { "dept_cd_head": edit_dept_cd_head }, // 서버로 전달 인자
            async : false, // 동기식
            dataType : "json",  // 서버에서 받을 데이터형
            success : function(list) {
                editDeptSelect.empty();
                editDeptSelect.append("<option value='0000'>-</option>");
                list.forEach(dept => {
                    editDeptSelect.append("<option value='" + dept.dept_cd_head + "'>" + dept.dept_nm_head + "</option>");
                });
                editDeptSelect.selectpicker('refresh');
            },
            error : function(request,status,error) {
                alert("***code***:"+request.status+"\n"+"***message***:"+request.responseText+"\n"+"***error***:"+error);
            }
        });
    }



    // 팀 [수정] 버튼 클릭
    $("#updateBtn").click(function(){

        let dept_nm_team = $("#dept_nm_team").val().replace(/ /g, "");      // 공백 제거
        $("#dept_nm_team").val(dept_nm_team);

        if($("#dept_nm_team").val() == ""){              // 팀명 값 미입력시 오류문구
            $("#update_dept_nm_error").show();
            if($("#update_sort_seq").val() == ""){         // 정렬 값 미입력시 오류문구
                $("#update_sort_seq_error").show();
                return false;
            }
            return false;
        }else if($("#update_sort_seq").val() == ""){
            $("#update_sort_seq_error").show();
            return false;
        }

        if($("#update_team_status").val() == "DS001"){      // 부서상태 값으로 사용유무 값 변경
            $("#update_use_yn").val("Y");
        }else{
            $("#update_use_yn").val("N");
        }

        document.updateForm.action = "/group/teamUpdate"
        document.updateForm.submit();
    });



    // 사용 유무 변경
    $("#update_team_status").change(function(){

        if(($(this).val()) === "DS001"){
            $("#update_team_use_yn").val("Y");           // dept_status 값을 기준으로 사용유무 값을 넣는다
        }else{
            $("#update_team_use_yn").val("N");
        }
    });

    // 부서 SelectBox 선택시 Code 입력 구현
    $("#edit_dept_select").change(function(){

        let ref_dept_cd = $(this).val();
        $("#edit_ref_dept_cd").val(ref_dept_cd);
        $("#edit_dept_cd_head").val(ref_dept_cd);

    });

    // 팀명 입력 유효성 처리
    $("#dept_nm_team").change(function(){
        if(($(this).val()) != ""){
            $("#update_dept_nm_error").hide();
        }else{
            $("#update_dept_nm_error").show();
        }
    });

    // 정렬 값 입력 유효성 처리
    $("#update_sort_seq").change(function(){
        if(($(this).val()) != ""){
            $("#update_sort_seq_error").hide();
        }else{
            $("#update_sort_seq_error").show();
        }
    });



</script>