package com.javaweb.repository.custom.impl;

import java.lang.reflect.Field;
import java.util.List;
import java.util.StringJoiner;

import org.springframework.stereotype.Repository;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import com.javaweb.utils.IsExistingParamUtils;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    void joinWithTables(BuildingSearchBuilder builder, StringBuilder query) {

        if (IsExistingParamUtils.isExistingObjectParam(builder.getRentAreaFrom())
                || IsExistingParamUtils.isExistingObjectParam(builder.getRentAreaTo())) {
            query.append(" JOIN rentarea ra ON ra.buildingid=b.id ");
        }
        if (IsExistingParamUtils.isExistingObjectParam(builder.getStaffId())) {
            query.append(" JOIN assignmentbuilding ab ON ab.buildingid=b.id ");
        }
    }

    void selectConditions(BuildingSearchBuilder builder, StringBuilder query) {
        query.append(" WHERE 1=1 ");

        try {
            Field[] fields = BuildingSearchBuilder.class.getDeclaredFields();
            for(Field item : fields) {
                item.setAccessible(true);
                Object obj = item.get(builder);
                String key = item.getName();


                if (key.equals("rentAreaFrom")) {

                    if (IsExistingParamUtils.isExistingObjectParam(obj)) {
                        query.append(" AND ra.value >= " + obj);
                    }
                }
                if (key.equals("rentAreaTo")) {
                    if (IsExistingParamUtils.isExistingObjectParam(obj)) {
                        query.append(" AND ra.value <= " + obj);
                    }
                }
                if (key.equals("staffId")) {

                    if (IsExistingParamUtils.isExistingObjectParam(obj)) {
                        query.append(" AND ab.staffid = " + obj);
                    }
                }
                if (key.equals("rentPriceFrom")) {

                    if (IsExistingParamUtils.isExistingObjectParam(obj)) {
                        query.append(" AND b.rentprice >= " + obj);
                    }
                }
                if (key.equals("rentPriceTo")) {

                    if (IsExistingParamUtils.isExistingObjectParam(obj)) {
                        query.append(" AND b.rentprice <= " + obj);
                    }
                }

                if (!key.equals("rentAreaFrom") && !key.equals("rentAreaTo")
                        && !key.equals("staffId") && !key.equals("rentPriceFrom")
                        && !key.equals("rentPriceTo") && !key.equals("typeCode")) {

                    if (IsExistingParamUtils.isExistingObjectParam(obj)) {
                        if (obj instanceof Long) {
                            query.append(" AND b." + key.toLowerCase() + " = " + obj);
                        } else {
                            query.append(" AND b." + key.toLowerCase() + " LIKE '%" + obj + "%'");
                        }
                    }
                }

                if(key.equals("typeCode")) {
                    List<String> typeCode = (List<String>) obj;
                    if (IsExistingParamUtils.isExistingListParam(typeCode)) {
                        for (String codeName : typeCode) {
                            query.append(" AND b.type LIKE '%").append(codeName).append("%'");
                        }

                    }
                }

            }

        }
        catch(Exception ex) {
            ex.printStackTrace();
        }

    }

    @SuppressWarnings("unchecked")
    @Override
    public List<BuildingEntity> findBuildings(BuildingSearchBuilder builder) {

        StringBuilder sql = new StringBuilder();
        sql.append("SELECT DISTINCT b.* FROM building b");

        joinWithTables(builder, sql);
        selectConditions(builder, sql);

        // check query
        System.out.println(sql.toString());

        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);

        return query.getResultList();
    }
}



