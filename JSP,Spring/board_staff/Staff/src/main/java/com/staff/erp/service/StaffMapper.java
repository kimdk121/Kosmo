package com.staff.erp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StaffMapper {
	
	public List<Map<String, Object>> retrieveList();
	
	public int insertStaff(Map<String, Object> param);
	
	public int insertSkill(Map<String, Object> param);
	
	public int selectStaffNo(Map<String, Object> param);
	
	

}