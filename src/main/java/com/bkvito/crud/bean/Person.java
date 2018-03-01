package com.bkvito.crud.bean;

public class Person {
    private Integer id;

    private String name;

    private Integer age;

    private String email;

    private String address;

    private String gender;

    private String marry;

    private Integer jobId;
    
    private Department department;
    

    public Person() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Person(Integer id, String name, Integer age, String email, String address, String gender, String marry,
			Integer jobId) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.email = email;
		this.address = address;
		this.gender = gender;
		this.marry = marry;
		this.jobId = jobId;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getMarry() {
        return marry;
    }

    public void setMarry(String marry) {
        this.marry = marry == null ? null : marry.trim();
    }

    public Integer getJobId() {
        return jobId;
    }

    public void setJobId(Integer jobId) {
        this.jobId = jobId;
    }
}