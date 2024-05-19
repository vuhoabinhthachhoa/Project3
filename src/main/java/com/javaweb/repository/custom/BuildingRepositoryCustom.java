package com.javaweb.repository.custom;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BuildingRepositoryCustom {
    public List<BuildingEntity> findBuildings(BuildingSearchBuilder builder);
}
