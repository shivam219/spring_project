package com.springcore.ref;

public class AA {
	int i;
	BB ob;

	public AA() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AA(int i, BB ob) {
		super();
		this.i = i;
		this.ob = ob;
	}

	public int getI() {
		return i;
	}

	public void setI(int i) {
		this.i = i;
	}

	public BB getOb() {
		return ob;
	}

	public void setOb(BB ob) {
		this.ob = ob;
	}

	@Override
	public String toString() {
		return "AA [i=" + i + ", ob=" + ob + "]";
	}

}
