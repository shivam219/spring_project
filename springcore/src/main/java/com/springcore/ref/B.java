package com.springcore.ref;

public class B {
	private int num2;

	public int getNum2() {
		return num2;
	}

	public void setNum2(int num2) {
		this.num2 = num2;
	}

	public B(int num2) {
		super();
		this.num2 = num2;
	}

	public B() {
		super();
	}

	@Override
	public String toString() {
		return "B [num2=" + num2 + "]";
	}

}
