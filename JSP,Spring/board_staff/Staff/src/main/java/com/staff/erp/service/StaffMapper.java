package com.staff.erp.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StaffMapper {
	
	public List<Map<String, Object>> retrieveList(Map<String, Object> param);
	
	public int insertStaff(Map<String, Object> param);
	
	public int insertSkill(Map<String, Object> param);
	
	public int updateStaff(Map<String, Object> param);
	
	public int deleteStaffSkillAll(Map<String, Object> param);
	
	public Map<String, Object> retrieve(Map<String, Object> param);
	
	public List<Integer> retrieveSkill(Map<String, Object> param);

}
