package com.javaweb.controller.admin;

import com.javaweb.enums.DistrictCode;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.IBuildingService;
import com.javaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {

    @Autowired
    IUserService userService;
    @Autowired
    IBuildingService buildingService;
    @GetMapping(value="/admin/building-list")
    public ModelAndView buildingList(@ModelAttribute("searchBuilding") BuildingSearchRequest buildingSearchRequest, BindingResult bindingResult) {
        Logger logger = LoggerFactory.getLogger(this.getClass());
        if (bindingResult.hasErrors()) {
            for (FieldError error : bindingResult.getFieldErrors()) {
                logger.error(error.getField() + ": " + error.getDefaultMessage());
            }
        }

        ModelAndView mav = new ModelAndView("admin/building/list");
        mav.addObject("staffs", userService.getStaffs());
        mav.addObject("districts", DistrictCode.getDistricts());
        mav.addObject("typeCodes", TypeCode.getTypeCodes());
        return mav;
    }

    @GetMapping(value="/admin/add-edit-building")
    public ModelAndView addOrEditBuilding(@ModelAttribute("addOrEditBuilding") BuildingDTO buildingDTO) {
        ModelAndView mav = new ModelAndView("admin/building/add-edit");
        mav.addObject("districts", DistrictCode.getDistricts());
        mav.addObject("typeCodes", TypeCode.getTypeCodes());
        return mav;
    }
    @GetMapping(value="/admin/add-edit-building/{buildingId}")
    public ModelAndView addOrEditBuilding(@PathVariable("buildingId") Long buildingId) {

        ModelAndView mav = new ModelAndView("admin/building/add-edit");
        BuildingDTO buildingDTO = (BuildingDTO) buildingService.getBuildingById(buildingId).getData();
        mav.addObject("addOrEditBuilding", buildingDTO);
        mav.addObject("districts", DistrictCode.getDistricts());
        mav.addObject("typeCodes", TypeCode.getTypeCodes());
        return mav;
    }
}
