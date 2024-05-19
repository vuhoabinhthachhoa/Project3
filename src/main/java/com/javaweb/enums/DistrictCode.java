package com.javaweb.enums;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

public enum DistrictCode {
    QUAN_1("Quận 1"),
    QUAN_2("Quận 2"),
    QUAN_3("Quận 3"),
    QUAN_4("Quận 4"),
    QUAN_5("Quận 5"),
    QUAN_6("Quận 6"),
    QUAN_7("Quận 7"),
    QUAN_8("Quận 8"),
    QUAN_9("Quận 9"),
    QUAN_10("Quận 10"),
    QUAN_TB("Quận Tân Bình");

    private final String districtName;
    DistrictCode(String districtName) {
        this.districtName = districtName;
    }
    public String getDistrictName() {
        return districtName;
    }
    public static Map<String, String> getDistricts() {
        Map<String, String> districts = new LinkedHashMap<>();
        for(DistrictCode item : DistrictCode.values()) {
            districts.put(item.name(), item.getDistrictName());
        }
        return districts;
    }
}
