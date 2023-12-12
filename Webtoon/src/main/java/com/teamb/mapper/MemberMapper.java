package com.teamb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.teamb.domain.MemberVO;

public interface MemberMapper {
	
	public MemberVO MemberLogin(MemberVO member);
	MemberVO findByUserId(String user_id);
	
	//회원가입
	public void MemberJoin(MemberVO member);
	
	//회원정보수정
	public void updateMember(MemberVO member);
	
	//회원탈퇴
	String getPasswordByUserId(@Param("user_id") String user_id);
	int deleteById(@Param("user_id") String user_id);
	
	//아이디중복확인
	public int checkId(String user_id);
	
	//닉네임중복확인
	public int checkName(String name);
	
	//파일업로드
	void updateimage(MemberVO member);
	
	//프로필사진업로드
    void updateProfilePhoto(@Param("user_id") String user_id, @Param("profile_photo") String profile_photo);

    //비밀번호변경
    void updatePassword(@Param("user_id") String user_id, @Param("new_password") String new_password);
    
	//비밀번호확인
	public int checkCurrentPassword(@Param("user_id") String user_id, @Param("password") String password);
	
	//회원목록
	public List<MemberVO> memberList();
	
	//관리자 권한 확인
	public int getAdminCodeByUserId(String user_id);
	
	//관리자 강제탈퇴
	void deleteUser(String user_id);
	
}
