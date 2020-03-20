<!DOCTYPE html>
<html>

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
                        <h1>Hello Board</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
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
</script>
</body>
</html>
