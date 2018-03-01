package com.bkvito.crud.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.bkvito.crud.bean.Person;
import com.github.pagehelper.PageInfo;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "classpath:applicationContext.xml",
		"file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml" })
public class MVCTest {

	@Autowired
	WebApplicationContext context;
	MockMvc mockMvc;

	@Before
	public void initMockMvc() {

		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();

	}

	@Test
	public void pageTest() throws Exception {
		MvcResult mResult = mockMvc.perform(MockMvcRequestBuilders.get("/persons").param("pn", "1")).andReturn();
		
		MockHttpServletRequest request=mResult.getRequest();
		
		PageInfo<Person> pInfo=(PageInfo<Person>) request.getAttribute("pageInfo");
		
		
		List<Person> persons=pInfo.getList();
		
		for(Person p:persons){
			System.out.println(p.getId());
			System.out.println(p.getAge());
			System.out.println(p.getDepartment());
			System.out.println(p.getAddress());
		}
		
	}

}
