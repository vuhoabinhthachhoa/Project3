package com.javaweb.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AbstractDTO<T> implements Serializable {
    private static final long serialVersionUID = 7213600440729202783L;

    private Long id;
    private String createdDate;
    private String createdBy;
    private String modifiedDate;
    private String modifiedBy;
    private int maxPageItems = 2;
    private int page = 1;
    private List<T> listResult = new ArrayList<>();
    private int totalItems = 0;
    private String tableId = "tableList";
    private Integer limit;
    private Integer totalPage;
    private Integer totalItem;
    private String searchValue;
}
