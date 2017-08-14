package com.rowell.sifa.pojo.terminal;

public class TerminalLocation {

	private String mdn;		//终端号码
	private String tuTpye;	//1.手机 2.车机 3.哑终端


	public String getMdn() {
		return mdn;
	}

	public void setMdn(String mdn) {
		this.mdn = mdn;
	}

	public String getTuTpye() {
		return tuTpye;
	}

	public void setTuTpye(String tuTpye) {
		this.tuTpye = tuTpye;
	}

	public String toString() {
		return "mdn: " + mdn + ", tuTpye: " + tuTpye;
	}
}