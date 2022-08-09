package com.springcore.lifecycle;

public class catni {
	private int catni = 10;

	public int getCatni() {
		return catni;
	}

	public void setCatni(int catni) {
		this.catni = catni;
	}

	public catni(int catni) {
		super();
		this.catni = catni;
	}

	public catni() {
		super();
	}

	@Override
	public String toString() {
		return "catni [catni=" + catni + "]";
	}

}
