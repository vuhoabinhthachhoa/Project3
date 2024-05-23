package com.javaweb.api.admin;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.service.IBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/buildings")
public class BuildingAPI {
    @Autowired
    private IBuildingService buildingService;
    @GetMapping
    public ResponseDTO findBuilding(@RequestParam Map<String, Object> params,
                                       @RequestParam(value = "typeCode", required = false) List<String> typeCode) {
        ResponseDTO result = buildingService.findBuildings(params, typeCode);
        return result;
    }

    @GetMapping("/{buildingId}")
    public ResponseDTO getBuildingById(@PathVariable Long buildingId) {
        ResponseDTO result = buildingService.getBuildingById(buildingId);
        return result;
    }
    @GetMapping("/{buildingId}/staffs")
    public ResponseDTO getStaffs(@PathVariable Long buildingId) {
        ResponseDTO result = buildingService.getStaffs(buildingId);
        return result;
    }

    @PostMapping // data received will be in JSON Object
    public String addBuilding(@RequestBody BuildingDTO buildingDTO) throws IOException {
        buildingService.addBuilding(buildingDTO);
        return "Add building successfully";
    }

//    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
//    public String addBuilding(@RequestPart("building") BuildingDTO buildingDTO, @RequestPart("avatar") MultipartFile avatar) throws IOException {
//        // handle the avatar file...
//        buildingDTO.setAvatar(avatar);
//        buildingService.addBuilding(buildingDTO);
//        return "Add building successfully";
//    }

    @PutMapping("/assignment") // data received will be in JSON Object
    public String updateAssignmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO) {
        buildingService.updateAssignmentBuilding(assignmentBuildingDTO);
        return "Update assignment building successfully";
    }

    @PutMapping
    public String updateBuilding(@RequestBody BuildingDTO buildingDTO) {
        buildingService.updateBuilding(buildingDTO);
        return "Upadate building successfully";
    }

    @DeleteMapping // data received will be in JSON array
    public String deleteBuildings(@RequestBody List<Long> buildingIds) {
        buildingService.deleteBuildings(buildingIds);
        return "Delete building successfully";
    }
}
