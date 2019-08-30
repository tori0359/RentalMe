package com.me.rentalme.mp.user.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.me.rentalme.cs.entity.CsVo;
import com.me.rentalme.model.entity.CallVo;
import com.me.rentalme.model.entity.UserVo;
import com.me.rentalme.mp.user.service.MpUserService;
import com.me.rentalme.mp.user.service.MpUserServiceImpl;

/**
* 마이페이지 컨트롤러
* 
* @author 황인준
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
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getOrderList() throws SQLException {
		log.debug("주문내역 리스트 컨트롤러...");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("alist",mpUserService.ordList());
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
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public ModelAndView getCartList() throws SQLException {
		log.debug("장바구니 컨트롤러...");
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("alist",mpUserService.cartList());
		mav.setViewName("mp/user/userCartList");
		return mav;
	}	
	
	/**
	 * @throws SQLException 
	* 찜한 상품
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/wish", method = RequestMethod.GET)
	public ModelAndView getWishList(Model model) throws SQLException {
		//log.debug("찜한상품 컨트롤러...");
		
		ModelAndView mav = new ModelAndView();
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
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/deposit", method = RequestMethod.GET)
	public ModelAndView getDeposit(CallVo callVo) throws SQLException {
		log.debug("예치금 컨트롤러...");
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("alist", mpUserService.depositList());
		
		
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
	* 내 정보 수정 폼
	* 
	* @param  
	* @return String 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/updInfo", method = RequestMethod.GET)
	public String modifyInfo() {
		log.debug("내 정보 수정 폼 컨트롤러...");
		
		return "mp/user/userUpdInfo";
	}

	
	/**
	* 내 정보 수정
	* 
	* @param  UserVo
	* @return String 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/updInfo", method = RequestMethod.PUT)
	public String modifyInfo(UserVo bean) {
		log.debug("내 정보 수정 컨트롤러...");
	
		return "mp/user/userUpdInfo";
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
		String useId=(String)session.getAttribute("loginUserId");
		ModelAndView mav = new ModelAndView();
			System.out.println("dd");
		mpUserService.myList(csVo, session);
		
		mav.addObject("mylist", mpUserService.myList(csVo, session));
		System.out.println("list뽑고 넘기기");
		
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
	* @author 황인준
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
	* @author 황인준
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
