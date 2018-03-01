package com.bkvito.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkvito.crud.bean.Person;
import com.bkvito.crud.dao.PersonMapper;

@Service
public class PersonService {
	
	@Autowired
	PersonMapper personMapper;
	
	public List<Person> getAll(){
		return personMapper.selectByExampleWithDept(null);
	}

	public void savePersons(Person person) {
		personMapper.insertSelective(person);
		
	}

}
