package com.teamb.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.teamb.domain.MemberVO;

public interface MemberService {
	
	//로그인
	public MemberVO MemberLogin(MemberVO member) throws Exception;
	
	//회원가입
	public void MemberJoin(MemberVO member) throws Exception;
	
	//회원 정보 수정
	public void updateMember(MemberVO member) throws Exception;

	//회원 정보 탈퇴
    boolean checkPassword(String user_id, String password);
    boolean deleteMemberById(String user_id);
	
	//아이디 중복 확인
	public int checkId(String user_id);
	
	//닉네임 중복 확인
	public int checkName(String name);
	
	//프로필사진 업로드
	MemberVO getMemberById(String user_id);
	boolean uploadProfileImage(String user_id, MultipartFile file, HttpServletRequest request);
	 
	// 비밀번호 변경
	public void changePassword(String user_id, String new_password); 

	//패스워드 일치 확인
	public int checkCurrentPassword(String user_id, String password);
	
	//회원목록	
	public List<MemberVO> memberList();
	
	//관리자 권한 확인
	public int getAdminCodeByUserId(String user_id);
	
	//관리자 강제탈퇴
	void deleteUser(String user_id);

}