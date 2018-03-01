package com.bkvito.crud.test;

import static org.junit.Assert.fail;

import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bkvito.crud.bean.Department;
import com.bkvito.crud.bean.Person;
import com.bkvito.crud.bean.PersonExample;
import com.bkvito.crud.dao.DepartmentMapper;
import com.bkvito.crud.dao.PersonMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {
	
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	PersonMapper personMapper;
	@Autowired
	SqlSession sqlSession;

	@Test
	public void test() {
		fail("Not yet implemented");
	}
	
	@Test
	public void testCRUD(){
		
		System.out.println(personMapper);
//		departmentMapper.insertSelective(new Department(null, "软件部", "万水千山总是情"));
//		departmentMapper.insertSelective(new Department(null, "测试部", "劝君更尽一杯酒"));
//		departmentMapper.insertSelective(new Department(null, "财务部", "西出阳关无故人"));
//		departmentMapper.insertSelective(new Department(null, "人事部", "忽闻岸上踏歌声"));
		departmentMapper.insertSelective(new Department(null, "项目部", "巴山夜雨涨秋池"));
		
		//personMapper.insertSelective(new Person(null, "长江", 25, "changjiang@qq.com", "北京市朝阳区", "F", "是", 6));
		//personMapper.insertSelective(new Person(null, "黄河",30, "huanghe@qq.com", "南京市朝阳区110号", "M", "否", 8));
		//PersonMapper personMapper= sqlSession.getMapper(PersonMapper.class);
		
		/*for(int i=0;i<1000;i++){
			String uuid=UUID.randomUUID().toString().substring(0, 5)+i;
			personMapper.insertSelective(new Person(null, uuid, 20, uuid+"@qq.com", uuid+i+"号", "F", "否", 10));
		}
		System.out.println("批量插入完成");*/
		
	
		
	}

}
