package com.me.rentalme.mp.mng.cs.cotroller;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.me.rentalme.common.Paging;
import com.me.rentalme.cs.entity.CsVo;
import com.me.rentalme.cs.paging.Search;
import com.me.rentalme.cs.service.CsService;
import com.me.rentalme.model.entity.ProductVo;
import com.me.rentalme.model.entity.UserVo;
import com.me.rentalme.mp.user.service.MpUserService;


/**
* 고객센터 컨트롤러 - 공지/FAQ, 1:1문의
* 
* @author 강민수
* @version ver1.0
* @see 
* 등록일자 : 2019.08.14
*/
@Controller
@RequestMapping("/mp/mng")
public class MngCsController {

	String pagingPath="/mp/mng";
	
	@Inject
	CsService csService;
	
	@Inject
	MpUserService mpUserService;
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	/**
	 * @throws SQLException 
	* 공지/FAQ 
	* 
	* @param  String code - c : 공지/FAQ 등록 폼, R : 공지/FAQ 리스트
	* @return ModelAndView 
	* @author 강민수
	* @exception 
	*/
	@RequestMapping(value = "/csNoticeList", method = RequestMethod.GET)
	public ModelAndView getCsNotice() throws SQLException {
		log.debug("공지 리스트 컨트롤러");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("alist", csService.csNoticeList());
		
		mav.setViewName("/mp/manager/mngCsList");
		return mav;
	}
	
	//FAQ리스트
	@RequestMapping(value = "/csFaqList", method = RequestMethod.GET)
	public ModelAndView getCsFaq() throws SQLException {
		log.debug("FAQ 리스트 컨트롤러");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("blist", csService.csFaqList());
		
		mav.setViewName("/mp/manager/mngCsFaqList");
		return mav;
	}

	/**
	 * @throws SQLException 
	 * 회원 문의 보기
	 * 
	 * @param  
	 * @return ModelAndView 
	 * @author 강민수
	 * @exception 
	 */
	@RequestMapping(value = "/InqList", method = RequestMethod.GET)
	public ModelAndView getQuestList(HttpSession session,CsVo csVo,Model model) throws SQLException {
		log.debug("문의 보기 컨트롤러...");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("inqlist", csService.csInqList());
		
		mav.setViewName("mp/manager/mngCsQuestList");
		
		return mav;
	}
	
	/**
	 * @throws SQLException 
	*  공지/FAQ 등록
	* 
	* @param  ProductVo - 상품
	* @return ModelAndView 
	* @author 강민수
	* @exception 
	*/
	@RequestMapping(value = "/csNoticeAdd", method = RequestMethod.POST)
	public ModelAndView addCs(CsVo csVo) throws SQLException {
		log.debug("공지/FAQ 등록 컨트롤러");
		//공지/FAQ 등록 서비스 작성
		
		if(csVo.getCsGbCd().equals("10")) {
			csService.seqNocUp();
		}
		if(csVo.getCsGbCd().equals("20")) {
			csService.seqFaqUp();
		}
		csService.addfaq(csVo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/mp/mng/csNoticeList");
		return mav;
	}
	
	
	@RequestMapping(value = "/csAdd")
	public ModelAndView addCs() {
		log.debug("공지/FAQ 등록 컨트롤러");
		//공지/FAQ 등록 서비스 작성
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mp/manager/mngCsAdd");
		return mav;
	}
	
	/**
	 * @throws SQLException 
	*  공지 삭제
	* 
	* @param  String num - 게시판번호
	* @return String msg - 성공 실패 msg
	* @author 강민수
	* 수정자   : 황인준
	* 수정일자 : 2019-09-23 
	*/
	@RequestMapping(value="/noticeDelete", method=RequestMethod.POST)
	public @ResponseBody String nolistdel(@RequestParam("noticNo") String num) throws SQLException {

		String msg = csService.noticDel(num);
	
		return msg;
	}
	
	/**
	 * @throws SQLException 
	*  FAQ 삭제
	* 
	* @param  String num - 게시판번호
	* @return String msg - 성공 실패 msg
	* @author 강민수
	* 수정자   : 황인준
	* 수정일자 : 2019-09-23 
	*/
	@RequestMapping(value="/faqDelete", method=RequestMethod.POST)
	public @ResponseBody String falistdel(@RequestParam("faqNo") String num) throws SQLException {
		String msg = csService.faqDel(num);
		return msg;
	}
	
	
	/**
	*  공지사항 수정
	* 
	* @param HttpSession session
	* @param CsVo csVo
	* @return ModelAndView 
	* @author 강민수
	* 수정자 : 황인준
	* 수정일자 : 2019-09-24
	* @exception SQLException
	*/
	@RequestMapping(value="/csNoticeUpdatePage")
	public ModelAndView noticup(HttpSession session,CsVo csVo) throws SQLException{
		
		String userId=(String)session.getAttribute("loginUserId");
		ModelAndView mav=new ModelAndView();
		mav.addObject("id", userId);
		mav.addObject("detail",csService.csNoticeDetail(csVo));
		mav.setViewName("/mp/manager/mngCsNoticeUpdate");
		return mav;
	}
	
	//fac수정페이지로 이동
		@RequestMapping(value="/csFaqUpdatePage")
		public ModelAndView faqup(HttpSession session,CsVo csVo) throws SQLException{
			
			ModelAndView mav=new ModelAndView();
			System.out.println("ㅠㅠ"+csVo.getFaqNo());
			mav.addObject("qdetail",csService.csFaqDetail(csVo));
			String userId=(String)session.getAttribute("loginUserId");
			mav.addObject("id", userId);
			mav.setViewName("/mp/manager/mngCsFaqUpdate");
			return mav;
		}
	
	//notic수정페이지 파라미터 넣기
	@RequestMapping(value="/csNoticeUpdate", method=RequestMethod.POST)
	public ModelAndView noticupdae(CsVo csVo) throws SQLException {
		System.out.println("/cs/csNoticeUpdate");
		ModelAndView mav=new ModelAndView();
		System.out.println(csVo.getNoticNo());
		
		
		csService.csUpdateOne(csVo);
		mav.addObject(csVo.getNoticNo());
		System.out.println(csVo.getNoticNo()+"+"+csVo.getSub());
		mav.setViewName("redirect:/mp/mng/csNoticeList");
		return mav;
	}
	
	//faq수정페이지 파라미터 넣기
		@RequestMapping(value="/csFaqUpdate",method=RequestMethod.POST)
		public ModelAndView faqupdae(CsVo csVo) throws SQLException {
			System.out.println("/cs/csFaqUpdate");
			ModelAndView mav=new ModelAndView();
			
			csService.csUpdateOne(csVo);
			System.out.println(csVo.getNoticNo()+"+"+csVo.getSub());
			mav.setViewName("redirect:/mp/mng/csFaqList");
			return mav;
		}
		
		
		/**
		 * @throws SQLException 
		* 회원 문의 답변유무
		* 
		* @param  
		* @return ModelAndView 
		* @author 강민수
		* @exception 
		*/
	/*
	 * @RequestMapping(value="/answer") public ModelAndView
	 * questAnswer(@RequestParam("pquestNo") String num,HttpSession session) throws
	 * SQLException{ System.out.println(num); ModelAndView mav=new ModelAndView();
	 * String userId=(String)session.getAttribute("loginUserId");
	 * mav.addObject("id", userId);
	 * mav.addObject("answer",csService.inqAnswer(num));
	 * mav.setViewName("redirect:/mp/mng/InqList"); return mav; }
	 */
		
		@RequestMapping(value="/csList")
		@ResponseBody
		public String csList(@RequestParam("param") String selected) {
			if(selected.equals("20")) {
				System.out.println("맞음");
			}else {
				System.out.println("틀림");
			}
			
			return selected;
		}
		
	/**
	* 1:1 문의
	* 
	* @param  String code - c : 1:1문의 등록 폼, R : 1:1문의 리스트
	* @return ModelAndView 
	* @author 강민수
	* @exception 
	*/
	@RequestMapping(value = "/csQuest", method = RequestMethod.GET)
	public ModelAndView getCsQuest(String code) {
		log.debug("1:1문의 리스트 컨트롤러");
		
		ModelAndView mav = new ModelAndView();
		if(code.equals("R")) {
			//R : 1:1문의 리스트 서비스 작성
			
		}else if(code.equals("C")) {
			//C : 1:1문의 등록 폼
			return new ModelAndView("/mp/manager/mngCsQuestAdd");
		}
		mav.setViewName("/mp/manager/mngCsQuestList");
		return mav;
	}

	/**
	* 1:1 문의 등록  
	* 
	* @param  ProductVo - 상품
	* @return ModelAndView 
	* @author 강민수
	* @exception 
	*/
	@RequestMapping(value = "/csQuest", method = RequestMethod.POST)
	public ModelAndView addCsQuest(ProductVo bean) {
		log.debug("1:1문의 등록 컨트롤러");
		
		//1:1문의 등록 서비스 작성
		
		ModelAndView mav = new ModelAndView("redirect:/mp/mng/csQuest");
		return mav;
	}
	
	//상세페이지 답글 등록
	@RequestMapping(value="/csInqReply")
	public ModelAndView addReply(@RequestParam("mbNo") String mbNo,@RequestParam("pquestNo") String pquestNo,@ModelAttribute CsVo csVo) throws SQLException {
		System.out.println("답글 컨트롤러");
		ModelAndView mav=new ModelAndView();
		
		csService.insertReply(csVo);
		csService.inqAnswer(pquestNo);
		
		mav.setViewName("redirect:/mp/mng/questDetail?pquestNo="+pquestNo+"&mbNo="+mbNo+"");
		return mav;
	}
	
	/**
	 * 1:1문의 상세보기
	 * 
	 * @param  HttpSession session  
	 * @param  CsVo csVo
	 * @param  String pquestNo
	 * @return ModelAndView 
	 * @author 강민수 
	 * 등록일자 : 2019-09-24
	 */
	@RequestMapping(value = "/questDetail")
	public ModelAndView myQuestDetail(HttpSession session, CsVo csVo,@RequestParam("pquestNo") String pquestNo) throws SQLException {
		
		ModelAndView mav = new ModelAndView();
		String user = (String) session.getAttribute("loginUserId");
		String mbNo = (String) session.getAttribute("loginMbNo");
		UserVo userVo = csService.userLevel(mbNo);
		String userLevel = userVo.getLevelGbCd();
		csVo.setPquestNo(pquestNo);
		
		csService.selectReply(csVo.getPquestNo());
		mav.addObject("levelGbCd",userLevel);
		mav.addObject("bean", mpUserService.myInqDetail(csVo));
		mav.addObject("reply", csService.selectReply(csVo.getPquestNo()));
		mav.addObject("id", user);
		mav.setViewName("mp/manager/mngQuestDetail");
		return mav;
	}
	
	/**
	 * 공지사항 상세보기
	 * 
	 * @param HttpSession session : get userId
	 * @param CsVo csVo 
	 * @return ModelAndView 
	 * @author 황인준
	 * 등록일자 : 2019-09-24
	 */
	@RequestMapping(value = "/mngCsNoticeDetail", method = RequestMethod.GET)
	public ModelAndView csNoticeDetail(HttpSession session, CsVo csVo) throws Exception {

		ModelAndView mav = new ModelAndView("mp/manager/mngCsNoticeDetail");
		String userId = (String) session.getAttribute("loginUserId");
		mav.addObject("id", userId);
		csService.csNoticeDetail(csVo);
		mav.addObject("adetail", csService.csNoticeDetail(csVo));

		return mav;

	}
	

	/**
	 * 공지사항 상세보기
	 * 
	 * @param HttpSession session : get userId
	 * @param CsVo csVo 
	 * @return ModelAndView 
	 * @author 강민수
	 * 등록일자 : 2019-09-24
	 */
	@RequestMapping(value = "/mngCsFaqDetail", method = RequestMethod.GET)
	public ModelAndView csFaqDetail(HttpSession session, CsVo csVo) throws Exception {
		
		ModelAndView mav = new ModelAndView("mp/manager/mngCsFaqDetail");
		String userId = (String) session.getAttribute("loginUserId");
		mav.addObject("id", userId);
		csService.csFaqDetail(csVo);
		mav.addObject("adetail", csService.csFaqDetail(csVo));
		
		return mav;
		
	}
	
	
	
}







