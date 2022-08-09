package com.springcore.ref;

public class A {
	private int num;
	private B ob;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public B getOb() {
		return ob;
	}

	public void setOb(B ob) {
		this.ob = ob;
	}

	public A(int num, B ob) {
		super();
		this.num = num;
		this.ob = ob;
	}

	public A() {
		super();
	}

	@Override
	public String toString() {
		return "A [num=" + num + ", ob=" + ob + "]";
	}

}
