package com.javaweb.converter;

import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.LinkedList;
import java.util.List;

@Component
public class AssignmentBuildingConverter {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private UserRepository userRepository;
    public List<AssignmentBuildingEntity> convertToEntities(AssignmentBuildingDTO assignmentBuildingDTO) {
        List<AssignmentBuildingEntity> assignmentBuildingEntities = new LinkedList<>();
        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
        for (Long staffId : assignmentBuildingDTO.getStaffs()) {
            AssignmentBuildingEntity assignmentBuildingEntity = new AssignmentBuildingEntity();
            UserEntity userEntity = userRepository.getOne(staffId);
            assignmentBuildingEntity.setStaff(userEntity);
            assignmentBuildingEntity.setBuilding(buildingEntity);
            assignmentBuildingEntities.add(assignmentBuildingEntity);
        }
        return assignmentBuildingEntities;
    }
}
