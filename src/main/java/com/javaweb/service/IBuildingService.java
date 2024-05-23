package com.javaweb.service;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@Service
public interface IBuildingService {
    public ResponseDTO findBuildings(Map<String, Object> params, List<String> typeCode);
    public ResponseDTO getBuildingById(Long buildingId);
    public ResponseDTO getStaffs(Long buildingId);
    public void addBuilding(BuildingDTO buildingDTO) throws IOException;
    public void updateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO);
    public void updateBuilding(BuildingDTO buildingDTO);
    public void deleteBuildings(List<Long> buildingIds);
}
