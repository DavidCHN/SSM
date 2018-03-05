package com.bkvito.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bkvito.crud.bean.Person;
import com.bkvito.crud.bean.PersonExample;
import com.bkvito.crud.bean.PersonExample.Criteria;
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

	public boolean checkUser(String personName) {
		PersonExample personExample=new PersonExample();
		Criteria c=personExample.createCriteria();
		c.andNameEqualTo(personName);
		long count=personMapper.countByExample(personExample);
		return count==0;
	}

	public void updateEmp(Person person) {
		personMapper.updateByPrimaryKeySelective(person);
		
	}

	public Person getEmp(Integer id) {
		Person person=personMapper.selectByPrimaryKey(id);
		return person;
	}

	public void deleteEmp(Integer id) {
		personMapper.deleteByPrimaryKey(id);
		
	}

}
