package com.staff.erp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class StaffService{
	
	@Autowired
	StaffMapper staffMapper;
	
	public int ajaxInsert(Map<String, Object> param) {
		
		staffMapper.insertStaff(param);
		String[] skillList = param.get("skill_codeList").toString().split(",");
		int staff_no = staffMapper.selectStaffNo(param);
		param.put("staff_no", staff_no);
		for(String i : skillList) {
			param.put("skill_code", i);
			staffMapper.insertSkill(param);
		}
		return 1;
	}
	
}