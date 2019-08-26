package com.me.rentalme.used.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.me.rentalme.model.entity.UsedCmtVo;
import com.me.rentalme.model.entity.UsedVo;
import com.me.rentalme.used.service.UsedService;


/**
* 중고거래 컨트롤러
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.18
*/
@Controller
@RequestMapping("/used")
public class UsedController {

	Logger log = LoggerFactory.getLogger(getClass());
	
	@Inject
	UsedService usedService;
	/**
	 * @throws SQLException 
	* 중고거래 리스트
	* 
	* @param  None
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String getUsedList(Model model) throws SQLException {
		
		log.debug("중고거래 컨트롤러");
		UsedVo bean=new UsedVo();
		bean.setModelNm("");
		bean.setGdsMclassCd("10");
		model.addAttribute("alist1", usedService.oneList(bean));
		bean.setGdsMclassCd("20");
		model.addAttribute("alist2", usedService.oneList(bean));
		bean.setGdsMclassCd("30");
		model.addAttribute("alist3", usedService.oneList(bean));
		bean.setGdsMclassCd("40");
		model.addAttribute("alist4", usedService.oneList(bean));
		bean.setGdsMclassCd("50");
		model.addAttribute("alist5", usedService.oneList(bean));
		System.out.println(bean.getBrandNm());
		return "used/usedList";
	}
	
	//검색기능
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String getUsedListNM(Model model,@RequestParam("modelNm") String modelNm,@RequestParam("align") String align) throws SQLException {
		
		log.debug("중고거래 검색 컨트롤러");
		UsedVo bean=new UsedVo();
		if(modelNm==null) {
			modelNm="";
		}
		bean.setModelNm(modelNm);
		bean.setAlign(align);
		bean.setGdsMclassCd("10");
		model.addAttribute("alist1", usedService.oneList(bean));
		bean.setGdsMclassCd("20");
		model.addAttribute("alist2", usedService.oneList(bean));
		bean.setGdsMclassCd("30");
		model.addAttribute("alist3", usedService.oneList(bean));
		bean.setGdsMclassCd("40");
		model.addAttribute("alist4", usedService.oneList(bean));
		bean.setGdsMclassCd("50");
		model.addAttribute("alist5", usedService.oneList(bean));
		return "used/usedList";
	}

	/**
	 * @throws SQLException 
	* 중고거래 상세보기
	* 
	* @param  int idx
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/detail/{idx}", method = RequestMethod.GET)
	public String getUsedDetail(Model model, @PathVariable("idx") String usedGdsNo) throws SQLException {
		
		model.addAttribute("UsedVo", usedService.detail(usedGdsNo));
		model.addAttribute("cmt", usedService.cmtList(usedGdsNo));
		return "used/usedDetail";
	}
	@RequestMapping(value = "/cmtAdd", method = RequestMethod.POST)
	public String getUsedCmtAdd(@ModelAttribute UsedCmtVo bean) throws SQLException {
		
		usedService.addCmt(bean);
		return "redirect:/used/detail/"+bean.getUsedGdsNo();
	}
	
	
	/**
	* 나의 중고상점 리스트
	* 
	* @param  None
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/store", method = RequestMethod.GET)
	public ModelAndView getUsedMyStroe() {
		
		
		ModelAndView mav = new ModelAndView("used/usedMyStore");
		return mav;
	}
	
	@RequestMapping(value = "/store/reviewinsert", method = RequestMethod.GET)
	public String getUsedMyStroeReviewInsert() {
		
		
		return "redirect:/used/store";
	}
	
	/**
	* 중고거래 상품등록 폼
	* 
	* @param  None
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mng", method = RequestMethod.GET)
	public ModelAndView getUsedPrd() {
		
		
		ModelAndView mav = new ModelAndView("used/usedMng");
		return mav;
	}
	
	/**
	 * @throws SQLException 
	* 중고거래 상품등록 
	* 
	* @param  None
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mng", method = RequestMethod.POST)
	public String addUsedPrd(MultipartHttpServletRequest mtfRequest,@ModelAttribute UsedVo bean) throws SQLException {
		
		int cnt=1; //이미지 카운트
		
		String currentTime=System.currentTimeMillis()+"";
		//String uploadDir="C:\\Users\\USER\\git\\RentalMe\\RentalMe\\src\\main\\webapp\\imgs\\";
		String uploadDir="C:\\java\\3rdProject\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RentalMe\\imgs\\";
		String uploadRDS="/imgs/";
		List<MultipartFile> fileList = mtfRequest.getFiles("imgfile");
        String src = mtfRequest.getParameter("src");
        System.out.println("src value : " + src);

        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + originFileName);
            System.out.println("fileSize : " + fileSize);

            String fName=currentTime + originFileName;
            
            String safeFile = uploadDir+fName;
            String img=uploadRDS+fName;
            try {
                mf.transferTo(new File(safeFile));
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            if(cnt==1) {
            	bean.setImg1(img);
            	cnt++;
            }else if(cnt==2) {
            	bean.setImg2(img);
            	cnt++;
            }else if(cnt==3) {
            	bean.setImg3(img);
            	cnt++;
            }else if(cnt==4) {
            	bean.setImg4(img);
            }
        }
        
		// 시퀀스 1증가
		usedService.seqUp();
		usedService.addUsed(bean);
		
		return "used/usedMyStore";
	}
//	@RequestMapping(value = "/mng", method = RequestMethod.POST)
//	public String addUsedPrd(MultipartHttpServletRequest mtfRequest,UsedVo bean,
//			@RequestParam("GDS_LCLASS_CD") String gDS_LCLASS_CD,
//			@RequestParam("GDS_MCLASS_CD") String gDS_MCLASS_CD,
//			@RequestParam("GDS_SCLASS_CD") String gDS_SCLASS_CD,
//			@RequestParam("BRAND_NM") String bRAND_NM,
//			@RequestParam("MODEL_NM") String mODEL_NM,
//			@RequestParam("SUB") String sUB,
//			@RequestParam("USED_GDS_PRICE") int uSED_GDS_PRICE,
//			@RequestParam("CONTENT") String cONTENT) throws SQLException {
//		
//		bean=new UsedVo();
//		
//		bean.setGDS_LCLASS_CD(gDS_LCLASS_CD);
//		bean.setGDS_MCLASS_CD(gDS_MCLASS_CD);
//		bean.setGDS_SCLASS_CD(gDS_SCLASS_CD);
//		bean.setBRAND_NM(bRAND_NM);
//		bean.setMODEL_NM(mODEL_NM);
//		bean.setSUB(sUB);
//		bean.setUSED_GDS_PRICE(uSED_GDS_PRICE);
//		bean.setCONTENT(cONTENT);
//		
//		int cnt=1; //이미지 카운트
//		
//		String currentTime=System.currentTimeMillis()+"";
//		String uploadDir="C:\\Users\\USER\\git\\RentalMe\\RentalMe\\src\\main\\webapp\\imgs\\";
//		String uploadRDS="/imgs/";
//		List<MultipartFile> fileList = mtfRequest.getFiles("imgfile");
//		String src = mtfRequest.getParameter("src");
//		System.out.println("src value : " + src);
//		
//		for (MultipartFile mf : fileList) {
//			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
//			long fileSize = mf.getSize(); // 파일 사이즈
//			
//			System.out.println("originFileName : " + originFileName);
//			System.out.println("fileSize : " + fileSize);
//			
//			String fName=currentTime + originFileName;
//			
//			String safeFile = uploadDir+fName;
//			String img=uploadRDS+fName;
//			try {
//				mf.transferTo(new File(safeFile));
//			} catch (IllegalStateException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			if(cnt==1) {
//				bean.setIMG1(img);
//				cnt++;
//			}else if(cnt==2) {
//				bean.setIMG2(img);
//				cnt++;
//			}else if(cnt==3) {
//				bean.setIMG3(img);
//				cnt++;
//			}else if(cnt==4) {
//				bean.setIMG4(img);
//			}
//		}
//		
//		// 시퀀스 1증가
//		usedService.seqUp();
//		usedService.addUsed(bean);
//		
//		return "used/usedMyStore";
//	}
	
	
//	@RequestMapping(value = "/mng", method = RequestMethod.POST)
//	public ModelAndView addUsedPrd(UsedVo bean) throws SQLException {
//		
//		// 시퀀스 1증가
//		usedService.seqUp();
//		usedService.addUsed(bean);
//		
//		ModelAndView mav = new ModelAndView("used/usedMyStore");
//		return mav;
//	}
	
	/**
	 * 중고거래 상품수정
	 * 
	 * @param  None
	 * @return ModelAndView 
	 * @author 황인준
	 * @exception 
	 */
	@RequestMapping(value = "/mng", method = RequestMethod.PUT)
	public ModelAndView modifyUsedPrd() {
		
		
		ModelAndView mav = new ModelAndView("used/usedMyStore");
		return mav;
	}

}
