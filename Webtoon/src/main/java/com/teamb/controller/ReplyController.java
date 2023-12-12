package com.teamb.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.teamb.domain.Criteria;
import com.teamb.domain.ReplyVO;
import com.teamb.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/page/*")
@RestController
@Log4j
@AllArgsConstructor
public class ReplyController {

	private ReplyService service;
	
	//댓등록
	@PostMapping(value = "/new",
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE})
	
	public ResponseEntity<String> create(@RequestBody ReplyVO reply) {
		
		log.info("ReplyVO: " + reply);
		
		int insertCount = service.register(reply);
		
		log.info("Reply INSERT COUNT: " + insertCount);
		
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	//특정게시글의 댓목록
	@GetMapping(value = "/pages/{board_num}/{page}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_VALUE})
	
		public ResponseEntity<List<ReplyVO>> getList(
				@PathVariable("page") int page,
				@PathVariable("board_num") Long board_num) {
		
		log.info("getList.................");
	    Criteria cri = new Criteria(page,10);
	    log.info(cri);
	  
	   return new ResponseEntity<>(service.getList(cri, board_num), HttpStatus.OK);

	}
	
	//댓 조회
	@GetMapping(value = "/{reply_id}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_VALUE})
	
		public ResponseEntity<ReplyVO> get(@PathVariable("reply_id") Long reply_id) {
		log.info("get: " + reply_id);
		
		return new ResponseEntity<>(service.get(reply_id), HttpStatus.OK);
	}
	
	//댓삭
	@DeleteMapping(value = "/{reply_id}",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	
		public ResponseEntity<String> remove(@PathVariable("reply_id") Long reply_id) {
		
		log.info("remove: " + reply_id);
		return service.remove(reply_id) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓수정
	@RequestMapping(method = { RequestMethod.PUT,RequestMethod.PATCH},
			value = "/{reply_id}",
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE })
		
		public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("reply_id") Long reply_id) {
		
			vo.setReply_id(reply_id);
			
			log.info("reply_id: " + reply_id);
			log.info("modify: " + vo);
			
			return service.modify(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
			        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}
	
		
				

	
	
	
	
}
