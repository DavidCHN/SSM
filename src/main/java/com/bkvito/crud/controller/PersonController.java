package com.bkvito.crud.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
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
	public Msg savePersons(@Valid Person person,BindingResult result){
		
		if(result.hasErrors()){
			Map<String, Object> map=new HashMap<>();
			List<FieldError> errors= result.getFieldErrors();
			for(FieldError error:errors){
				map.put(error.getField(), error.getDefaultMessage());
			}
			return Msg.fail().add("errorField", map);
		}else{
			personService.savePersons(person);
			return Msg.success();
		}
		
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
		
		String regex="(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
		if(!personName.matches(regex)){
			return Msg.fail().add("va_msg", "用户名必须是6-16位英文数字组合或2-5位中文");
		}
		boolean b=personService.checkUser(personName);
		if(b){
			return Msg.success();
		}else {
			return Msg.fail().add("va_msg", "用户名已使用，请重新输入");
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
	
	@ResponseBody
	@RequestMapping(value="/emp/{id}",method=RequestMethod.PUT)
	public Msg saveEmp(@Valid Person person,HttpServletRequest request){
		System.out.println(person);
		personService.updateEmp(person);
		return Msg.success()	;
	}
	
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("id")Integer id){
		
		Person person = personService.getEmp(id);
		return Msg.success().add("emp", person);
	}

}
