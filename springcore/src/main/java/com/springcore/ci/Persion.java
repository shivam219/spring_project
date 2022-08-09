package com.springcore.ci;

public class Persion {
	private String name;
	private int PersionId;

	public Persion(String name, int persionId) {
		super();
		this.name = name;
		PersionId = persionId;
	}

	@Override
	public String toString() {
		return "Persion [name=" + name + ", PersionId=" + PersionId + "]";
	}

}
