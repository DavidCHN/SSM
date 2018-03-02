package com.bkvito.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bkvito.crud.bean.Msg;
import com.bkvito.crud.bean.Person;
import com.bkvito.crud.service.PersonService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class PersonController {

	@Autowired
	PersonService personService;
	
	@RequestMapping(value="/persons",method=RequestMethod.POST)
	@ResponseBody
	public Msg savePersons(Person person){
		personService.savePersons(person);
		return Msg.success();
	}
	
	@RequestMapping("/persons")
	@ResponseBody
	public Msg getPersonWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 12);

		List<Person> persons = personService.getAll();

		PageInfo<Person> pageInfo = new PageInfo<Person>(persons, 5);

		return Msg.success().add("pageInfo", pageInfo);
	}
	
	@RequestMapping("/checkuser")
	@ResponseBody
	public Msg checkUser(@RequestParam("personName")String personName){
		
		boolean b=personService.checkUser(personName);
		if(b){
			return Msg.success();
		}else {
			return Msg.fail();
		}
	
		
	}

	// @RequestMapping("/persons")
	public String getPerson(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {

		PageHelper.startPage(pn, 12);

		List<Person> persons = personService.getAll();

		PageInfo<Person> pageInfo = new PageInfo<Person>(persons, 5);
		model.addAttribute("pageInfo", pageInfo);
		return "list";
	}

}
