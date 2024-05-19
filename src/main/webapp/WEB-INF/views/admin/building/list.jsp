<%--
  Created by IntelliJ IDEA.
  User: TTC
  Date: 5/13/2024
  Time: 9:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <!-- breadcrumb -->
    <nav aria-label="breadcrumb" style="padding: 12px;">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/admin/home">Trang chủ</a></li>
            <li class="breadcrumb-item active" aria-current="page">Tìm kiếm tòa nhà</li>
        </ol>
    </nav>

    <!-- Start body content -->
    <div class="container">
        <div class="row page-title">
            <div class="col">
                <h1>Danh sách tòa nhà</h1>
            </div>
        </div>

        <div class="container search-fields">
            <div class="row search-fields-title">
                <div class="col">
                    <h2>Tìm kiếm</h2>
                </div>
                <div class="col-1 text-end">
                    <button class="collapse-button collapse-search-fields-btn" type="button" style="border: none;" data-bs-toggle="collapse"
                            data-bs-target="#search-fields-content" aria-expanded="false" aria-controls="searchFields">
                        <i class="fas fa-chevron-down">
                        </i>
                    </button>
                </div>
            </div>

            <div class="row">
                <form:form action="/admin/building-list" modelAttribute="searchBuilding" method="GET" id="searchForm">
                    <div class="col search-fields-content" id="search-fields-content">
                        <form class="container">
                            <div class="row">
                                <div class="col form-group">
                                    <label for="building-name">Tên tòa nhà</label>
<%--                                    <input type="text" class="form-control" id="building-name" name="name" value="${modelSearch.name}">--%>
                                    <form:input path="name" id="building-name" class="form-control"/>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-2 form-group">
                                    <label for="district-name">Quận</label>
                                    <form:select path="district" class="form-control" id="district-name">
                                        <form:option value="" label="---Chọn Quận---" />
                                        <form:options items="${districts}"/>
                                    </form:select>
                                </div>
                                <div class="col-5 form-group">
                                    <label for="ward-name">Phường</label>
                                    <form:input path="ward" id="ward-name" class="form-control"/>
                                </div>
                                <div class="col-5 form-group">
                                    <label for="street-name">Đường</label>
                                    <form:input path="street" id="street-name" class="form-control"/>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col form-group">
                                    <label for="number-of-basement">Số tầng hầm</label>
                                    <form:input path="numberOfBasement" id="number-of-basement" class="form-control" type="number"/>
                                </div>
                                <div class="col form-group">
                                    <label for="direction">Hướng</label>
                                    <form:input path="direction" id="direction" class="form-control"/>
                                </div>
                                <div class="col form-group">
                                    <label for="level">Hạng</label>
                                    <form:input path="level" id="level" class="form-control"/>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col form-group">
                                    <label for="area-from">Diện tích thuê từ</label>
                                    <form:input path="rentAreaFrom" id="area-from" class="form-control" type="number"/>
                                </div>
                                <div class="col form-group">
                                    <label for="area-to">Diện tích thuê đến</label>
                                    <form:input path="rentAreaTo" id="area-to" class="form-control" type="number"/>
                                </div>
                                <div class="col form-group">
                                    <label for="price-from">Giá thuê từ</label>
                                    <form:input path="rentPriceFrom" id="price-from" class="form-control" type="number"/>
                                </div>
                                <div class="col form-group">
                                    <label for="price-to">Giá thuê đến</label>
                                    <form:input path="rentPriceTo" id="price-to" class="form-control" type="number"/>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-5 form-group">
                                    <label for="manager-name">Tên quản lý</label>
                                    <form:input path="managerName" id="manager-name" class="form-control"/>
                                </div>
                                <div class="col-4 form-group">
                                    <label for="manager-phone">SĐT quản lý</label>
                                    <form:input path="managerPhone" id="manager-phone" class="form-control"/>
                                </div>
                                <div class="col-3 form-group">
                                    <label>Nhân viên</label>
                                    <form:select path="staffId" class="form-control" id="employee-name">
                                        <form:option value="" label="---Chọn nhân viên---" />
                                        <form:options items="${staffs}"/>
                                        <!-- Add more options as needed -->
                                    </form:select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-6">
                                    <label>Loại tòa nhà</label>
                                    <div class="row">
                                        <div class="col">
                                            <form:checkboxes path="typeCode" items="${typeCodes}" cssClass="form-check-input" cssStyle="margin-right: 4px"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <div class="container">
                            <div class="row">
                                <div class="col">
                                    <button class="btn btn-primary" id="searchBuildingBtn">Tìm kiếm</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form:form>

            </div>
        </div>

        <div class="row">
            <div class="col" style="margin-top: 40px;">
                <button class="btn btn-primary" id="deleteSelectedBuildingBtn">Xóa tòa nhà đã chọn</button>
                <a href="/admin/add-edit-building" class="btn btn-primary">Thêm tòa nhà</a>
            </div>
        </div>

        <table class="table table-bordered results" id="buildingList">
            <thead class="results-header">
            <tr>
                <th scope="col" style="display: flex; align-items: center; ">
<%--                    <input type="checkbox" class="form-check-input" id="selectAllCheckbox">--%>
                </th>
                <th scope="col">Ngày</th>
                <th scope="col">Tên tòa nhà</th>
                <th scope="col">Địa chỉ</th>
                <th scope="col">Số tầng hầm</th>
                <th scope="col">Tên quản lý</th>
                <th scope="col">Số điện thoại</th>
                <th scope="col">Diện tích sàn</th>
                <th scope="col">Diện tích trống</th>
                <th scope="col">Giá thuê</th>
                <th scope="col">Diện tích thuê</th>
                <th scope="col">Phí dịch vụ</th>
                <th scope="col">Phí MG</th>
                <th scope="col">Thao tác</th>
            </tr>
            </thead>
            <tbody>
<%--             render data here--%>
            </tbody>
        </table>
    </div>
    <!-- End body content -->

    <!-- Start Modal -->
    <div class="modal fade" id="assignModal" tabindex="-1" aria-labelledby="assignModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="assignModalLabel">Danh sách nhân viên</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered" id="staffList">
                        <thead class="results-header">
                        <tr>
                            <th scope="col"></th>
                            <th scope="col">Tên nhân viên</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                    <input type="hidden" id="buildingId" name="buildingId" value="">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="button" id="modalAssignBuildingBtn" class="btn btn-primary">Giao tòa nhà</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal -->
</body>
</html>
