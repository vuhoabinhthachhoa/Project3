package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.DistrictCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

@Component
public class BuildingConverter {
    @Autowired
    private ModelMapper molMapper;

    String convertRentAreasToString(List<RentAreaEntity> rentAreas) {
        if (rentAreas.isEmpty()) {
            return "";
        }

        List<String> values = new ArrayList<>();
        for (RentAreaEntity rentArea : rentAreas) {
            values.add(rentArea.getValue().toString());
        }

        // delete the redundant , at the end of the string
        String result =  String.join(", ", values);
        if(!result.isEmpty()) {
            result = result.substring(0, result.length() - 1);
        }
        return result;
    }
    public BuildingSearchResponse convertToResponse(BuildingEntity buildingEntity) {
        BuildingSearchResponse buildingSearchResponse = molMapper.map(buildingEntity, BuildingSearchResponse.class);
        String address = "";
        // avoid print this address "null, null, null'
        if(buildingEntity.getStreet() != null && !buildingEntity.getStreet().isEmpty()) {
            address += buildingEntity.getStreet() + ", ";
        }
        if(buildingEntity.getWard() != null && !buildingEntity.getWard().isEmpty()) {
            address += buildingEntity.getWard() + ", ";
        }
        if(buildingEntity.getDistrict() != null && !buildingEntity.getDistrict().isEmpty()) {
            address += DistrictCode.getDistricts().get(buildingEntity.getDistrict());
        }
        buildingSearchResponse.setAddress(address);
        buildingSearchResponse.setRentArea(convertRentAreasToString(buildingEntity.getRentAreas()));
        return buildingSearchResponse;
    }

    public BuildingEntity convertToEntity(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity =  molMapper.map(buildingDTO, BuildingEntity.class);
        //join string with , from typeCode in buildingDTO
        buildingEntity.setType(String.join(",", buildingDTO.getTypeCode()));

        if(buildingDTO.getRentArea().equals("")) {
            return buildingEntity;
        }

        List<Long>rentAreas = new ArrayList<>();
        String[] rentAreaArray = buildingDTO.getRentArea().split(",");

        for(String rentArea : rentAreaArray) {
            rentAreas.add(Long.parseLong(rentArea.trim()));
        }

        List<RentAreaEntity> rentAreaEntities = new LinkedList<>();
        for(Long rentArea : rentAreas) {
            RentAreaEntity rentAreaEntity = new RentAreaEntity();
            rentAreaEntity.setValue(rentArea);
            rentAreaEntity.setBuilding(buildingEntity);
            rentAreaEntities.add(rentAreaEntity);
        }
        buildingEntity.setRentAreas(rentAreaEntities);

        return buildingEntity;
    }

    public BuildingDTO convertToDTO(BuildingEntity buildingEntity) {
        BuildingDTO buildingDTO = molMapper.map(buildingEntity, BuildingDTO.class);
         // split string with , from type in buildingEntity
        List<String> typeCodes = Arrays.asList(buildingEntity.getType().split(","));
        buildingDTO.setTypeCode(typeCodes);

        // convert rentAreas to string
        buildingDTO.setRentArea(convertRentAreasToString(buildingEntity.getRentAreas()));
        return buildingDTO;
    }
}
