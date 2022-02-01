package com.staff.erp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class StaffService{
	
	@Autowired
	StaffMapper staffMapper;
	
	public int ajaxInsert(Map<String, Object> param) {
		
		// 10이하 숫자에 0 붙임
		int graduate_month = Integer.parseInt(param.get("graduate_month").toString());
		int graduate_day = Integer.parseInt(param.get("graduate_day").toString());
		if(graduate_month <10) {
			param.put("graduate_month", String.format("%02d", graduate_month));
		}
		if(graduate_day <10) {
			param.put("graduate_day",String.format("%02d", graduate_day));
		}
		
		int result = staffMapper.insertStaff(param);
		String[] skillList = param.get("skill_codeList").toString().split(",");
		int staff_no = staffMapper.selectStaffNo(param);
		param.put("staff_no", staff_no);
		for(String i : skillList) {
			param.put("skill_code", i);
			staffMapper.insertSkill(param);
		}
		return result;
	}
	
	public int ajaxUpdate(Map<String, Object> param) {
		
		// 10이하 숫자에 0 붙임
		int graduate_month = Integer.parseInt(param.get("graduate_month").toString());
		int graduate_day = Integer.parseInt(param.get("graduate_day").toString());
		if(graduate_month <10) {
			param.put("graduate_month", String.format("%02d", graduate_month));
		}
		if(graduate_day <10) {
			param.put("graduate_day",String.format("%02d", graduate_day));
		}
		
		int result = staffMapper.updateStaff(param);
		String[] skillList = param.get("skill_codeList").toString().split(",");
		int staff_no = staffMapper.selectStaffNo(param);
		param.put("staff_no", staff_no);
		staffMapper.deleteStaffSkillAll(param);
		for(String i : skillList) {
			param.put("skill_code", i);
			staffMapper.insertSkill(param);
		}
		return result;
	}
	
	public Map<String, Object> updelPage(Map<String, Object> param){
		Map<String, Object> personData = staffMapper.retrieve(param);
		String[] jumin_no = personData.get("jumin_no").toString().split("-");
		String jumin_no1 = jumin_no[0];
		String jumin_no2 = jumin_no[1];
		String[] graduate_date = personData.get("graduate_day").toString().split("-");
		String graduate_year = graduate_date[0];
		String graduate_month = graduate_date[1];
		String graduate_day = graduate_date[2];
		
		List<Integer> skillData = staffMapper.retrieveSkill(param);
		personData.put("jumin_no1", jumin_no1);
		personData.put("jumin_no2", jumin_no2);
		personData.put("graduate_year", graduate_year);
		personData.put("graduate_month", graduate_month);
		personData.put("graduate_day", graduate_day);
		personData.put("skillData", skillData);
		return personData;
	}
	
}
