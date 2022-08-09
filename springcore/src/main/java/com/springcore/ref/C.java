package com.springcore.ref;

public class C {
	private int no;
	private String name;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public C(int no, String name) {
		super();
		System.out.println("int : String");
		this.no = no;
		this.name = name;
	}

	public C(float no, String name) {
		super();
		System.out.println("float : String");
		this.no = (int) no;
		this.name = name;
	}

	@Override
	public String toString() {
		return "C [no=" + no + ", name=" + name + "]";
	}

}
