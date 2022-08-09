package com.springcore.ref;

public class BB {
	int i;
	AA ob;

	public BB() {
		super();
	}

	public BB(int i, AA ob) {
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

	public AA getOb() {
		return ob;
	}

	public void setOb(AA ob) {
		this.ob = ob;
	}

	
	/*
	 * @Override public String toString() { return "BB [i=" + i + ", ob=" + ob +
	 * "]"; }
	 */
}
