package com.bkvito.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkvito.crud.bean.Department;
import com.bkvito.crud.dao.DepartmentMapper;

@Service
public class DepartmentService {
	@Autowired
	private DepartmentMapper departmentMapper;

	public List<Department> getDepts() {
		List<Department> list=departmentMapper.selectByExample(null);
		return list;
	}
	
	

}
