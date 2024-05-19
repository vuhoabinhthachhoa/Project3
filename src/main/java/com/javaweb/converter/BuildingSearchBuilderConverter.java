package com.javaweb.converter;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.utils.MapUtils;

@Component
public class BuildingSearchBuilderConverter {
    public BuildingSearchBuilder toBuildingSearchBuilder(Map<String, Object> params, List<String> typeCode) {

        // another way
//    	BuildingSearchBuilder.Builder builder1 = new BuildingSearchBuilder.Builder();
//    	BuildingSearchBuilder builder = builder1.setName(), ...

        BuildingSearchBuilder builder = new BuildingSearchBuilder.Builder()
                .setName(MapUtils.getObject(params, "name", String.class))
                .setStreet(MapUtils.getObject(params, "street", String.class))
                .setWard(MapUtils.getObject(params, "ward", String.class))
                .setDistrict(MapUtils.getObject(params, "district", String.class))
                .setNumberOfBasement(MapUtils.getObject(params, "numberOfBasement", Long.class))
                .setFloorArea(MapUtils.getObject(params, "floorArea", Long.class))
                .setDirection(MapUtils.getObject(params, "direction", String.class))
                .setLevel(MapUtils.getObject(params, "level", String.class))
                .setRentPriceFrom(MapUtils.getObject(params, "rentPriceFrom", Long.class))
                .setRentPriceTo(MapUtils.getObject(params, "rentPriceTo", Long.class))
                .setManagerName(MapUtils.getObject(params, "managerName", String.class))
                .setManagerPhoneNumber(MapUtils.getObject(params, "managerPhoneNumber", String.class))
                .setStaffId(MapUtils.getObject(params, "staffId", Long.class))
                .setRentAreaFrom(MapUtils.getObject(params, "rentAreaFrom", Long.class))
                .setRentAreaTo(MapUtils.getObject(params, "rentAreaTo", Long.class))
                .setTypeCode(typeCode)
                .build();
        return builder;
    }
}
