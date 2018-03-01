package com.bkvito.crud.bean;

public class Department {
    private Integer id;

    private String name;

    private String manager;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Department() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Department(Integer id, String name, String manager) {
		super();
		this.id = id;
		this.name = name;
		this.manager = manager;
	}

	@Override
	public String toString() {
		return "Department [id=" + id + ", name=" + name + ", manager=" + manager + "]";
	}

	public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager == null ? null : manager.trim();
    }
}