package com.javaweb.controller.admin;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {
    @GetMapping(value="/admin/building-list")
    public ModelAndView buildingList() {
        return new ModelAndView("admin/building/list");
    }

}
