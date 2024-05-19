package com.javaweb.model.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class StaffResponseDTO {
    private String fullName;
    private Long staffId;
    private String checked;
}
