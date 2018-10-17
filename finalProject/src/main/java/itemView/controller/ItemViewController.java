package itemView.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.conf.DefaultPaging;

import item.bean.ItemDTO;
import item.bean.Item_askDTO;
import item.bean.Item_detailDTO;
import item.dao.ItemDAO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

@RequestMapping(value="itemView")
@Controller
public class ItemViewController {
	@Autowired
	private ItemDAO itemDAO;
	@Autowired
	private MemberDAO memberDAO;

	@RequestMapping(value="itemViewTop",method=RequestMethod.GET)
	public String loginForm(@RequestParam String seq, Model model) {
		ItemDTO itemDTO = itemDAO.getItemDTO(Integer.parseInt(seq));
		model.addAttribute("itemDTO", itemDTO);
		model.addAttribute("display", "/itemView/itemViewTop.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="itemViewReviewForm",method=RequestMethod.POST)
	public String itemViewReviewForm(@RequestParam String seq, @RequestParam String serial, Model model) {
		
		model.addAttribute("seq",seq);
		model.addAttribute("serial", serial);
		model.addAttribute("display", "/itemView/itemViewReviewForm.jsp");
		return "/main/index";
	}
	
	//check
	@RequestMapping(value="checkMain_codename", method=RequestMethod.GET)
	public ModelAndView checkMain_codename() {
		ModelAndView mav = new ModelAndView();
		List<String> list = itemDAO.checkMain_codename();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="checkSub_codename", method=RequestMethod.GET)
	public ModelAndView checkSub_codename(@RequestParam String main_codename) {
		ModelAndView mav = new ModelAndView();
		List<String> list = itemDAO.checkSub_codename(main_codename);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//상품옵션 컬러 가져오기
	@RequestMapping(value="getColor", method=RequestMethod.POST)
	public ModelAndView getColor(@RequestParam String seq) {
		List<String> list = itemDAO.getColor(Integer.parseInt(seq));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	//상품 사이즈1 가져오기
	@RequestMapping(value="getSize1", method=RequestMethod.POST)
	public ModelAndView getSize1(@RequestParam Map<String,String> map ) {
		List<String> list = itemDAO.getSize1(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	//상품사이즈2 가져오기
	@RequestMapping(value="getSize2", method=RequestMethod.POST)
	public ModelAndView getSize2(@RequestParam Map<String,String> map ) {
		List<String> list = itemDAO.getSize2(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	//상품명,사진,가격, 세일 가격 가져오기
	@RequestMapping(value="getProductDetail", method=RequestMethod.POST)
	public ModelAndView getProductDetail(@RequestParam String seq) {
		ItemDTO itemDTO = itemDAO.getItemDTO(Integer.parseInt(seq)); 
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("itemDTO", itemDTO);
		mav.setViewName("jsonView");
		return mav;
	}
	//가격 및 수량 체크
	@RequestMapping(value="getTotalPrice", method=RequestMethod.POST)
	public ModelAndView getTotalPrice() {
		//ItemDTO itemDTO = itemDAO.getItemDTO(Integer.parseInt(seq)); 
		
		ModelAndView mav = new ModelAndView();
		//mav.addObject("itemDTO", itemDTO);
		mav.setViewName("jsonView");
		return mav;
		
	}
	
	//상품 코드 가져오기
	@RequestMapping(value="getProductCode", method=RequestMethod.POST)
	public ModelAndView getProductCode(@RequestParam String seq) {
		ItemDTO itemDTO = itemDAO.getItemDTO(Integer.parseInt(seq)); 
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("itemDTO", itemDTO);
		mav.setViewName("jsonView");
		return mav;
	}
	//로그인시 다시 아이템뷰 페이지로 이동
	@RequestMapping(value="/itemViewTop.do",method=RequestMethod.GET)
	public String itemViewTop(@RequestParam String seq, Model model, HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		ItemDTO itemDTO = itemDAO.getItemDTO(Integer.parseInt(seq)); 
		
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("itemDTO", itemDTO);
		model.addAttribute("display", "/itemView/itemViewTop.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="itemViewReview",method=RequestMethod.POST)
	public String itemViewReview(@RequestParam Map<String,String> map
								 ,@RequestParam MultipartFile image
								 ,Model model
								 ,HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		map.put("id", memberDTO.getId());		
		
		String filePath = session.getServletContext().getRealPath("/image/review/");		
		String fileName = image.getOriginalFilename();
		
		if(fileName!=null && !fileName.equals("")) {
			File file = new File(filePath,fileName);
			
			try {
				FileCopyUtils.copy(image.getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}		
		map.put("image", fileName != null?fileName:"");
		
		itemDAO.itemViewReview(map);
		if(map.get("comments").length()>=30 && !fileName.equals("")) {
			map.put("point", 1500+"");
		}else if(map.get("comments").length()>=30 && fileName.equals("")) {
			map.put("point", 500+"");
		}else if(map.get("comments").length() < 30) {
			map.put("point", 100+"");
		}
		
		memberDAO.updatePoint(map);
		
		session.setAttribute("memberDTO", memberDAO.getMember(memberDTO.getId()));
		
		return "redirect:/myPage/myReview.do";
	}
	
	//QNA  페이징 처리
	@RequestMapping(value="itemViewMid2List.do")
	public ModelAndView itemViewMid2List(@RequestParam(required=false,defaultValue="1") String pg,
										 @RequestParam(required=false,defaultValue="") String category
										 , @RequestParam String seq) {
											
		int endNum=Integer.parseInt(pg)*10;
		int startNum=endNum-9;
		
		Map<String, String> map=new HashMap<String,String>();
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		map.put("category", category);
		map.put("seq", seq);
		
		int total=itemDAO.QnAGetTotal(map);
		
		List<Item_askDTO> list = itemDAO.itemViewMid2List(map);
		
		DefaultPaging paging = new DefaultPaging();
		paging.setCurrentPage(Integer.parseInt(pg));
		paging.setPageBlock(3);
		paging.setPageSize(10);
		paging.setTotalA(total);
		paging.makePagingHTML();

		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pg", pg);
		mav.addObject("paging",paging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//상품문의 등록
	@RequestMapping(value="uploadQnAWrite",method=RequestMethod.POST)
	@ResponseBody
	public String uploadQnAWrite(@RequestParam(required=false) Map<String,String> map,
							Model model, HttpSession session ) {
	//System.out.println(map);
	map.put("reply", ""); //reply, except
		itemDAO.uploadQnAWrite(map);
		
		return "ok";
	}
	
	//item_review list
	@RequestMapping(value="itemViewMid2ReviewList",method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView itemViewMid2ReviewList(@RequestParam(required=false,defaultValue="1") String pg,
											   @RequestParam(required=false) String seq ) {
		
		int endNum=Integer.parseInt(pg)*10;
		int startNum=endNum-9;
		
		Map<String, String> map=new HashMap<String,String>();
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		map.put("seq", seq );
		
		int total=itemDAO.itemReviewGetTotal(map);
		
		List<Map<String,String>> list = itemDAO.itemViewMid2ReviewList(map);
		//System.out.println(list);
		
		DefaultPaging paging = new DefaultPaging();
		paging.setCurrentPage(Integer.parseInt(pg));
		paging.setPageBlock(3);
		paging.setPageSize(10);
		paging.setTotalA(total);
		paging.makePagingHTML();

		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pg", pg);
		mav.addObject("paging",paging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//로그인과, 상품구매를 한사람만 아이템 리뷰를 쓰도록 체크
	@RequestMapping(value="CheckItemViewReview",method=RequestMethod.POST)
	public ModelAndView CheckItemViewReview(@RequestParam Map<String,String> map) {
		List<Map<String,String>> mapList = itemDAO.CheckItemViewReview(map);
							
		ModelAndView mav = new ModelAndView();
		mav.addObject("mapList",mapList);
		mav.setViewName("jsonView");									
		return mav;	
	}
		

		
	//아이템 리뷰
	@ResponseBody
	@RequestMapping(value="itemViewReview2",method=RequestMethod.POST)
	public String itemViewReview2(@RequestParam Map<String,String> map
							,MultipartHttpServletRequest multi
							,HttpSession session
							)throws IOException {
	
		String id="";
		int point=0;
		int commentCnt=0;
		String fileName=null;
		InputStream inputStream=null;
		String newFileName="";
	  
		List<MultipartFile> mf = multi.getFiles("img");
		for(int i = 0; i<mf.size();i++) {
			fileName = mf.get(i).getOriginalFilename();
			inputStream = mf.get(i).getInputStream();
			String filePath=session.getServletContext().getRealPath("/image/review/");
		  
			if(fileName.equals("")) fileName="";
		
			newFileName =fileName;
		
			File file=new File(filePath, newFileName);
			if(newFileName != "") {
				FileCopyUtils.copy(inputStream, new FileOutputStream(file));
			}
			map.put("img", newFileName);
		}
		  
		  Iterator<String> keys = map.keySet().iterator();
		  while(keys.hasNext()) {
			  String key = keys.next();
			  
			  if(key.equals("id")) {
				  id= map.get(key);
			  }
			  
			  if(key.equals("comments")) { 
				  if(map.get(key).length()>=30) { 
					  commentCnt=30;
				  }else { 
					  commentCnt=0;
					  point=100;
				  }
			  }
			  
			  if(key.equals("img")&& commentCnt!=0) {
				  if(newFileName.equals("")) {
					  point+=500;									  									  
				  }else if(!newFileName.equals("")){
					  point+=1500;
				  }
			  }		 
		  }
	      		         
         Map<String,String> map1 = new HashMap<String,String>();
         map1.put("point", String.valueOf(point));
         map1.put("id", id);
         
         itemDAO.itemViewReview2(map);
         itemDAO.MemberPoint(map1);
         
         session.setAttribute("memberDTO", memberDAO.getMember(id));
		
		return "등록성공";
	}
	
	//상품설명
	@ResponseBody
	@RequestMapping(value="getItemDetail", method=RequestMethod.POST)
	public ModelAndView viewItemDetail(@RequestParam(required=false) String seq) {
		
		ItemDTO itemDTO = itemDAO.getItemDTO(Integer.parseInt(seq));
		
		List<Item_detailDTO> list = itemDAO.viewItemDetail(itemDTO);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//작성한 리뷰 삭제
	@RequestMapping(value="itemReviewDelete", method=RequestMethod.POST)
	public ModelAndView itemReviewDelete(@RequestParam Map<String,String> map) {
	   itemDAO.reviewOneDelete(map);
	   
	   ModelAndView mav = new ModelAndView();
	   mav.setViewName("jsonView");
	   return mav;
	}
	
	//작성한 QnA 삭제
	@RequestMapping(value="itemAskDelete", method=RequestMethod.POST)
	@ResponseBody
	public String itemAskDelete(@RequestParam String seq) {
		int su = itemDAO.itemAskDelete(Integer.parseInt(seq));
		
		if(su==1) 
			return "ok";
		else
			return "fail";
	}
}
