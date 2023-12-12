package com.teamb.controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.teamb.domain.MemberVO;
import com.teamb.domain.WTUploadVO;
import com.teamb.domain.WebtoonSearchVO;
import com.teamb.domain.WebtoonSearchVO2;
import com.teamb.domain.WebtoonVO;
import com.teamb.service.WebtoonService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/page/*")
@AllArgsConstructor
public class WTController {

	private WebtoonService w_service;

	@GetMapping("/main")
	public void main(Model model) {

//		model.addAttribute("WTInit", w_service.getList(1, webtoonSearch));
		model.addAttribute("WTInit", w_service.getWebtoonList());

		model.addAttribute("GenreButton", w_service.getSearchGenreButton());
		model.addAttribute("PlatformButton", w_service.getSearchPlatformButton());
		model.addAttribute("PaymentButton", w_service.getSearchPaymentButton());
		model.addAttribute("WeekdayButton", w_service.getSearchWeekdayButton());

		// 플랫폼url가져오기
		model.addAttribute("plurl", w_service.plurl());

	}

	@PostMapping("/main")
	public void search2(Model model, WebtoonSearchVO2 webtoonSearch) {

//		model.addAttribute("WTInit", w_service.getList(2, webtoonSearch));

		model.addAttribute("WTInit", w_service.getWebtoonSearch(webtoonSearch));
		model.addAttribute("GenreButton", w_service.getSearchGenreButton());
		model.addAttribute("PlatformButton", w_service.getSearchPlatformButton());
		model.addAttribute("PaymentButton", w_service.getSearchPaymentButton());
		model.addAttribute("WeekdayButton", w_service.getSearchWeekdayButton());

		model.addAttribute("Check", webtoonSearch);

		log.info("---->" + webtoonSearch);

	}

	@GetMapping("/wt_detail")
	public void wt_detail(Long webtoon_id, Long platform_code, Model model, HttpSession session) {
		model.addAttribute("webtoon_id", webtoon_id);
		model.addAttribute("platform_code", platform_code);
		model.addAttribute("WT", w_service.getWebtoonDetail(webtoon_id));
		model.addAttribute("Platform", w_service.getWebtoonPlatform(webtoon_id));
		model.addAttribute("Genre", w_service.getWebtoonGenre(webtoon_id));
		model.addAttribute("Weekday", w_service.getWebtoonWeekday(webtoon_id, platform_code));
		model.addAttribute("Author", w_service.getWebtoonAuthor(webtoon_id, platform_code));
		model.addAttribute("PlatformChar", w_service.getPlatformChar(webtoon_id, platform_code));

		model.addAttribute("cmtList", w_service.cmtList(webtoon_id));

		model.addAttribute("WTAuthor", w_service.sameAuthorWT(webtoon_id));
		model.addAttribute("WTSimilar", w_service.SimilarWT(webtoon_id));

		MemberVO member = (MemberVO) session.getAttribute("member");
		String user_id = "";
		if (member != null) {
			user_id = member.getUser_id();
		}
		model.addAttribute("User_id", user_id);

		model.addAttribute("isLiked", w_service.isLiked(user_id, webtoon_id));
		model.addAttribute("isFav", w_service.isFav(user_id, webtoon_id));

	}

	@PostMapping("/wt_detail")
	public String wt_detail2(Long webtoon_id, Long platform_code, Model model, HttpSession session) {

		MemberVO member = (MemberVO) session.getAttribute("member");
		String user_id = "";
		if (member != null) {
			user_id = member.getUser_id();
		}
		model.addAttribute("User_id", user_id);

		WebtoonVO WT = w_service.getPlatformChar(webtoon_id, platform_code);

		if (user_id.isEmpty()) {
			return "redirect:" + WT.getUrl();
		} else {
			w_service.hitUp(webtoon_id, user_id);
			w_service.updateRanking(webtoon_id);
			return "redirect:" + WT.getUrl();
		}
	}

	@RequestMapping(value = "/like", method = RequestMethod.POST)
	@ResponseBody
	public Long like(String user_id, Long webtoon_id) {
		Long isLiked = 0L;
		if (user_id != "") {
			isLiked = w_service.isLiked(user_id, webtoon_id);
			isLiked = w_service.insertOrDeleteLike(isLiked, user_id, webtoon_id);
			return isLiked;
		} else {
			return isLiked;
		}
	}

	@RequestMapping(value = "/fav", method = RequestMethod.POST)
	@ResponseBody
	public Long fav(String user_id, Long webtoon_id) {
		Long isFav = 0L;
		if (user_id != "") {
			isFav = w_service.isFav(user_id, webtoon_id);
			isFav = w_service.insertOrDeleteFav(isFav, user_id, webtoon_id);
			return isFav;
		} else {
			return isFav;
		}
	}

	@RequestMapping(value = "/wt_contents", method = RequestMethod.POST)
	@ResponseBody
	public Long comment(String user_id, Long webtoon_id, @RequestParam("NewComment") String NewComment, Model model) {

		System.out.println("들어옴");
		System.out.println("아이디 : ----------------" + user_id);
		System.out.println("웹툰 : ----------------" + webtoon_id);
		System.out.println("코멘트 : ----------------" + NewComment);

		Long commentSuccess = 0L;

		if (user_id != "") {
			if (w_service.isCommentExist(user_id, webtoon_id) == 0L) {
				w_service.insertComment(user_id, webtoon_id, NewComment);
				commentSuccess = 1L;
			} else {
			}

		} else {
		}

		model.addAttribute("cmtList", w_service.cmtList(webtoon_id));

//		response.sendRedirect("/wt_detail");

		return commentSuccess;
	}

	@GetMapping("/wt_json_upload")
	public void wt_json_upload() {
		
	}
	@GetMapping("/wt_json_file_upload")
	public void wt_json_file_upload() {
		
	}

	@PostMapping("/wt_json_upload")
	public ResponseEntity<String> wt_json_upload(String WTJson) {
		
		w_service.uploadWebtoonByJson(WTJson);
		return new ResponseEntity<>("json 전송/", HttpStatus.BAD_REQUEST);

	}
	@PostMapping("/wt_json_file_upload")
	public ResponseEntity<String> wt_json_file_upload(
			@RequestParam("jsonFile") MultipartFile file) {
		
//		System.out.println(WTJson);
		
		
		
		 if (!file.isEmpty()) {
		        try {
		            
	                ObjectMapper objectMapper = new ObjectMapper();
	                JsonNode jsonNode = objectMapper.readTree(file.getBytes());
	                w_service.uploadWebtoonByJson(jsonNode.toString());
//	                System.out.println(jsonNode);


//	                System.out.println("Parsed JSON Data: " + jsonNode.toString());
		            return new ResponseEntity<>("File uploaded and processed successfully", HttpStatus.OK);
		        } catch (IOException e) {
		            return new ResponseEntity<>("File upload failed: " + e.getMessage(), HttpStatus.BAD_REQUEST);
		        }
		    } else {
		        return new ResponseEntity<>("File upload failed: File is empty", HttpStatus.BAD_REQUEST);
		    }
		
		
//		w_service.uploadWebtoonByJson(WTJson);
//		
//		return new ResponseEntity<>("json 전송/", HttpStatus.BAD_REQUEST);

//		
//		JSONParser parser = new JSONParser();
//
//		ObjectMapper objectMapper = new ObjectMapper();
//
//		try {
//			JsonNode jsonNode = objectMapper.readTree(WTJson);
//
//			if (jsonNode.isObject()) {
//				System.out.println("이것은 JSON 객체입니다.");
//
//				JSONObject jsonWT = (JSONObject) parser.parse(WTJson);
//
//			} else if (jsonNode.isArray()) {
//				System.out.println("이것은 JSON 배열입니다.");
//			} else {
//				System.out.println("이것은 유효한 JSON 형식이 아닙니다.");
//			}
//		} catch (Exception e) {
//			System.out.println("JSON 파싱 중 오류가 발생했습니다: " + e.getMessage());
//		}
//		 JSONParser parser = new JSONParser();
//		 JSONObject jsonWT = (JSONObject) parser.parse(WTJson);
//		 
//		 
//		 JSONArray webtoonsArray = (JSONArray) jsonWT.get("webtoons");
//		 jsonWT = (JSONA) jsonWT.get("webtoons");
//		 System.out.println("webtoonsArray 는 " + webtoonsArray);
//		 System.out.println("&&&&&&&&&&&&&& " + jsonWT.get("webtoons"));
//		 if((JSONObject) jsonWT.get("webtoons") != null) {
//			 jsonWT = (JSONObject) jsonWT.get("webtoons");
//		 }
//		 
//		 WTUploadVO upload = new WTUploadVO();
//		 upload.setWebtoonId((Long) jsonWT.get("webtoonId"));
//		 upload.setAuthor((String) jsonWT.get("author"));
//		 upload.setUrl((String) jsonWT.get("url"));
//		 upload.setUrl((String) jsonWT.get("img"));
//		 upload.setUrl((String) jsonWT.get("service"));
//		 System.out.println(jsonWT);
//		 System.out.println(jsonWT.get("webtoonId"));
//		 System.out.println(((JSONObject) jsonWT.get("additional")).get("new"));
		
	}
	

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@GetMapping("/wtcmt_modify")
	public void wtcmt_modify() {

	}

	@GetMapping("/wt_favorites")
	public String wt_favorites(Model model, HttpSession session, WebtoonVO webtoon, HttpServletResponse response) {
		// 플랫폼url가져오기
		model.addAttribute("plurl", w_service.plurl());
		MemberVO value = (MemberVO) session.getAttribute("member");

		if (value == null) {
			try {
				response.sendRedirect("/page/wt_favorites_fail");
				return null;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		value.getUser_id();
		webtoon.setUser_id(value.getUser_id());
		model.addAttribute("fav_list", w_service.fav_getWebtoonList(webtoon));
		return "/page/wt_favorites";
	}

	@GetMapping("/wt_favorites_fail")
	public void wt_favorites_fail(Model model) {
		// 플랫폼url가져오기
		model.addAttribute("plurl", w_service.plurl());
	};

	@GetMapping("/wt_contents")
	public void wt_contents() {

	}

	@GetMapping("/wt_delete")
	public String wt_delete(Long webtoon_id, HttpSession session) {
		System.out.println("=========================="+webtoon_id);
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		
		if (member == null) {
			return "/page/memberlogin";
			
		} else if (member != null && 1 == Long.valueOf(member.getAdmin_code()))
			
			w_service.wt_delete(webtoon_id);
		
		return "redirect:/page/main";
	}

	@GetMapping("/wt_upload")
	public void wt_upload() {
	}
	
	@RequestMapping(value = "/wt_cmt_delete", method = RequestMethod.GET)
	@ResponseBody
	public Long wt_cmt_delete(Long webtoon_id, HttpSession session) {

		System.out.println("=!!!!!!!!!!!!!!!!!!!"+webtoon_id);
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		Long cmtdelete = 0L;
		
		if (member != null) {
			
			cmtdelete = 1L;
			
			w_service.wt_cmt_delete(webtoon_id, member.getUser_id());
			
			return cmtdelete;
			
		} else return cmtdelete;
	}
	
	@RequestMapping(value = "/admin_cmt_delete", method = RequestMethod.GET)
	@ResponseBody
	public Long admin_cmt_delete(Long webtoon_id, String users_id, HttpSession session) {
		
		System.out.println("=!!!!!!!!!!!!!!!!!!!"+webtoon_id);
		System.out.println("=!!!!!!!!!!!!!!!!!!!"+users_id);
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		Long admincmtdelete = 0L;
		
		if (member != null && 1 == Long.valueOf(member.getAdmin_code())) {
			
			admincmtdelete = 1L;
			
			w_service.wt_cmt_delete(webtoon_id, users_id);
			
			return admincmtdelete;
			
		} else return admincmtdelete;
	}
	
	@RequestMapping(value = "/wt_cmt_modify", method = RequestMethod.GET)
	@ResponseBody
	public Long wt_cmt_modify(Long webtoon_id, String ModifyComment, HttpSession session) {
		
		System.out.println("=!!!!!!!!!!!!!!!!!!!"+webtoon_id);
		System.out.println("=!!!!!!!!!!!!!!!!!!!"+ModifyComment);
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		Long wtcmtmodify = 0L;
		
		if (member != null) {
			
			wtcmtmodify = 1L;
			
			w_service.wt_cmt_modify(webtoon_id, ModifyComment, member.getUser_id());
			
			return wtcmtmodify;
			
		} else return wtcmtmodify;
	}
	
	
	@GetMapping("/wt_modify")
	public void wt_modify() {} 
}
