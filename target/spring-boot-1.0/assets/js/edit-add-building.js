// collect data whenever the user clicks on the addOrUpdateBuilding button
// and send it to the server
$('#addBuildingBtn').click(function(e) {
    e.preventDefault();
    var data = {};
    var formData = $('#addOrEditForm').serializeArray();
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
    addBuilding(data);
});

$('#updateBuildingBtn').click(function(e) {
    e.preventDefault(); // to avoid submitting the form (reload the page)
    var data = {};
    var formData = $('#addOrEditForm').serializeArray();
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
    data['id'] = $('#building-id').val(); // get the building id from the hidden input field
    updateBuilding(data);
});
