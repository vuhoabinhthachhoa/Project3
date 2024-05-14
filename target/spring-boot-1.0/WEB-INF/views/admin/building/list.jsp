<%--
  Created by IntelliJ IDEA.
  User: TTC
  Date: 5/13/2024
  Time: 9:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        .navbar {
            background-color: rgba(20, 187, 42, 0.896);
        }

        .navbar a {
            color: #fff;
        }



        a.dropdown-item {
            color: #000;
        }

        .dropdown-item:active {
            background-color: rgba(20, 187, 42, 0.896);
        }

        .nav-link:focus,
        .nav-link:hover {
            color: #fff;
            opacity: 0.8;
        }

        .body {}

        .page-title {
            margin-top: 10px;
        }

        .page-title h1 {
            font-size: 28px;
        }


        .search-fields {
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-top: 20px;
        }

        .search-fields-title {
            background-color: #ccc;
            /* Change #ff0 to any color you want */
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .search-fields-title h2 {
            font-size: 18px;
            margin: 0;
        }

        .search-fields-content .row {
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .form-check-label {
            padding-left: 5px;
        }

        #deleteSelectedBuildingBtn {
            margin-top: 40px;
        }


        .results {
            margin-top: 20px;
            border-radius: 5px;
        }

        .results p {
            font-size: 12px;
            word-wrap: break-word;
        }

        .results-header {
            background-color: #ccc;
        }

        .results-field {
            border: 1px solid #7a7777;
            height: 60px;
        }

        .results-field p {
            margin: 0;
        }

        .operations-button {
            border: none;
            background-color: #fff;
        }

        .operations-button:hover {
            transform: scale(1.1);
        }

        .actions-btn {
            margin-top: 20px;
        }
    </style>
</head>
<body>
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
                <div class="col search-fields-content" id="search-fields-content">
                    <form class="container">
                        <div class="row">
                            <div class="col form-group">
                                <label for="building-name">Tên tòa nhà</label>
                                <input type="text" class="form-control" id="building-name" name="name">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-2 form-group">
                                <label for="district-name">Quận</label>
                                <select class="form-control" id="district-name" name="districtId">
                                    <option selected>---Chọn quận---</option>
                                    <option value="1">Quận 1</option>
                                    <option value="2">Quận 2</option>
                                    <!-- Add more options as needed -->
                                </select>
                            </div>
                            <div class="col-5 form-group">
                                <label for="ward-name">Phường</label>
                                <input type="text" class="form-control" id="ward-name" name="ward">
                            </div>
                            <div class="col-5 form-group">
                                <label for="street-name">Đường</label>
                                <select class="form-control" id="street-name" name="street">
                                    <!-- Add your options here -->
                                </select>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col form-group">
                                <label for="number-of-basement">Số tầng hầm</label>
                                <input type="text" class="form-control" id="number-of-basement" name="numberOfBasement">
                            </div>
                            <div class="col form-group">
                                <label for="direction">Hướng</label>
                                <input type="text" class="form-control" id="direction" name="direction">
                            </div>
                            <div class="col form-group">
                                <label for="rank">Hạng</label>
                                <input type="text" class="form-control" id="rank" name="rank">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col form-group">
                                <label for="area-from">Diện tích thuê từ</label>
                                <input type="text" class="form-control" id="area-from" name="areaFrom">
                            </div>
                            <div class="col form-group">
                                <label for="area-to">Diện tích thuê đến</label>
                                <input type="text" class="form-control" id="area-to" name="areaTo">
                            </div>
                            <div class="col form-group">
                                <label for="price-from">Giá thuê từ</label>
                                <input type="text" class="form-control" id="price-from" name="priceFrom">
                            </div>
                            <div class="col form-group">
                                <label for="price-to">Giá thuê đến</label>
                                <input type="text" class="form-control" id="price-to" name="priceTo">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-5 form-group">
                                <label for="manager-name">Tên quản lý</label>
                                <input type="text" class="form-control" id="manager-name" name="managerName">
                            </div>
                            <div class="col-4 form-group">
                                <label for="manager-phone">SĐT quản lý</label>
                                <input type="tel" class="form-control" id="manager-phone" name="managerPhoneNumber">
                            </div>
                            <div class="col-3 form-group">
                                <label for="staff">Nhân viên</label>
                                <select class="form-control" id="employee-name" name="employeeName">
                                    <option selected>---Chọn nhân viên---</option>
                                    <option value="1">Nhân viên 1</option>
                                    <option value="2">Nhân viên 2</option>
                                    <!-- Add more options as needed -->
                                </select>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6">
                                <div class="row">
                                    <div class="col">
                                        <div class="form-check p-0" style="display: flex; align-items: center;">
                                            <input type="checkbox" class="form-check-input m-0" id="checkbox1" name="typeCode">
                                            <label class="form-check-label" for="checkbox1">Nội thất</label>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-check p-0" style="display: flex; align-items: center;">
                                            <input type="checkbox" class="form-check-input m-0" id="checkbox2" name="typeCode">
                                            <label class="form-check-label" for="checkbox2">Tầng trệt</label>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-check p-0" style="display: flex; align-items: center;">
                                            <input type="checkbox" class="form-check-input m-0" id="checkbox3" name="typeCode">
                                            <label class="form-check-label" for="checkbox3">Nguyên căn</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <button class="btn btn-primary">Tìm kiếm</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <button class="btn btn-primary" id="deleteSelectedBuildingBtn">Xóa tòa nhà đã chọn</button>
            </div>
        </div>

        <table class="table table-bordered results" id="buildingList">
            <thead class="results-header">
            <tr>
                <th scope="col" style="display: flex; align-items: center; "><input type="checkbox" class="form-check-input">
                </th>
                <th scope="col">Ngày</th>
                <th scope="col">Tên sản phẩm</th>
                <th scope="col">Địa chỉ</th>
                <th scope="col">Số tầng hầm</th>
                <th scope="col">Tên quản lý</th>
                <th scope="col">Số điện thoại</th>
                <th scope="col">Diện tích sàn</th>
                <th scope="col">Diện tích trống</th>
                <th scope="col">Giá thuê</th>
                <th scope="col">Phí dịch vụ</th>
                <th scope="col">Phí MG</th>
                <th scope="col">Thao tác</th>
            </tr>
            </thead>
            <tbody>
            <tr data-building-id="1">
                <td ><input type="checkbox" class="form-check-input" value="1"></td>
                <td>19/10/1992</td>
                <td>Fuck building</td>
                <td>Thôn Hòa Bình, Xã Thạch Hóa, huyện Tuyên Hóa</td>
                <td>2</td>
                <td>Ngọc</td>
                <td>0943744973</td>
                <td>200</td>
                <td></td>
                <td>20</td>
                <td>300</td>
                <td>20</td>
                <td>
                    <button class="operations-button deleteBuildingBtn" type="button"><i class="fas fa-trash" style="color: red;"></i></button>
                    <button class="operations-button" type="button"><i class="fas fa-edit" style="color: green;"></i></button>
                    <button class="operations-button assignBuildingBtn" type="button" data-bs-toggle="modal" data-bs-target="#assignModal"><i
                            class="fas fa-user-plus" style="color: blue;"></i></button>
                </td>
            </tr>

            <tr data-building-id="2">
                <td><input type="checkbox" class="form-check-input" value="2"></td>
                <td>20/03/2004</td>
                <td>Fuck building</td>
                <td>Thôn Hòa Bình, Xã Thạch Hóa, huyện Tuyên Hóa</td>
                <td>2</td>
                <td>Vân</td>
                <td>0943744973</td>
                <td>200</td>
                <td></td>
                <td>20</td>
                <td>300</td>
                <td>20</td>
                <td>
                    <button class="operations-button deleteBuildingBtn" type="button"><i class="fas fa-trash" style="color: red;"></i></button>
                    <button class="operations-button" type="button"><i class="fas fa-edit" style="color: green;"></i></button>
                    <button class="operations-button assignBuildingBtn" type="button" data-bs-toggle="modal" data-bs-target="#assignModal"><i
                            class="fas fa-user-plus" style="color: blue;"></i></button>
                </td>
            </tr>
            <!-- Add more rows as needed -->
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
                        <tr>
                            <td><input type="checkbox" class="form-check-input" value="1"></td>
                            <td>Nguyễn Minh</td>
                        </tr>

                        <tr>
                            <td><input type="checkbox" class="form-check-input" value="2"></td>
                            <td>Lê Hải</td>
                        </tr>
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

    <!-- Start script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <script src="./assets/js/search-building.js"></script>
    <!-- End script -->
</body>
</html>
