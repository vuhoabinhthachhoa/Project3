package com.javaweb.enums;

import java.util.LinkedHashMap;
import java.util.Map;

public enum TypeCode {
    NOI_THAT("Nội thất"),
    TANG_TRET("Tầng trệt"),
    NGUYEN_CAN("Nguyên căn");

    private final String typeName;
    TypeCode(String typeName) {
        this.typeName = typeName;
    }
    String getTypeName() {
        return this.typeName;
    }

    public static Map<String, String> getTypeCodes() {
        Map<String, String> typeCodes = new LinkedHashMap<>();
        for(TypeCode item : TypeCode.values()) {
            typeCodes.put(item.toString(), item.getTypeName());
        }
        return typeCodes;
    }
}
