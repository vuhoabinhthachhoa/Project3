<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title><dec:title default="Trang chủ" /></title>

<%--	<link rel="stylesheet" href="assets/css/bootstrap.min.css" />--%>
<%--    <link rel="stylesheet" href="font-awesome/4.5.0/css/font-awesome.min.css" />--%>
<%--    <link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />--%>
<%--    <script type='text/javascript' src="assets/js/ace-extra.min.js"></script>--%>
<%--    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">--%>
<%--    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">--%>

<%--	<!-- jquery -->--%>
<%--	<script type='text/javascript' src="js/2.1.4/jquery.min.js"></script>--%>

<%--	&lt;%&ndash;sweetalert&ndash;%&gt;--%>
<%--	<script type='text/javascript' src="assets/sweetalert2/sweetalert2.min.js"></script>--%>
<%--	<link rel="stylesheet" href="assets/sweetalert2/sweetalert2.min.css">--%>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
		  integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="/assets/css/style.css">
</head>
<body class="no-skin">
	<!-- header -->
    <%@ include file="/common/admin/header.jsp" %>
    <!-- header -->
	
	<div class="main-container" id="main-container">
		<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
		</script>
		<!-- header -->
<%--    	<%@ include file="/common/admin/menu.jsp" %>--%>
    	<!-- header -->
		
		<dec:body/>
		
<%--		<!-- footer -->--%>
<%--    	<%@ include file="/common/admin/footer.jsp" %>--%>
<%--    	<!-- footer -->--%>
<%--    	--%>
<%--    	<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse display">--%>
<%--				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>--%>
<%--		</a>--%>
	</div>

<%--	&lt;%&ndash;jQuery Validation Plugin&ndash;%&gt;--%>
<%--	<script src="js/jqueryvalidate/jquery.validate.min.js"></script>--%>

<%--	&lt;%&ndash;common javascript file&ndash;%&gt;--%>
<%--	<script type="text/javascript" src="js/global_admin_script.js"></script>--%>

<%--	<script src="assets/js/bootstrap.min.js"></script>--%>
<%--	<script src="assets/js/jquery-ui.custom.min.js"></script>--%>
<%--	<script src="assets/js/jquery.ui.touch-punch.min.js"></script>--%>
<%--	<script src="assets/js/jquery.easypiechart.min.js"></script>--%>
<%--	<script src="assets/js/jquery.sparkline.min.js"></script>--%>
<%--	<script src="assets/js/jquery.flot.min.js"></script>--%>
<%--	<script src="assets/js/jquery.flot.pie.min.js"></script>--%>
<%--	<script src="assets/js/jquery.flot.resize.min.js"></script>--%>
<%--	<script src="assets/js/ace-elements.min.js"></script>--%>
<%--	<script src="assets/js/ace.min.js"></script>--%>

<%--	<!-- page specific plugin scripts -->--%>
<%--	<script src="assets/js/jquery-ui.min.js"></script>--%>

	<!-- Start script -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
			crossorigin="anonymous"></script>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

	<script src="/assets/js/building-actions.js"></script>
	<script src="/assets/js/edit-add-building.js"></script>
	<script src="/assets/js/search-building.js"></script>
	<!-- End script -->

	<script type="text/javascript">
        function showAlertBeforeDelete(callback) {
            swal({
                title: "Xác nhận xóa",
                text: "Bạn có chắc chắn xóa những dòng đã chọn",
                type: "warning",
                showCancelButton: true,
                confirmButtonText: "Xác nhận",
                cancelButtonText: "Hủy bỏ",
                confirmButtonClass: "btn btn-success",
                cancelButtonClass: "btn btn-danger"
            }).then(function (res) {
                if(res.value){
                    callback();
                }else if(res.dismiss == 'cancel'){
                    console.log('cancel');
                }
            });
        }
	</script>
</body>
</html>