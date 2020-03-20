<!DOCTYPE html>
<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- head -->
<%@include file="/WEB-INF/view/include/test_head.jsp" %>
<body class="hold-transition sidebar-mini">
<!-- 화면 전체 -->
<div class="wrapper">
    <!-- 네비게이션 -->
    <%@include file="/WEB-INF/view/include/nav.jsp" %>

    <!-- 사이드 바 -->
    <%@include file="/WEB-INF/view/include/left_column.jsp" %>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>DataTables</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">DataTables</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">DataTable with minimal features & hover style</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="example2" class="table table-bordered table-hover">
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
                                    <th>${board.empId}</th>
                                    <th>${board.empName}</th>
                                    <th>${board.interphone}</th>
                                    <th>${board.team}</th>
                                    <th>${board.athority}</th>
                                    <th>${board.isWorking}</th>
                                    <th>${board.inDate}</th>
                                    <th>${board.outDate}</th>
                                    <th>${board.pwdErCnt}</th>
                                    <th>초기화</th>
                                    <th>${board.register}</th>
                                    <th>${board.regDate}</th>
                                </tr>
                            </c:forEach>
                            </tbody>
                            </table>
                            <!-- 사원 등록 Modal 창 인클루드 -->
                            <jsp:include page="../include/empRegForm.jsp"></jsp:include>
                            <div>
                                <button id="registerBtn" type="button" class="btn btn-info" data-toggle="modal">등록</button>
                            </div>
                            <div>
                                <button id="modifyBtn" type="button" class="btn btn-default" data-toggle="modal">수정</button>
                            </div>
                            <div>
                                <button id="deleteBtn" type="button" class="btn btn-danger" data-toggle="modal">삭제</button>
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.col-12 -->
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- footer -->
    <%@include file="/WEB-INF/view/include/footer.jsp" %>

</div>
<!-- ./wrapper -->

<!-- plugin_js.jsp -->
<%@include file="/WEB-INF/view/include/plugin_js.jsp" %>
<!-- page script -->
<script>
    $(function () {
        $("#example1").DataTable();
        $('#example2').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false,
        });
    });

    //Modal 관련 이벤트 처리
    let action = '';
    let url = '';
    let requestType = '';
    $(function () {
        //리스트에서 등록 버튼 이벤트 처리(Modal 생성)
        $("#registerBtn").click(function () {
            action = 'create';
            requestType = 'POST';
            $("#modal-title").text("사원정보 등록");
            $("#empRegForm").modal();
        });

        //리스트에서 수정 버튼 이벤트 처리(Modal 생성)
        $("#modifyBtn").click(function () {
            action = 'modify';
            requestType = 'POST';
            $("#modal-title").text("사원정보 수정");
            $("#empRegForm").modal();
        });

        //리스트에서 삭제 버튼 이벤트 처리
        $("#deleteBtn").click(function () {
            bno = this.value;
            $.ajax({
                url : '/delete',
                type : 'POST',
                data : '#'
            })
        })

        //Modal창에서 Submit 이벤트 처리 (저장)
        $("#modalSubmit").click(function () {

            if(action == 'create'){
                url = '/write';
            }else{
                alert('예외')
            }

            //ajax로 보낼 데이터를 담는 리터럴 객체
            let reg_data = {
                "empId" : $("#empId").val(),
                "empName" : $("#empName").val(),
                "interphone" : $("#interphone").val(),
                "team" : $("#teamCode").val(),
                "athority" : $("#athority").val(),
                "isWorking" : $("#isWorking").val(),
                "inDate" : $("#inDate").val(),
                "outDate" : $("#outDate").val(),
                "register" : $("#extraInfo").val()
            };

            //let test = $("#empRegForm").serialize();
            //console.log("empRegForm의 ID: " + test.empId);
            console.log("empId: " + reg_data.empId);

            //summit 클릭시 이벤트 처리 (사원 저장 버튼)
            $.ajax({
                url : action,
                type : requestType,
                //contentType : "application/x-www-form-urlencoded; charset=UTF-8",
                data : reg_data,
                //dataType : "json",
                success: function (result) {
                    alert("성공");
                    $("#empRegForm").modal('toggle'); // .modal('toggle') : modal이 켜져있을때 호출하면 꺼지고, 꺼졌을때 호출하면 켜짐(==스위치)
                },
                error: function (xhr,status) {
                   console.log(xhr, status);
                }
            });
        });
    });

    let result = "${msg}";
    if (result == "regSuccess") {
        alert("사원 등록 성공");
    } else if (result == "modSuccess") {
        alert("사원 수정 완료");
    } else if (result == "removeSuccess") {
        alert("사원 삭제 완료");
    }

</script>
</body>
</html>
