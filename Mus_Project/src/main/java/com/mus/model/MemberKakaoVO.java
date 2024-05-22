package com.mus.model;

public class MemberKakaoVO {
	
	/*
	memberKId varchar2(50),
	memberKPw varchar2(100) not null,
	memberNickName varchar2(50) not null,
	memberKMail varchar2(100) not null,
	*/
	
	private String memberKId;
	private String memberKPw;
	private String memberNickName;
	private String memberKMail;
	public String getMemberKId() {
		return memberKId;
	}
	public void setMemberKId(String memberKId) {
		this.memberKId = memberKId;
	}
	public String getMemberKPw() {
		return memberKPw;
	}
	public void setMemberKPw(String memberKPw) {
		this.memberKPw = memberKPw;
	}
	public String getMemberNickName() {
		return memberNickName;
	}
	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}
	public String getMemberKMail() {
		return memberKMail;
	}
	public void setMemberKMail(String memberKMail) {
		this.memberKMail = memberKMail;
	}
	@Override
	public String toString() {
		return "MemberKakaoVO [memberKId=" + memberKId + ", memberKPw=" + memberKPw + ", memberNickName="
				+ memberNickName + ", memberKMail=" + memberKMail + "]";
	}

	
}
