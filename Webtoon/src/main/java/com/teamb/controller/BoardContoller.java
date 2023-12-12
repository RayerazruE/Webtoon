package com.teamb.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.teamb.domain.BoardVO;
import com.teamb.domain.MemberVO;
import com.teamb.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/page/*")
@AllArgsConstructor
public class BoardContoller {

	private BoardService service;
	
	@GetMapping("/boardregister") //1.화면 보여주는 용도
	public void register() {
		
	}
	
//	@GetMapping("/boardlist") //2.목록 조회
	@RequestMapping(value = "/boardlist", method = { RequestMethod.GET, RequestMethod.POST })
	public void list(Model model) {
	    log.info("list");
	    model.addAttribute("list", service.getList());
	}

	
	@PostMapping("/boardregister") // 3.입력
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("register: " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBoard_num());
		return "redirect:/page/boardlist";
	}
	
	@GetMapping({"/boardget", "/boardmodify"}) //4.검색
	public void get(@RequestParam("board_num") Long board_num, Model model) {
		log.info("/get");
		model.addAttribute("board", service.get(board_num));
	}
	
	@PostMapping("/boardmodify") //5.수정
	public String modify(BoardVO board, RedirectAttributes rttr) {
		log.info("modify:" + board);
		
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/page/boardlist";
	}
	
	@RequestMapping(value="/boardremove", method = {RequestMethod.GET ,RequestMethod.POST})//6.삭제
	public String remove(@RequestParam("board_num") Long board_num, RedirectAttributes rttr) {
		
		log.info("remove...." + board_num);
		if (service.remove(board_num)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/page/boardlist";
	}
	
	
	@GetMapping("/page/isLoggedIn") //7.로그인세션 및 유저코드 가져오기 
    public @ResponseBody Map<String, Object> isLoggedIn(HttpSession session) {
        Map<String, Object> response = new HashMap<>();

        MemberVO member = (MemberVO) session.getAttribute("member"); //세션에서 회원 정보 가져오기
        
        if (member != null) { //.로그인 유저ID와 관리코드 반환
            response.put("loggedIn", true);
            response.put("user_id", member.getUser_id());
            response.put("admin_code", member.getAdmin_code());
        } else {
            response.put("loggedIn", false);
        }

        return response;
    }
	

}
