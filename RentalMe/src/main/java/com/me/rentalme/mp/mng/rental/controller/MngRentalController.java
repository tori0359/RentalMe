package com.me.rentalme.mp.mng.rental.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.me.rentalme.model.entity.ActVo;
import com.me.rentalme.model.entity.ProductVo;
import com.me.rentalme.model.entity.RentalAppliVo;
import com.me.rentalme.mp.mng.service.MngService;

/**
* 마이페이지(관리자) 등록 컨트롤러
* 
* @author 황인준
* @version ver1.0 
* 등록일자 : 2019.08.14
*/
@Controller
@RequestMapping("/mp")
public class MngRentalController {

	@Inject
	MngService mngService;
	Logger log = LoggerFactory.getLogger(getClass());
	
	/**
	* 마이페이지(관리자) - 상품등록 폼
	* 
	* @param  
	* @return String 
	* @author 강민수
	* @exception 
	*/
	@RequestMapping(value = "/mng/rentalAddPage", method = RequestMethod.GET)
	public ModelAndView getPrdRegisterForm() {
		log.debug("마이페이지(관리자) 상품 등록 폼 컨트롤러");
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("mp/manager/mngRentalAdd");
		
		
		return mav;
	}
	
	/**
	* 마이페이지(관리자) - 상품등록 
	* 
	* @param  String prdDiv - 중분류
	* @return ModelAndView
	* @author 강민수
	* @exception 
	*/
	@RequestMapping(value = "/mng/rentalInsert", method = RequestMethod.POST)
	public ModelAndView getRentalList(
			MultipartHttpServletRequest mtfRequest,@ModelAttribute RentalAppliVo rentalAppliVo,@ModelAttribute ProductVo productVo) {
		log.debug("마이페이지(관리자) 상품 등록 컨트롤러");
		
		//System.out.println("상품코드"+rentalAppliVo.getGdsCd());
		System.out.println("상품대분류"+rentalAppliVo.getGdsLclassCd());
		System.out.println("상품중분류"+rentalAppliVo.getGdsMclassCd());
		System.out.println("상품이름"+rentalAppliVo.getGdsNm());
		System.out.println("브랜드"+rentalAppliVo.getBrandNm());
		System.out.println("모델이름"+rentalAppliVo.getModelNm());
		System.out.println("상품상태"+rentalAppliVo.getGdsGbCd());
		
		String product="10";
		productVo.setPrdCode(product.concat(rentalAppliVo.getGdsMclassCd()).concat(rentalAppliVo.getGdsSclassCd()));	//gds200 상품번호
		System.out.println(productVo.getPrdCode());
		System.out.println("상품코드"+productVo.getPrdCode());
		System.out.println("계약기간"+productVo.getPrdContDate());
		System.out.println("배송비"+productVo.getPrdDeliveryCost());
		System.out.println("설치비"+productVo.getPrdInstCost());
		System.out.println("AS내용"+productVo.getPrdAsContent());
		
		int cnt=1;
		String currentTime=System.currentTimeMillis()+"";
		
		String uploadDir="C:\\java\\workspace4\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\RentalMe\\imgs\\";
//		String uploadDir="/var/lib/tomcat8/webapps/rentalme/imgs/";
		String uploadRDS="/imgs/";
		
		List<MultipartFile> fileList = mtfRequest.getFiles("imgfile");
		
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
	              
	                e.printStackTrace();
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	            if(cnt==1) {
	            	productVo.setImg1(img);
	            	cnt++;
	            }else if(cnt==2) {
	            	productVo.setImg2(img);
	            	cnt++;
	            }else if(cnt==3) {
	            	productVo.setImg3(img);
	            	cnt++;
	            }else if(cnt==4) {
	            	productVo.setImg4(img);
	            	cnt++;
	            }else if(cnt==5) {
	            	productVo.setImg5(img);
					cnt++;
				}else if(cnt==6) {
					productVo.setImg6(img);
					cnt++;
				}else if(cnt==7) {
					productVo.setImg7(img);
					cnt++;
				}else if(cnt==8) {
					productVo.setImg8(img);
					cnt++;
				}else if(cnt==9) {
					productVo.setImg9(img);
					cnt++;
				}else if(cnt==10) {
					productVo.setImg10(img);
					cnt++;
				}else if(cnt==11) {
					productVo.setImg11(img);
					cnt++;
				}else if(cnt==12) {
					productVo.setImg12(img);
				}
	           
	            
	        }
		 
		mngService.rentalseq();
		mngService.rentalGoodsAdd100(rentalAppliVo);
		mngService.rentalGoodsAdd200(productVo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/mp/mng/goodsList");
		return mav;
	}
	
	//ajax를 이용한 select박스 값 가져오기
	@ResponseBody
	@RequestMapping(value="/mng/searchScSelect")
	public long searchScList(@RequestParam("param") String sGoodsNum,@RequestParam("param2") String mGoodsNum) throws SQLException{
		
		long a=mngService.selectNum(mGoodsNum,sGoodsNum);
		System.out.println("결과는?:"+a);
		
		System.out.println(sGoodsNum);
		return a;
	}
	
	//ajax를 이용한 select박스 값 가져오기
	@RequestMapping(value="/mng/searchSelect",produces = "application/json; charset=utf-8")
	public void searchMcSelect(HttpServletRequest req, HttpServletResponse res, String param){
		System.out.println("분류컨트롤러");
		res.setCharacterEncoding("utf-8");
		System.out.println("controller"+param);
		try {
			String classifi=param;
			System.out.println("중분류"+classifi);
			List<String> goodsList=new ArrayList<String>();
			 if(classifi.equals("10")) {
	        	 goodsList.add("에어컨");
	        	 goodsList.add("냉난방기");
	        	 goodsList.add("냉장고");
	        	 goodsList.add("TV");
	        	 goodsList.add("세탁기");
	        	 goodsList.add("빨래건조기");
	        	 goodsList.add("공기청정기");
	        	 goodsList.add("복합기/프린터");
	         }
	         else if(classifi.equals("20")) {
	        	 goodsList.add("커피머신");
	        	 goodsList.add("제습기");
	        	 goodsList.add("청소기");
	        	 goodsList.add("드라이어");
	        	 goodsList.add("빔프로젝터");
	        	 goodsList.add("컴퓨터/노트북");
	        	 goodsList.add("비데");
	        	 goodsList.add("면도기");
	         }
	         else if(classifi.equals("30")) {
	        	 
	        	 goodsList.add("음식물처리기");
	        	 goodsList.add("제빙기");
	        	 goodsList.add("전자레인지");
	        	 goodsList.add("컴퓨터/에어프라이어");
	        	 goodsList.add("오븐");
	         }
	         else if(classifi.equals("40")) {
	        	 
	        	 goodsList.add("침대");
	        	 goodsList.add("매트리스");
	        	 goodsList.add("쇼파");
	        	 goodsList.add("책상");
	         }
	         else if(classifi.equals("50")) {
	        	 goodsList.add("악기");
	        	 goodsList.add("명품");
	        	 goodsList.add("귀금속");
	         }
	         else if(classifi.equals("60")) {
	        	 goodsList.add("침실패키지");
	        	 goodsList.add("주방패키지");
	        	 goodsList.add("욕실패키지");
	        	 goodsList.add("기타패키지");
	         }
			 org.json.JSONArray jsonArray=new org.json.JSONArray();
			 
			 for(int i=0; i<goodsList.size(); i++) {
		            jsonArray.put(goodsList.get(i).toString());
		     }
		         
		         
		         PrintWriter pw = res.getWriter();
		         pw.print(jsonArray.toString());
		         pw.flush();
		         pw.close();
		}catch(Exception e){
	         System.out.println("ajax error");
	    }
	   
		
	}
	
}
