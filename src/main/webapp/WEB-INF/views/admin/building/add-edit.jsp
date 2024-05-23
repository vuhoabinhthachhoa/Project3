<%--
  Created by IntelliJ IDEA.
  User: TTC
  Date: 5/14/2024
  Time: 1:48 PM
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
            <li class="breadcrumb-item active" aria-current="page">Thêm, sửa tòa nhà</li>
        </ol>
    </nav>

    <div class="container">
        <div class="row page-title">
            <div class="col">
                <h1>Sửa hoặc thêm tòa nhà</h1>
            </div>
        </div>

        <div class="container search-fields">
            <div class="row search-fields-title">
                <div class="col">
                    <h2>Thông tin tòa nhà</h2>
                </div>
                <div class="col-1 text-end">
                    <button class="collapse-button" type="button" style="border: none;" data-bs-toggle="collapse"
                            data-bs-target="#search-fields-content" aria-expanded="false" aria-controls="searchFields">
                        <i class="fas fa-chevron-down"></i>
                    </button>
                </div>
            </div>

            <div class="row">
                <form:form action="/admin/add-edit-building" modelAttribute="addOrEditBuilding" method="GET" id="addOrEditForm">
<%--                    <input type="hidden" id="buildingId" name="buildingId" value=""> <!-- hidden input to store building id -->--%>
                    <div class="col search-fields-content" id="search-fields-content">
                    <form class="container" >
                        <div class="row">
                            <div class="col form-group">
                                <label for="building-name">Tên tòa nhà</label>
                                <form:input path="name" id="building-name" class="form-control"/>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col form-group">
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
                                <!-- Add your options here -->
                                </select>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col form-group">
                                <label for="structure">Kết cấu</label>
                                <form:input path="structure" id="structure" class="form-control"/>
                            </div>
                            <div class="col form-group">
                                <label for="number-of-basement">Số tầng hầm</label>
                                <form:input path="numberOfBasement" id="number-of-basement" class="form-control" type="number"/>
                            </div>
                            <div class="col form-group">
                                <label for="floor-area">Diện tích sàn</label>
                                <form:input path="floorArea" id="floor-area" class="form-control" type="number"/>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col form-group">
                                <label for="direction">Hướng</label>
                                <form:input path="direction" id="direction" class="form-control"/>
                            </div>
                            <div class="col form-group">
                                <label for="level">Hạng</label>
                                <form:input path="level" id="level" class="form-control"/>
                            </div>
                            <div class="col form-group">
                                <label for="rent-area">Diện tích thuê</label>
                                <form:input path="rentArea" id="rent-area" class="form-control" placeholder="ví dụ: 200,300,400,500"/>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col form-group">
                                <label for="rent-price">Giá thuê</label>
                                <form:input path="rentPrice" id="rent-price" class="form-control" type="number"/>
                            </div>
                            <div class="col form-group">
                                <label for="rent-price-description">Mô tả giá</label>
                                <form:input path="rentPriceDescription" id="rent-price-description" class="form-control"/>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col form-group">
                                <label for="service-fee">Phí dịch vụ</label>
                                <form:input path="serviceFee" id="service-fee" class="form-control" type="number"/>
                            </div>
                            <div class="col form-group">
                                <label for="car-fee">Phí ô tô</label>
                                <form:input path="carFee" id="car-fee" class="form-control" type="number"/>
                            </div>
                            <div class="col form-group">
                                <label for="motorbike-fee">Phí mô tô</label>
                                <form:input path="motoFee" id="motorbike-fee" class="form-control" type="number"/>
                            </div>
                            <div class="col form-group">
                                <label for="overtime-fee">Phí ngoài giờ</label>
                                <form:input path="overtimeFee" id="overtime-fee" class="form-control" type="number"/>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col form-group">
                                <label for="electricity-fee">Tiền điện</label>
                                <form:input path="electricityFee" id="electricity-fee" class="form-control" type="number"/>
                            </div>
                            <div class="col form-group">
                                <label for="deposit">Đặt cọc</label>
                                <form:input path="deposit" id="deposit" class="form-control" type="number"/>
                            </div>
                            <div class="col form-group">
                                <label for="payment">Thanh toán</label>
                                <form:input path="payment" id="payment" class="form-control"/>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col form-group">
                                <label for="rent-time">Thời hạn thuê</label>
                                <form:input path="rentTime" id="rent-time" class="form-control"/>
                            </div>
                            <div class="col form-group">
                                <label for="decoration-time">Thời gian trang bị</label>
                                <form:input path="decorationTime" id="decoration-time" class="form-control"/>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-5 form-group">
                                <label for="manager-name">Tên quản lý</label>
                                <form:input path="managerName" id="manager-name" class="form-control"/>                            </div>
                            <div class="col-4 form-group">
                                <label for="manager-phone">SĐT quản lý</label>
                                <form:input path="managerPhone" id="manager-phone" class="form-control" type="tel"/>
                            </div>
                            <div class="col-3 form-group">
                                <label for="brokerage-fee">Phí môi giới</label>
                                <form:input path="brokerageFee" id="brokerage-fee" class="form-control" type="number" value="${addOrEditBuilding.brokerageFee}"/>
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

                        <div class="row">
                            <div class="col form-group">
                                <label for="notes">Ghi chú</label>
                                <form:input path="note" id="notes" class="form-control"/>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col form-group">
                                <label for="avatar">Ảnh tòa nhà</label>
                                <form:input path="avatar" id="avatar" class="form-control" type="file" accept="image/png, image/jpeg"/>

                                    <c:if test="${not empty addOrEditBuilding.avatar}">
                                        <c:set var="imagePath" value="/repository${addOrEditBuilding.avatar}"/>
                                        <img src="${imagePath}" alt="" id="viewImage" width="300px" height="300px" style="margin-top: 50px">
                                    </c:if>
                                    <c:if test="${empty addOrEditBuilding.avatar}">
                                        <img src="/admin/image/default.png" alt="" id="viewImage" width="300px" height="300px">
                                    </c:if>

                            </div>
                        </div>
                    </form>

                    <div class="container">
                        <div class="row">
                            <div class="col actions-btn">
                                <c:if test="${addOrEditBuilding.id == null}">
                                    <button class="btn btn-primary add-building-btn" id="addBuildingBtn">Thêm mới</button>
                                </c:if>
                                <c:if test="${addOrEditBuilding.id != null}">
                                    <button class="btn btn-primary add-building-btn" id="updateBuildingBtn">Cập nhật</button>
                                    <form:input type="hidden" path="id" id="building-id"/>
                                </c:if>

                                <a href="/admin/building-list" class="btn btn-primary" id="cancelAddOrUpdateBuildingBtn">Hủy thao tác</a>
                            </div>
                            <div class="col"></div>
                        </div>
                    </div>
                </div>
                </form:form>
            </div>
        </div>
    </div>

</body>
</html>
