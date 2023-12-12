package com.teamb.controller;

import java.awt.print.Pageable;
import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import com.teamb.domain.MemberVO;
import com.teamb.service.MemberService;
import com.teamb.service.WebtoonService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/page/*")
@AllArgsConstructor
@Controller
public class MemberController {
	
	// 생성자주입
	@Autowired
	private MemberService memberService;
	
	// 회원 로그인
	@RequestMapping(value="/memberlogin", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception {
		
		System.out.println("login 메서드 진입");
		System.out.println("전달된 데이터 : " + member);
		
		HttpSession session = request.getSession();
		MemberVO lvo = memberService.MemberLogin(member);
	
		if(lvo == null) {
			// 일치하지 않는 아이디, 비밀번호 입력 경우
            int result = 0;
            rttr.addFlashAttribute("result", result);
            return "redirect:/page/memberlogin";
        }
        
        session.setAttribute("member", lvo); 
        // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
        return "redirect:/page/main";
	}
	
	// 회원 가입
	@RequestMapping(value = "/memberjoin", method = RequestMethod.POST)
	public String joinPost(MemberVO member) throws Exception {
		
		memberService.MemberJoin(member);
		
		return "redirect:/page/main";
		
	}
	
	// 회원 정보 수정
	@RequestMapping(value = "/updateMember", method = {RequestMethod.GET, RequestMethod.POST })
	public String updateMember(MemberVO member, HttpSession session, Model model) throws Exception {
	    
		boolean updateSuccess = performUpdate(member);
        // 현재 세션에서 "member" 속성을 가져옵니다
        member = (MemberVO) session.getAttribute("member");
		
		 if (updateSuccess) {
		        // 수정 성공 시 알림 메시지를 Model에 추가
		        model.addAttribute("modalMessage", "수정 성공");
		        //기존 데이터를 불러옴 - 업로드한 데이터(주소)를 변경함.
		        session.setAttribute("member", member);

	            if (member != null) {
	                // "member" 속성에서 현재 멤버 정보를 가져옵니다.
	                MemberVO lvo = memberService.MemberLogin(member);

	                if (lvo != null) {
	                    // 새로운 멤버 정보로 세션 정보를 업데이트합니다.
	                    session.setAttribute("member", lvo);
	                    return "redirect:/page/myinfo";
	                }
	            }
	                
		    } else {
		        // 수정 실패 시 알림 메시지를 Model에 추가
		        model.addAttribute("modalMessage", "수정 실패");
		    }
		
		return "redirect:/page/myinfo";
	}
	
	// 수정시 불린 값 할당
	private boolean performUpdate(MemberVO member) {
	    // memberService.updateMember의 내용을 여기에 복사하고 성공 여부를 반환
	    try {
	        // 수정 로직을 수행
	        memberService.updateMember(member);
	        return true; // 성공한 경우 true 반환
	    } catch (Exception e) {
	        return false; // 실패한 경우 false 반환
	    }
	}
	
    // 회원 탈퇴
	@RequestMapping(value = "/deleteMember", method = {RequestMethod.GET, RequestMethod.POST })
	public String deleteMember(HttpServletRequest request, HttpSession session, SessionStatus sessionStatus) {
	    String user_id = request.getParameter("user_id");
	    String password = request.getParameter("password"); // 입력된 비밀번호

	    if (user_id != null && password != null) {
	        // 사용자가 입력한 비밀번호와 실제 비밀번호를 비교
	        boolean isPasswordCorrect = memberService.checkPassword(user_id, password);

	        if (isPasswordCorrect) {
	            boolean deleted = memberService.deleteMemberById(user_id);

	            if (deleted) {
	                // 세션 무효화 (로그아웃)
	                session.invalidate();
	                sessionStatus.setComplete();

	                return "redirect:/page/main";
	            } else {
	                return "오류 발생.";
	            }
	        } else {
	            return "비밀번호가 일치하지 않습니다.";
	        }
	    } else {
	        return "유효한 사용자 아이디나 비밀번호가 제공되지 않았습니다.";
	    }
	}
	
	// 아이디 중복 확인
    @RequestMapping(value="/checkId", method = {RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String checkId(@RequestParam("user_id") String user_id) {
		int cnt = memberService.checkId(user_id);
		return cnt+"";
	}
    
	// 닉네임 중복 확인
    @RequestMapping(value="/checkName", method = {RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String checkName(@RequestParam("name") String name) {
		int cnt2 = memberService.checkName(name);
		return cnt2+"";
	}
	
	// 로그아웃
    @RequestMapping(value = "/logout", method = {RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/page/main";
	}

	// 프로필 사진 업로드
	@RequestMapping(value = "/uploadProfileImage", method = {RequestMethod.GET, RequestMethod.POST })
	public String uploadProfileImage(@RequestParam("file") MultipartFile file, HttpSession session, HttpServletRequest request) {
	    MemberVO member = (MemberVO) session.getAttribute("member");
	    if (member != null) {
	        String user_id = member.getUser_id();
	        log.info("user_id : " + user_id);

	        if (memberService.uploadProfileImage(user_id, file, request)) {
	            // 업로드 성공
	            return "redirect:/page/myinfo";
	        } else {
	            // 업로드 실패
	            return "redirect:/page/myinfo?error=upload";
	        }
	    } else {
	        // member 객체가 세션에 없는 경우 처리
	        return "redirect:/page/myinfo?error=session";
	    }
	}
	
	// 비밀번호변경
    @RequestMapping(value = "/editPassword", method = {RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public String changePassword(HttpSession session, @RequestParam String user_id, @RequestParam String new_password) {
    	// 비밀번호 변경 로직

    	 try {
             memberService.changePassword(user_id, new_password);
             session.invalidate();      
             return "success"; // 비밀번호 변경 성공
         } catch (Exception e) {
             e.printStackTrace();
             return "error"; // 비밀번호 변경 실패
         }
    }
    
    // 현재 비밀번호 확인
    @RequestMapping(value = "/checkCurrentPassword", method = {RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public String checkCurrentPassword(@RequestParam String user_id, @RequestParam String password) {
     
		int cnt = memberService.checkCurrentPassword(user_id, password);
		return cnt+"";
    }
    

 // 회원목록
    @RequestMapping(value = "/memberlist", method = {RequestMethod.GET, RequestMethod.POST })
    public String memberlist(Model model, HttpSession session, RedirectAttributes rttr) {
        try {
            MemberVO member = (MemberVO) session.getAttribute("member");

            // admin_code 값 확인
            int adminCode = memberService.getAdminCodeByUserId(member.getUser_id());

            if (member != null && adminCode == 1) {
                // admin_code가 1이면 memberlist 페이지로 이동
                List<MemberVO> list = memberService.memberList();
                model.addAttribute("list", list);
                return "page/memberlist";
            } else {
                // 그 외의 경우 login 페이지로 리다이렉트
                int result = 0;
                rttr.addFlashAttribute("result", result);
                return "redirect:/page/memberlogin";
            }
        } catch (NullPointerException e) {
            // 예외 처리: NullPointerException이 발생하면 main 페이지로 리다이렉트
            return "redirect:/page/main";
        } catch (Exception e) {
            // 그 외의 예외 처리
            e.printStackTrace(); // 실제 상황에 따라 로그 처리를 해야 함
            return "redirect:/page/main";
        }
    }
    
    
 // 관리자 강제탈퇴
	@RequestMapping(value="/deleteUser", method = {RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public ResponseEntity<String> deleteUser(@RequestParam("user_id") String user_id) {
        // Perform logic to delete user data from the database
    	log.info("Deleting user with ID: " + user_id);
        memberService.deleteUser(user_id);

        // Return a success response
        return ResponseEntity.ok("User deleted successfully");
    }

}
