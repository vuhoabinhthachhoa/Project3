package com.javaweb.service.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.converter.BuildingConverter;
import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.IBuildingService;
import com.javaweb.service.IUserService;
import com.javaweb.utils.UploadFileUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.io.File;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
    private UserRepository userRepository;

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
        buildingEntity.getRentAreas().size(); // Access the rentAreas to load them
        BuildingDTO buildingDTO = buildingConverter.convertToDTO(buildingEntity);
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setData(buildingDTO);
        responseDTO.setMessage("Success");
        return responseDTO;
    }

    @Transactional
    @Override
    public void addBuilding(BuildingDTO buildingDTO) {
        // Convert the DTO to entity
        BuildingEntity buildingEntity = buildingConverter.convertToEntity(buildingDTO);

//        rentAreaRepository.saveAll(buildingEntity.getRentAreas());

        // Save the building entity. The associated RentAreaEntity objects will be automatically saved due to CascadeType.ALL
        BuildingEntity savedBuilding = buildingRepository.save(buildingEntity);

        // Save the thumbnail
        saveThumbnail(buildingDTO, savedBuilding);
    }

    @Transactional
    @Override
    public void updateBuilding(BuildingDTO buildingDTO) {
        // Convert the DTO to entity
        BuildingEntity buildingEntity = buildingConverter.convertToEntity(buildingDTO);

        // we need to delete all existing associated rentarea entities manually
        rentAreaRepository.deleteAllByBuilding(buildingEntity);

        // Save the building entity. The associated RentAreaEntity objects will be automatically saved due to CascadeType.ALL
        BuildingEntity savedBuilding = buildingRepository.save(buildingEntity);

        // Save the thumbnail
        saveThumbnail(buildingDTO, savedBuilding);
    }

    @Transactional
    @Override
    public void deleteBuildings(List<Long> ids) {
//        for(Long id : ids) {
//            BuildingEntity buildingEntity = buildingRepository.findById(id).get();
//            rentAreaRepository.deleteAllByBuilding(buildingEntity);
//            assignmentBuildingRepository.deleteAllByBuilding(buildingEntity);
//        }
        buildingRepository.deleteByIdIn(ids);
    }


    @Transactional
    @Override
    public void updateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
//        // Step 1: Retrieve the BuildingEntity with the specific id
//        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
//
//        // Step 2: Delete all AssignmentBuildingEntity objects associated with the retrieved BuildingEntity
//        assignmentBuildingRepository.deleteAllByBuilding(buildingEntity);
//
//        // Step 3: Add new assignments to the BuildingEntity
//        List<AssignmentBuildingEntity> newAssignments = assignmentBuildingConverter.convertToEntities(assignmentBuildingDTO);
//        for (AssignmentBuildingEntity assignment : newAssignments) {
//            assignmentBuildingRepository.save(assignment);
//        }

        // Step 1: Retrieve the BuildingEntity with the specific id
        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();

        // Step 2: Clear all existing assignments, clear only in buildingEntity object but not in database
        buildingEntity.getStaffs().clear();

        List<UserEntity> staffs = new ArrayList<>();
        for(Long staffId : assignmentBuildingDTO.getStaffs()) {
            UserEntity staff = userRepository.findById(staffId).get();
            staffs.add(staff);
        }

        // Step 3: Add new assignments to the BuildingEntity, in object only but not database
        buildingEntity.getStaffs().addAll(staffs);

        // Step 4: Save the updated BuildingEntity
        buildingRepository.save(buildingEntity);
    }

    @Override
    public ResponseDTO getStaffs(Long buildingId) {
         Map<Long, String> staffs = iUserService.getStaffs();
//         List<AssignmentBuildingEntity> assignmentBuildingEntities = assignmentBuildingRepository.findByBuildingId(buildingId);
//         List<Long> assignedStaffIds = new ArrayList<>();
//         for (AssignmentBuildingEntity assignment : assignmentBuildingEntities) {
//             assignedStaffIds.add(assignment.getStaff().getId());
//         }
        BuildingEntity buildingEntity = buildingRepository.findById(buildingId).get();
        Set<UserEntity> assignedStaffs = buildingEntity.getStaffs();
        List<Long> assignedStaffIds = new ArrayList<>();
        for(UserEntity staff : assignedStaffs) {
            assignedStaffIds.add(staff.getId());
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

    private void saveThumbnail(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
        String path = "/building/" + buildingDTO.getAvatarName();
        if (null != buildingDTO.getAvatarBase64()) {
            if (null != buildingEntity.getAvatar()) {
                if (!path.equals(buildingEntity.getAvatar())) {
                    File file = new File("C://home/office" + buildingEntity.getAvatar());
                    file.delete();
                }
            }
            byte[] bytes = Base64.decodeBase64(buildingDTO.getAvatarBase64().getBytes());
            UploadFileUtils.writeOrUpdate(path, bytes);
            buildingEntity.setAvatar(path);
        }
    }
}
