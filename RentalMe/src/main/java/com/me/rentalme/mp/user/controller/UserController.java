package com.me.rentalme.mp.user.controller;

import java.sql.SQLException;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.me.rentalme.cs.entity.CsVo;
import com.me.rentalme.model.entity.CallVo;
import com.me.rentalme.model.entity.UserVo;
import com.me.rentalme.mp.user.service.MpUserService;

/**
* 마이페이지 컨트롤러
* 
* @author 신지영
* @version ver1.0
* @see 
* 등록일자 : 2019.08.14
*/
@Controller
@RequestMapping("/mp")
public class UserController {
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	@Inject
	MpUserService mpUserService;
	
	/**
	 * @throws SQLException 
	* 주문내역
	* 
	* @param  
	* @return ModelAndView 
	* @author 신지영
	* @exception 
	*/
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getOrderList(HttpSession session) throws SQLException {
		log.debug("주문내역 리스트 컨트롤러...");
		
		//세션에서 mbno를 불러와서 이름 가져오기
		String mbNo = (String) session.getAttribute("loginMbNo");
		ModelAndView mav = new ModelAndView();
		mav.addObject("alist",mpUserService.ordList(mbNo));
		mav.addObject("userVo",mpUserService.getName(mbNo));
		mav.setViewName("mp/user/userOrdList");
		
		return mav;
	}
	
	/**
	 * @throws SQLException 
	* 주문내역> 후기등록
	* 
	* @param  
	* @return ModelAndView 
	* @author 신지영
	* @exception 
	*/
	@RequestMapping(value = "/review", method = RequestMethod.POST)
	public ModelAndView addReview(CallVo callVo) throws SQLException {
		log.debug("후기등록 컨트롤러...");
		
		mpUserService.addReview(callVo);
		
		

		ModelAndView mav = new ModelAndView("redirect:/mp/");
		
		return mav;
	}
	
	
	/**
	 * @throws SQLException 
	* 장바구니
	* 
	* @param  
	* @return ModelAndView 
	* @author 신지영
	* @exception 
	*/
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public ModelAndView getCartList(HttpSession session) throws SQLException {
		log.debug("장바구니 컨트롤러...");
		
		//세션에서 mbno를 불러와서 이름 가져오기
		String mbNo = (String) session.getAttribute("loginMbNo");
		ModelAndView mav = new ModelAndView();
		mav.addObject("userVo",mpUserService.getName(mbNo));
		
		
		mav.addObject("alist",mpUserService.cartList(mbNo));
		mav.setViewName("mp/user/userCartList");
		return mav;
	}	
	
	/**
	 * @throws SQLException 
	* 찜한 상품
	* 
	* @param  
	* @return ModelAndView 
	* @author 신지영
	* @exception 
	*/
	@RequestMapping(value = "/wish", method = RequestMethod.GET)
	public ModelAndView getWishList(Model model,HttpSession session) throws SQLException {
		//log.debug("찜한상품 컨트롤러...");
		
		//세션에서 mbno를 불러와서 이름 가져오기
		String mbNo = (String) session.getAttribute("loginMbNo");
		ModelAndView mav = new ModelAndView();
		mav.addObject("userVo",mpUserService.getName(mbNo));
		
		mav.addObject("alist", mpUserService.wishList());
		mav.setViewName("mp/user/userWishList");
		return mav;
	}
	
	/**
	 * @throws SQLException 
	* 찜한 상품 삭제 (너무 어려움......보류)
	* 
	* @param  
	* @return ModelAndView 
	* @author 신지영
	* @exception 
	*/
//	@RequestMapping(value = "/wish/delete", method = RequestMethod.POST)
//	public int deleTeWish(HttpSession session, @RequestParam(value="checkRow[]") List<String> chArr, CallVo callVo) throws Exception{
//		
//		log.debug("delete wish");
//		
//		int result=0;
//		String usedGdsNo = "";
//		
//		for(String i : chArr) {
//			callVo.setUsedGdsNo(usedGdsNo);
//			mpUserService.deleteWish(callVo);
//		}
//		
//		result=1;
//		return result;
//	}
	
//	@RequestMapping(value = "/wish/delete", method = RequestMethod.POST)
//	public String deleteWish(@PathVariable("used")) {
//		
//		return null;
//		
//	}
//	
	/**
	 * @throws SQLException 
	* 예치금
	* 
	* @param  
	* @return ModelAndView 
	* @author 신지영
	* @exception 
	*/
	@RequestMapping(value = "/deposit", method = RequestMethod.GET)
	public ModelAndView getDeposit(CallVo callVo, HttpSession session) throws SQLException {
		log.debug("예치금 컨트롤러...");
	
		ModelAndView mav = new ModelAndView();
		String mbNo = (String) session.getAttribute("loginMbNo");
		mav.addObject("userVo",mpUserService.getName(mbNo));
		
		
		//현재 예치금금액으로 update
		mpUserService.updateDeposit();
		
		mav.addObject("alist", mpUserService.depositList());
		mav.addObject("callVo",mpUserService.userInfoList());
		
		mav.setViewName("mp/user/userDeposit");
		return mav;
		
	}	
	@RequestMapping(value = "/deposit", method = RequestMethod.POST)
	public ModelAndView insertDeposit(CallVo callVo) throws SQLException {
		log.debug("예치금 충전 컨트롤러...");
	
		mpUserService.insertCharge(callVo);
		
		
		ModelAndView mav = new ModelAndView("redirect:/mp/deposit");
		return mav;
	}	
	
	/**
	 * @throws SQLException 
	* 내 정보 수정 폼
	* 
	* @param  
	* @return String 
	* @author 신지영
	* @exception 
	*/
	@RequestMapping(value = "/updInfo", method = RequestMethod.GET)
	public ModelAndView modifyInfo(UserVo userVo, HttpSession session) throws SQLException {
		log.debug("내 정보 수정 폼 컨트롤러...");
		
		//세션에 저장되어있는 회원번호를 변수에 저장
		String mbNo= (String) session.getAttribute("loginMbNo");
		
		
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("userVo",mpUserService.userInfo(mbNo));
		
		
		
		
		
		
		mav.setViewName("mp/user/userUpdInfo");
		
		return mav;
	}

	
	/**
	 * @throws SQLException 
	* 내 정보 수정
	* 
	* @param  UserVo
	* @return String 
	* @author 신지영
	* @exception 
	*/
	@RequestMapping(value = "/updInfo", method = RequestMethod.POST)
	public String modifyInfo2(UserVo userVo,HttpSession session ) throws SQLException {
		log.debug("내 정보 수정 컨트롤러...");
		
		//세션에 저장되어있는 회원번호를 변수에 저장
		String mbNo= (String) session.getAttribute("loginMbNo");
		System.out.println(mbNo);
		
		mpUserService.myinfo(mbNo,userVo);
		//이름 등록시 세션에 이름 저장하기
		session.setAttribute("loginUserNM", userVo.getUserNM());
		
		
		
		return "redirect:/mp/updInfo";
	}
	/**
	 * @throws SQLException 
	* 경매내역
	* 
	* @param  
	* @return ModelAndView 
	* @author 신지영
	* @exception 
	*/
	@RequestMapping(value = "/auctList", method = RequestMethod.GET)
	public ModelAndView getAuctList(HttpSession session) throws SQLException {
		log.debug("경매내역 보기 컨트롤러...");
		
		//세션에서 mbno를 불러와서 이름 가져오기
		String mbNo = (String) session.getAttribute("loginMbNo");
		ModelAndView mav = new ModelAndView();
		mav.addObject("userVo",mpUserService.getName(mbNo));
		
		
		mav.addObject("alist",mpUserService.AuctList(mbNo));
		
		mav.setViewName("mp/user/userAuctList");
		return mav;
	}
	
	/**
	 * @throws SQLException 
	* 내 문의 보기
	* 
	* @param  
	* @return ModelAndView 
	* @author 강민수
	* @exception 
	*/
	@RequestMapping(value = "/mp/quest", method = RequestMethod.GET)
	public ModelAndView getQuestList(CsVo csVo,HttpSession session) throws SQLException {
		log.debug("내 문의 보기 컨트롤러...");
		
		ModelAndView mav = new ModelAndView();
		mpUserService.myList(csVo, session);
		
		mav.addObject("mylist", mpUserService.myList(csVo, session));
		
		mav.setViewName("mp/user/userQuestList");
		return mav;
	}
	
	/**
	 * @throws SQLException 
	* 내 문의 상세
	* 
	* @param  
	* @return ModelAndView 
	* @author 강민수
	* @exception 
	*/
	@RequestMapping(value="/mp/questDetail")
	public ModelAndView myQuestDetail(HttpSession session,CsVo csVo) throws SQLException{
		String user=(String)session.getAttribute("loginUserId");
		ModelAndView mav=new ModelAndView();
		mav.addObject("bean",mpUserService.myInqDetail(csVo));
		mav.addObject("id", user);
		mav.setViewName("mp/user/userQuestDetail");
		return mav;
	}
	
	/**
	 * @throws SQLException 
	* 내 문의 삭제
	* 
	* @param  
	* @return ModelAndView 
	* @author 강민수
	* @exception 
	*/
	@RequestMapping(value="/mp/QuestDelete")
	public ModelAndView myQuestDe(@RequestParam("pquestNo") String pquestNo, @RequestParam("mbNo") String mbNo,HttpSession session) throws SQLException{
		
		CsVo csVo=new CsVo();
		csVo.setMbNo(mbNo);
		csVo.setPquestNo(pquestNo);
		ModelAndView mav=new ModelAndView();
		mpUserService.myQuestDel(csVo);
		mav.setViewName("redirect:/mp//mp/quest");
		return mav;
	}
	/**
	* 나의 중고 상점
	* 
	* @param  
	* @return ModelAndView 
	* @author 신지영
	* @exception 
	*/
	@RequestMapping(value = "/used", method = RequestMethod.GET)
	public ModelAndView getUsedList() {
		log.debug("나의 중고 상점 컨트롤러...");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mp/user/userMyUsedList");
		return mav;
	}
	
	/**
	* 거래내역
	* 
	* @param  
	* @return ModelAndView 
	* @author 신지영
	* @exception 
	*/
	@RequestMapping(value = "/act", method = RequestMethod.GET)
	public ModelAndView getActList() {
		log.debug("내 활동 보기 컨트롤러...");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mp/user/userActList");
		return mav;
	}

}
