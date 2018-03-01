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
//		departmentMapper.insertSelective(new Department(null, "�����", "��ˮǧɽ������"));
//		departmentMapper.insertSelective(new Department(null, "���Բ�", "Ȱ������һ����"));
//		departmentMapper.insertSelective(new Department(null, "����", "���������޹���"));
//		departmentMapper.insertSelective(new Department(null, "���²�", "���Ű���̤����"));
		departmentMapper.insertSelective(new Department(null, "��Ŀ��", "��ɽҹ�������"));
		
		//personMapper.insertSelective(new Person(null, "����", 25, "changjiang@qq.com", "�����г�����", "F", "��", 6));
		//personMapper.insertSelective(new Person(null, "�ƺ�",30, "huanghe@qq.com", "�Ͼ��г�����110��", "M", "��", 8));
		//PersonMapper personMapper= sqlSession.getMapper(PersonMapper.class);
		
		/*for(int i=0;i<1000;i++){
			String uuid=UUID.randomUUID().toString().substring(0, 5)+i;
			personMapper.insertSelective(new Person(null, uuid, 20, uuid+"@qq.com", uuid+i+"��", "F", "��", 10));
		}
		System.out.println("�����������");*/
		
	
		
	}

}
