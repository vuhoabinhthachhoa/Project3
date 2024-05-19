$(document).on('click', '.assignBuildingBtn', function(e) {
    e.preventDefault();
    var buildingId = $(this).closest('tr').data('building-id');
    $('#buildingId').val(buildingId);
    loadStaffs(buildingId);
});

$('#modalAssignBuildingBtn').click(function(e) {
    e.preventDefault();
    var data  = {};
    data['buildingId'] = $('#buildingId').val();
    var staffIds = $('#staffList').find('tbody input[type="checkbox"]:checked').map(function() {
        return $(this).val();
    }).get();
    data['staffs'] = staffIds;
    updateAssignmentBuilding(data);
});

var deleteBuildingBtns = $('.deleteBuildingBtn');
console.log(deleteBuildingBtns);
$(document).on('click', '.deleteBuildingBtn', function(e) {
    e.preventDefault();
    var buildingId = [];
    buildingId.push($(this).closest('tr').data('building-id'));
    deleteBuilding(buildingId);
});

$('#deleteSelectedBuildingBtn').click(function(e) {
    e.preventDefault();
    var buildingIds = $('#buildingList').find('tbody input[type="checkbox"]:checked').map(function() {
        return $(this).val();
    }).get();
    deleteBuilding(buildingIds);
});

$('#searchBuildingBtn').click(function(e) {
   e.preventDefault();
   // $('#searchForm').submit();

    var data = {};
    var formData = $('#searchForm').serializeArray();
    var typeCode = [];
    $.each(formData, function(i, v) {
        if(v.name === 'typeCode') {
            typeCode.push(v.value);
        }
        else {
            data[v.name] = v.value;
        }

    });
    data['typeCode'] = typeCode;
    // remove _typeCode field from the data object
    // because it is a hidden filed genetated by spring form and it will make the search fail
    delete data['_typeCode'];

    searchBuilding(data);
});




