package com.staff.erp.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.staff.erp.service.StaffMapper;
import com.staff.erp.service.StaffService;

@Controller
@RequestMapping("/staff")
public class StaffController {
	
	@Autowired
	private StaffService staffService;
	
	@Autowired
	private StaffMapper staffMapper;
	
	/**
	 * @Description 게시판 화면 호출
	 */
	@GetMapping("/staffSearchForm.do")
	public String staffSearchForm(Model model) {
		
		List<Map<String, Object>> List = staffMapper.retrieveList();
		model.addAttribute("staff",List);
		
		return "staff_search_form";
	}
	
	/**
	 * @Description 등록 화면 호출
	 */
	@GetMapping("/staffInputForm.do")
	public String staffInputForm(Model model) {
		
		return "staff_input_form";
	}
	
	/**
	 * @Description ajax 등록
	 */
	@PostMapping("/ajaxInsert.do")
	@ResponseBody
	public int ajaxInsert(@RequestParam Map<String, Object> param) {
		int i = staffService.ajaxInsert(param);
		return i;
		
	}
	
	

}