package com.javaweb.service.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.converter.AssignmentBuildingConverter;
import com.javaweb.converter.BuildingConverter;
import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.service.IBuildingService;
import com.javaweb.service.IUserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class BuildingService implements IBuildingService {

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private BuildingConverter buildingConverter;

    @Autowired
    private BuildingSearchBuilderConverter buildingSearchBuilderConverter;

    @Autowired
    private RentAreaRepository rentAreaRepository;

    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;

    @Autowired
    private AssignmentBuildingConverter assignmentBuildingConverter;

    @Autowired
    private IUserService iUserService;

    @Autowired
    private ModelMapper modelMapper;

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public ResponseDTO findBuildings(Map<String, Object> params, List<String> typeCode) {
        BuildingSearchBuilder builder = buildingSearchBuilderConverter.toBuildingSearchBuilder(params, typeCode);
        List<BuildingEntity> receivedData = buildingRepository.findBuildings(builder);

        List<BuildingSearchResponse> data = new ArrayList<BuildingSearchResponse>();
        for(BuildingEntity it : receivedData) {
            data.add(buildingConverter.convertToResponse(it));
        }

        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setData(data);
        responseDTO.setMessage("Success");

        return responseDTO;
    }

    @Override
    public ResponseDTO getBuildingById(Long buildingId) {
        BuildingEntity buildingEntity = buildingRepository.findById(buildingId).get();
        BuildingDTO buildingDTO = buildingConverter.convertToDTO(buildingEntity);
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setData(buildingDTO);
        responseDTO.setMessage("Success");
        return responseDTO;
    }

    @Transactional
    @Override
    public void addBuilding(BuildingDTO buildingDTO) {
        // we have to add building before adding corresponding rentareas and vice versa
        // delete rentareas after deleting building
        BuildingEntity buildingEntity = buildingConverter.convertToEntity(buildingDTO);
        rentAreaRepository.saveAll(buildingEntity.getRentAreas());
        buildingRepository.save(buildingEntity); // save: if there is id in DTO, will update, else there is no id it  will create
    }

    @Transactional
    @Override
    public void deleteBuildings(List<Long> ids) {
        for(Long id : ids) {
            BuildingEntity buildingEntity = buildingRepository.findById(id).get();
            rentAreaRepository.deleteAllByBuilding(buildingEntity);
            assignmentBuildingRepository.deleteAllByBuilding(buildingEntity);
        }
        buildingRepository.deleteByIdIn(ids);
    }

    @Transactional
    @Override
    public void updateBuilding(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = buildingConverter.convertToEntity(buildingDTO);
        // delete all rent areas of the building after updating
        rentAreaRepository.deleteAllByBuilding(buildingEntity);
        rentAreaRepository.saveAll(buildingEntity.getRentAreas());
        buildingRepository.save(buildingEntity);
    }

    @Transactional
    @Override
    public void updateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
        // Step 1: Retrieve the BuildingEntity with the specific id
        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();

        // Step 2: Delete all AssignmentBuildingEntity objects associated with the retrieved BuildingEntity
        assignmentBuildingRepository.deleteAllByBuilding(buildingEntity);

        // Step 3: Add new assignments to the BuildingEntity
        List<AssignmentBuildingEntity> newAssignments = assignmentBuildingConverter.convertToEntities(assignmentBuildingDTO);
        for (AssignmentBuildingEntity assignment : newAssignments) {
            assignmentBuildingRepository.save(assignment);
        }
    }

    @Override
    public ResponseDTO getStaffs(Long buildingId) {
         Map<Long, String> staffs = iUserService.getStaffs();
         List<AssignmentBuildingEntity> assignmentBuildingEntities = assignmentBuildingRepository.findByBuildingId(buildingId);
         List<Long> assignedStaffIds = new ArrayList<>();
         for (AssignmentBuildingEntity assignment : assignmentBuildingEntities) {
             assignedStaffIds.add(assignment.getStaff().getId());
         }

         List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
         for(Map.Entry<Long, String> entry : staffs.entrySet()) {
             StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
             staffResponseDTO.setStaffId(entry.getKey());
             staffResponseDTO.setFullName(entry.getValue());
             if(assignedStaffIds.contains(entry.getKey())) {
                 staffResponseDTO.setChecked("checked");
             } else {
                 staffResponseDTO.setChecked("");
             }
             staffResponseDTOS.add(staffResponseDTO);
         }

        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("Success");
        return responseDTO;
    }
}
