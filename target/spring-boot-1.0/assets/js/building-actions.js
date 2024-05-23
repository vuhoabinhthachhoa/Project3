const url = '/api/buildings';

function addBuilding(data) {
    if(data.typeCode.length === 0) {
        alert('Please select a building type');
        return;
    }
    if(data.name == null || data.name.length === 0) {
        alert('Building name is missing');
        return;
    }

    $.ajax({
        url: url, // 'http://localhost:8081 is not necessary, because we are using tomcat
        type: 'POST',
        data: JSON.stringify(data),
        contentType: 'application/json',
        dataType: 'text',
        success: function(response) {
            alert(response);
            window.location.replace("/admin/building-list")
        },
        error: function(jqXHR, textStatus, errorThrown) {
            alert('apply failed');
            console.log('apply failed');
            console.log('Status: ' + jqXHR.status); // HTTP status code
            console.log('Error: ' + textStatus); // Type of error
            console.log('Exception: ' + errorThrown); // Exception thrown by the error
            console.log('Response text: ' + jqXHR.responseText); // Complete response from the server
        }
    });
}

// function addBuilding(formData) {
//     // if(!formData.has('typeCode')) {
//     //     alert('Please select a building type');
//     //     return;
//     // }
//     // if(!formData.has('name')) {
//     //     alert('Building name is missing');
//     //     return;
//     // }
//
//     $.ajax({
//         url: url,
//         type: 'POST',
//         data: formData,
//         processData: false,  // tell jQuery not to process the data
//         contentType: false,  // tell jQuery not to set contentType
//         dataType: 'text',
//         success: function(response) {
//             alert(response);
//             window.location.replace("/admin/building-list")
//         },
//         error: function(jqXHR, textStatus, errorThrown) {
//             alert('apply failed');
//             console.log('apply failed');
//             console.log('Status: ' + jqXHR.status); // HTTP status code
//             console.log('Error: ' + textStatus); // Type of error
//             console.log('Exception: ' + errorThrown); // Exception thrown by the error
//             console.log('Response text: ' + jqXHR.responseText); // Complete response from the server
//         }
//     });
// }

function updateBuilding(data) {
    if(data.typeCode.length === 0) {
        alert('Please select a building type');
        return;
    }
    if(data.id == null) {
        alert('Building id is missing');
        return;
    }
    if(data.name == null || data.name.length === 0) {
        alert('Building name is missing');
        return;
    }
    if(data.rentArea === "") {
        alert('Rent areas is missing');
        return;
    }

    $.ajax({
        url: url,
        type: 'PUT',
        data: JSON.stringify(data),
        contentType: 'application/json',
        dataType: 'text',
        success: function(response) {
            alert(response);
            window.location.replace("/admin/building-list")
        },
        error: function(jqXHR, textStatus, errorThrown) {
            alert('apply failed');
            console.log('apply failed');
            console.log('Status: ' + jqXHR.status); // HTTP status code
            console.log('Error: ' + textStatus); // Type of error
            console.log('Exception: ' + errorThrown); // Exception thrown by the error
            console.log('Response text: ' + jqXHR.responseText); // Complete response from the server
        }
    });
}

function updateAssignmentBuilding(data) {
    $.ajax({
        url: url + '/assignment',
        type: 'PUT',
        data: JSON.stringify(data),
        contentType: 'application/json',
        dataType: 'text',
        success: function(response) {
            alert(response);
        },
        error: function(jqXHR, textStatus, errorThrown) {
            alert('apply failed');
            console.log('apply failed');
            console.log('Status: ' + jqXHR.status); // HTTP status code
            console.log('Error: ' + textStatus); // Type of error
            console.log('Exception: ' + errorThrown); // Exception thrown by the error
            console.log('Response text: ' + jqXHR.responseText); // Complete response from the server
        }
    });
}

function deleteBuilding(data) {
    if(data == null || data.length === 0) {
        alert('Please select a building to delete');
        return;
    }
    $.ajax({
        url: url,
        type: 'DELETE',
        data: JSON.stringify(data),
        contentType: 'application/json',
        dataType: 'text',
        success: function(response) {
            alert(response);
            window.location.replace("/admin/building-list")
        },
        error: function(jqXHR, textStatus, errorThrown) {
            alert('apply failed');
            console.log('apply failed');
            console.log('Status: ' + jqXHR.status); // HTTP status code
            console.log('Error: ' + textStatus); // Type of error
            console.log('Exception: ' + errorThrown); // Exception thrown by the error
            console.log('Response text: ' + jqXHR.responseText); // Complete response from the server
        }
    });
}

function loadStaffs(buildingId) {
    $.ajax({
        url: url +'/' + buildingId + '/staffs', // 'http://localhost:8081 is not necessary, because we are using tomcat
        type: 'GET',
        dataType: 'JSON',
        success: function(response) {
            var row = '';
            $.each(response.data, function(i, staff) {
                row += '<tr>';
                row += '<td><input type="checkbox" class="form-check-input" value="' + staff.staffId + '" ' + staff.checked +  ' ></td>';
                row += '<td>' + staff.fullName + '</td>';
                // row += '<td type="hidden">' + staff.staffId + '</td>';
                row += '</tr>';
            });
            $('#staffList tbody').html(row);
        },
        error: function(jqXHR, textStatus, errorThrown) {
            alert('apply failed');
            console.log('apply failed');
            console.log('Status: ' + jqXHR.status); // HTTP status code
            console.log('Error: ' + textStatus); // Type of error
            console.log('Exception: ' + errorThrown); // Exception thrown by the error
            console.log('Response text: ' + jqXHR.responseText); // Complete response from the server
        }
    });
}

function searchBuilding(data) {
    var searchUrl = url + '?';

    // Append each field in data as a request parameter
    for (var key in data) {
        if (data.hasOwnProperty(key)) {
            searchUrl += encodeURIComponent(key) + '=' + encodeURIComponent(data[key]) + '&';
        }
    }

    // Remove the last '&'
    searchUrl = searchUrl.slice(0, -1);

    // $.ajax({
    //     url: searchUrl,
    //     type: 'GET',
    //     dataType: 'JSON'
    // }).done(function(response){
    //         var row = '';
    //         $.each(response.data, function(i, building) {
    //             row += '<tr data-building-id="' + building.id + '">';
    //             row += '<td>' + building.createdDate + '</td>';
    //             row += '<td>' + building.name + '</td>';
    //             row += '<td>' + building.address + '</td>';
    //             row += '<td>' + building.numberOfBasement + '</td>';
    //             row += '<td>' + building.managerName + '</td>';
    //             row += '<td>' + building.managerPhone + '</td>';
    //             row += '<td>' + building.floorArea + '</td>';
    //             row += '<td>' + building.emptyArea + '</td>';
    //             row += '<td>' + building.rentPrice + '</td>';
    //             row += '<td>' + building.serviceFee + '</td>';
    //             row += '<td>' + building.brokerageFee + '</td>';
    //             row += '</tr>';
    //         });
    //         $('#buildingList tbody').html(row); // replace 'resultsTable' with the id of your table
    //     }).fail(function(jqXHR, textStatus, errorThrown) {
    //     alert('search failed');
    // });

    $.ajax({
        url: searchUrl,
        type: 'GET',
        dataType: 'JSON',
        success: function (response) {
            var row = '';
            $.each(response.data, function (i, building) {
                // Convert all null fields to an empty string
                for (var key in building) {
                    if (building[key] === null) {
                        building[key] = "";
                    }
                }

                row += '<tr data-building-id="' + building.id + '">';
                row += '<td>'
                     + '<input type="checkbox" class="form-check-input buildingCheckbox" value="' + building.id  +  '">'
                + '</td>'
                row += '<td>' + building.createdDate + '</td>';
                row += '<td>' + building.name + '</td>';
                row += '<td>' + building.address + '</td>';
                row += '<td>' + building.numberOfBasement + '</td>';
                row += '<td>' + building.managerName + '</td>';
                row += '<td>' + building.managerPhone + '</td>';
                row += '<td>' + building.floorArea + '</td>';
                row += '<td>' + building.emptyArea + '</td>';
                row += '<td>' + building.rentPrice + '</td>';
                row += '<td>' + building.rentArea + '</td>';
                row += '<td>' + building.serviceFee + '</td>';
                row += '<td>' + building.brokerageFee + '</td>';
                row += '<td>' +
                    '<button class="operations-button deleteBuildingBtn" type="button">' +
                    '<i class="fas fa-trash" style="color: red;"></i>' +
                    '</button>' +

                    '<a href="/admin/add-edit-building/' + building.id + '">' +
                    '<button class="operations-button updateBuildingBtnList" type="button">' +
                    '<i class="fas fa-edit" style="color: green;"></i>' +
                    '</button>' +
                    '</a>' +

                    '<button class="operations-button assignBuildingBtn" type="button" data-bs-toggle="modal" data-bs-target="#assignModal">' +
                    '<i class="fas fa-user-plus" style="color: blue;"></i>' +
                    '</button>' +
                    '</td>';
                row += '</tr>';
            });
            $('#buildingList tbody').html(row); // replace 'resultsTable' with the id of your table
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert('search failed');
            console.log('apply failed');
            console.log('Status: ' + jqXHR.status); // HTTP status code
            console.log('Error: ' + textStatus); // Type of error
            console.log('Exception: ' + errorThrown); // Exception thrown by the error
            console.log('Response text: ' + jqXHR.responseText); // Complete response from the server
        }
    });
}


