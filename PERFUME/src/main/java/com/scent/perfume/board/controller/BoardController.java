package com.scent.perfume.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.scent.perfume.board.model.service.BoardService;
import com.scent.perfume.board.model.vo.Notice;
import com.scent.perfume.common.util.MultipartFileUtil;
import com.scent.perfume.common.util.PageInfo;
import com.scent.perfume.planning.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
//@RequestMapping("/board")
public class BoardController {
// Application-Context에 의해서 Bean객체로 주입받는다.
	@Autowired
	private BoardService service;

// 인터페이스 구현체를 주입받는다. 스프링에서 resource를 읽어올 때 사용하는 Bean.
// class path, file, webapp을 기준으로 resource를 읽어올 수 있는 특징이 있다.
	@Autowired
	private ResourceLoader resourceLoader;

//	메서드의 return 타입이 void일 경우 매핑 URL을 보고 유추해서 view를 찾는다.
//	@GetMapping("/board/list")
//	public void list() {
//		
//	}

//	@RequestParam(defaultValue = "1") : 매개변수가 없으면 ERROR페이지를 출력해주는 대신 defaultValue를 1로 설정해준다.
	@GetMapping("/board/list")
	public ModelAndView list(ModelAndView modelAndView, @RequestParam(value = "page", defaultValue = "1") int page) {
		int listCount = service.getBoardCount();
		// Service라는 객체를 ApplicationContext로부터 주입받는다.
		
		log.info("Page : {}", page);
		log.info("ListCount : {}", listCount);

		PageInfo pageInfo = new PageInfo(page, 10, listCount, 10);
		// pageInfo를 통해서 게시글목록을 가져온다.

		
		List<Notice> generalList = service.getBoardList(pageInfo, "N");
		List<Notice> noticeList = service.getBoardList(pageInfo, "Y");
		
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("generalList", generalList); // service로부터 얻어온 list를 modelAndView를 통해서 view한테(jsp페이지로) 포워딩시켜준다.
		modelAndView.addObject("noticeList", noticeList); // service로부터 얻어온 list를 modelAndView를 통해서 view한테(jsp페이지로) 포워딩시켜준다.
		modelAndView.setViewName("/board/list"); // setViewName 메서드를 통해서 뷰의 경로를 설정한다.

		return modelAndView;
	}

	@GetMapping("/board/view")
	public ModelAndView view(ModelAndView modelAndView, @RequestParam int no) {
		Notice board = null;
		
		
		log.info("no : {}", no);

		board = service.findBoardByNo(no);
		service.updateReadCount(board);
		board = service.findBoardByNo(no);
		
		modelAndView.addObject("board", board);
		modelAndView.setViewName("board/view");

		return modelAndView;
	}

//	해당 요청이 왔을 때 JSP페이지로 포워딩해줄 수 있도록 만든다.
//	단순히 게시글 작성 페이지로만 포워딩해주기 떄문에 Data를 전달해 줄 필요가 없다.
	@GetMapping("/board/write")
	public String write() {
		log.info("게시글 작성 페이지 요청");

		return "board/write";
	}

	// 썸머노트 다중 이미지 업로드
	@RequestMapping(value = "/uploadSummernoteImage", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	@ResponseBody
	public Object uploadSummernoteImageFile(@RequestParam("upfile") MultipartFile upfile, HttpServletRequest request) {

		Map<String, Object> map = new HashMap<>();

		// 1. 파일을 업로드 했는지 확인 후 파일을 저장(물리적 위치에)
		if (upfile != null && !upfile.isEmpty()) { // !upfile.isEmpty() => false이면. 비었다의 반대니까 false
			String location = null;
			String renamedFileName = null;

			try {
				location = resourceLoader.getResource("resources/upload/board").getFile().getPath();
				// resourceLoader를 통해 지정한 폴더에서 파일을 가져와서, 파일의 경로를 가져옴

				System.out.println("로케이션" + location);

				renamedFileName = MultipartFileUtil.save(upfile, location);

				System.out.println("리네임 파일 네임 " + renamedFileName);

			} catch (IOException e) {
				e.printStackTrace();
			}

			if (renamedFileName != null) {
				map.put("url", request.getContextPath() + "/resources/upload/board/" + renamedFileName);
				map.put("responseCode", "success");
				System.out.println("마지막 로케이션" + location);
				System.out.println("맵 url : " + map.get("url"));
				System.out.println("성공했나용");
			} else {
				map.put("responseCode", "error");
				System.out.println("실패했나용");
			}
		}
		return map;
	}
	
	/*
	 * 실제로 게시글 작성 내용이 DB에 등록되도록 작업한다.(multipartResolver를 통해 파일첨부도 할 수 있다.) 첨부파일을 받고싶다면
	 * 매개변수로 MultipartFile 등록하면 된다. board-mapper.xm l에서 WRITER_NO컬럼에 Member객체의
	 * logiMember를 매개변수로 가져와 INSERT해준다.
	 */
	@PostMapping("/board/write")
	public ModelAndView write(ModelAndView modelAndView, @ModelAttribute Notice board,
			@SessionAttribute("loginMember") Member loginMember) {
		int result = 0;

//	2. 작성한 게시글 데이터를 데이터 베이스에 저장
		board.setBMno(loginMember.getNo());
		result = service.save(board);
		if (result > 0) {
			modelAndView.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
//	게시글이 정상적으로 등록되었으면 해당 게시글 상세조회페이지로 넘어간다.
			modelAndView.addObject("location", "/board/view?no=" + board.getBNo());
		} else {
			modelAndView.addObject("msg", "게시글 등록을 실패하였습니다.");
			modelAndView.addObject("location", "/board/write");
		}

		modelAndView.setViewName("common/msg");
		return modelAndView;
	}


//매개변수는 @RequestParam 어노테이션으로 가져올 수 있다.
// @SessionAttribute 세션영역에 저장되어있는 attribute 이름을 주면 해당하는 attribute를 매개변수로 전달해 준다.
	@GetMapping("/board/delete")
	public ModelAndView delete(ModelAndView modelAndView, @RequestParam int no,
				@SessionAttribute("loginMember") Member loginMember) {
		int result = 0;
		Notice board = null;
		
		board = service.findBoardByNo(no);
		
		if(board != null && board.getWriterId().equals(loginMember.getId())) {
			
// Service 객체에 매개변수로 게시판 번호를 지정한 후 delete메서드를 호출하면, 영향받은 행의 개수를 return받는다. 
			result = service.delete(no);
			
// 게시글 삭제를 성공하면 게시글 조회페이지로 넘어가고 실패하면 해당하는 게시글 번호로 다시 돌아온다.
			if(result > 0) {
				modelAndView.addObject("msg", "게시글이 정상적으로 삭제되었습니다.");
				modelAndView.addObject("location", "/board/list");
			}else {
				modelAndView.addObject("msg", "게시글 삭제를 실패하였습니다.");
				modelAndView.addObject("location", "/board/view?no=" + no);
			}
		}else {
			modelAndView.addObject("msg", "잘못된 접근입니다.");
			modelAndView.addObject("location", "/board/list");
		}
	
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	
	@GetMapping("/board/update")
	public ModelAndView update(ModelAndView modelAndView, @RequestParam int no,
			@SessionAttribute("loginMember") Member loginMember) {
		Notice board = null;
		
		log.info("no : {}", no);
		log.info(loginMember.toString());
		
		board = service.findBoardByNo(no);
		
		if(board != null && board.getWriterId().equals(loginMember.getId())) {
			modelAndView.addObject("board", board);
			modelAndView.setViewName("board/update");
		}else {
			modelAndView.addObject("msg", "잘못된 접근입니다.");
			modelAndView.addObject("location", "/board/list");
			modelAndView.setViewName("common/msg");
		}
		
		return modelAndView;
	}
	
	@PostMapping("/board/update")
	public ModelAndView update(ModelAndView modelAndView,
								@RequestParam int no, @RequestParam String title, @RequestParam String content, @RequestParam String notice_yn,
								@SessionAttribute("loginMember") Member loginMember) {
		int result = 0;
		Notice board = null;
		
		log.info("{}, {}, {]", new Object[] {no, title, content});
		board = service.findBoardByNo(no);
// loginMember아이디랑 게시글 작성자랑 같은지 검사한다.	
		if(board != null && board.getWriterId().equals(loginMember.getId())) {
			board.setBTitle(title);
			board.setBContent(content);
			board.setNotice_yn(notice_yn);
			
			result = service.save(board);
			
			if(result > 0) {
				modelAndView.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
				modelAndView.addObject("location", "/board/view?no="+board.getBNo());
			}else {
				modelAndView.addObject("msg", "게시글 수정을 실패하였습니다.");
				modelAndView.addObject("location", "/board/update?no="+board.getBNo());
			}
		}else{
// session이 null이거나 내가 작성한 게시글이 아닐경우
			modelAndView.addObject("msg", "잘못된 접근입니다.");
			modelAndView.addObject("location", "/board/list");
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
}
