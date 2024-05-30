package com.mus.model;

public class MemberKakaoVO {
	
	/*
	memberKId varchar2(50),
	memberKPw varchar2(100) not null,
	memberNickName varchar2(50) not null,
	memberKMail varchar2(100) not null,
	*/
	
	private String memberId;
	private String memberPw;
	private String memberNickName;
	private String memberMail;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberNickName() {
		return memberNickName;
	}
	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}
	public String getMemberKMail() {
		return memberMail;
	}
	public void setMemberKMail(String memberKMail) {
		this.memberMail = memberKMail;
	}
	@Override
	public String toString() {
		return "MemberKakaoVO [memberId=" + memberId + ", memberPw=" + memberPw + ", memberNickName=" + memberNickName
				+ ", memberKMail=" + memberMail + "]";
	}
	
	
	
}