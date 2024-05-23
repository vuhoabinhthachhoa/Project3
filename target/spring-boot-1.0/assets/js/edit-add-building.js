// collect data whenever the user clicks on the addOrUpdateBuilding button
// and send it to the server
// $('#addBuildingBtn').click(function(e) {
//     e.preventDefault();
//     var formData = new FormData();
//     var typeCode = [];
//     var data = {};
//     $.each($('#addOrEditForm').serializeArray(), function(i, v) {
//         if(v.name === 'typeCode') {
//             typeCode.push(v.value);
//         }
//         else if (v.name === 'avatar') {
//             formData.append('avatar', $('#avatar')[0].files[0]);
//         }
//     });
//
//     $.each($('#addOrEditForm').serializeArray(), function(i, v) {
//         if(v.name !== 'typeCode' && v.name !== 'avatar') {
//             data[v.name] = v.value;
//         }
//     });
//     data['typeCode'] = typeCode;
//     formData.append('building', new Blob([JSON.stringify(data)], {type: 'application/json'}));
//     formData.append('avatar', $('#avatar')[0].files[0]);
//     addBuilding(formData);
// });

var avatarBase64 = '';
var avatarName = '';
$('#avatar').change(function (event) {
    var reader = new FileReader();
    var file = $(this)[0].files[0];
    reader.onload = function(e){
        avatarBase64 = e.target.result;
        avatarName = file.name; // ten hinh khong dau, khoang cach. Dat theo format sau: a-b-c
    };
    reader.readAsDataURL(file);
    openImage(this, "viewImage");
});

function openImage(input, imageView) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#' +imageView).attr('src', reader.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}


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
    if ('' !== avatarBase64) {
        data['avatarBase64'] = avatarBase64;
        data['avatarName'] = avatarName;
    }
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
    if ('' !== avatarBase64) {
        data['avatarBase64'] = avatarBase64;
        data['avatarName'] = avatarName;
    }
    data['typeCode'] = typeCode;
    data['id'] = $('#building-id').val(); // get the building id from the hidden input field
    updateBuilding(data);
});



