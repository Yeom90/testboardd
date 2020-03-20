<%--
  Created by IntelliJ IDEA.
  User: kbsjob
  Date: 2020-03-17
  Time: 오후 2:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Modal -->
<div class="modal fade" id="empRegForm" role="dialog"><!-- form 태그가 아니어도 가능 -->
    <div class="modal-dialog">

        <!-- Modal content -->
        <div class="modal-content">
            <div class="modal-header">
                <h4 id="modal-title" class="modal-title"></h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <table class="table">
                    <tr>
                        <td>사원아이디<span style="color: red">*</span></td>
                        <td><input id="empId" type="text" class="form-control"></td>
                        <td>
                            <button id="checkId" class="btn-info" type="button">중복검색</button>
                        </td>
                    </tr>
                    <tr>
                        <td>사원명<span style="color: red">*</span></td>
                        <td><input id="empName" class="form-control"/></td>
                    </tr>
                    <tr>
                        <td>부서코드</td>
                        <td>
                            <select id="teamCode" name="teamCode" class="form-control">
                                <option value="">본무명선택</option>
                                <option value="LG">LG</option>
                                <option value="루키스">루키스</option>
                                <option value="삼성">삼성</option>
                                <option value="유비콤">유비콤</option>
                                <option value="한국고용정보">한국고용정보</option>
                                <option value="현대자동차">현대자동차</option>
                            </select>
                        </td>
                        <td>
                            <select id="teamName" name="teamName" class="form-control">
                                <option value="">팀명선택</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>내선번호<span style="color: red">*</span></td>
                        <td><input id="interphone"/></td>
                        <td>
                            <button id="checkInterphone" class="btn-info" type="button">중복검색</button>
                        </td>
                    </tr>
                    <tr>
                        <td>재직여부<span style="color: red">*</span></td>
                        <td>
                            <select id="isWorking" name="isWorking" class="form-control">
                                <option value="">선택</option>
                                <option value="재직">재직</option>
                                <option value="퇴직">퇴직</option>
                                <option value="휴직">휴직</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>업무<span style="color: red">*</span></td>
                        <td>
                            <select id="task" name="task" class="form-control">
                                <option value="">선택</option>
                                <option value="상담">상담</option>
                                <option value="관리">관리</option>
                                <option value="기사">기사</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>권한<span style="color: red">*</span></td>
                        <td>
                            <select id="athority" name="athority" class="form-control">
                                <option value="">선택</option>
                                <option value="AM">AM</option>
                                <option value="MANAGER">MANAGER</option>
                                <option value="INSTRUCTOR">INSTRUCTOR</option>
                                <option value="ASSIST">ASSIST</option>
                                <option value="SUPERVISOR">SUPERVISOR</option>
                                <option value="AGENT">AGENT</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>입사일자<span style="color: red">*</span></td>
                        <td>
                            <input id="inDate" type="date" class="form-control"/>
                        </td>
                    </tr>
                    <tr>
                        <td>퇴사일자<span style="color: red">*</span></td>
                        <td>
                            <input id="outDate" type="date" class="form-control"/>
                        </td>
                    </tr>
                    <td>비고</td>
                    <td><textarea id="extraInfo" class="form-control"></textarea></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer" style="width: 100%">
                <p align="left">*항목은 <span style="color: red">필수항목</span> 입니다.</p>
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                <button id="modalSubmit" type="button" class="btn btn-success">저장</button>
            </div>
        </div>
    </div>
</div>
