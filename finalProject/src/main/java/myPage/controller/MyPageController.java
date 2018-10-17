package myPage.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.conf.DefaultPaging;

import buyList.bean.BuyListDTO;
import buyList.bean.myPointPaging;
import buyList.bean.myUsedPointPaging;
import buyList.dao.BuyListDAO;
import item.bean.Item_reviewDTO;
import item.dao.ItemDAO;
import member.bean.MemberDTO;
import member.bean.WishListPaging;
import member.dao.MemberDAO;
import refundRequest.bean.RefundRequestDTO;
import refundRequest.bean.RefundRequestPaging;
import refundRequest.dao.RefundRequestDAO;

@RequestMapping(value="myPage")
@Component
public class MyPageController {
	@Autowired
	private ItemDAO itemDAO;
	@Autowired
	private BuyListDAO buyListDAO;
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private RefundRequestDAO refundRequestDAO;
	@Autowired
	private RefundRequestPaging refundRequestPaging;
	
	//마이페이지 메인화면
	@RequestMapping(value="myPageIndex", method=RequestMethod.GET)
	public String myPageIndex(Model model, HttpSession session) {
		MemberDTO login = (MemberDTO)session.getAttribute("memberDTO");
		
		List<Map<String,String>> list = buyListDAO.get5BuyList(login.getId());
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", login.getId());
		map.put("startNum", "1");
		map.put("endNum", "10");
		
		List<Map<String,String>> wishList = itemDAO.wishList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("wishList", wishList);
		model.addAttribute("myPageBody", "/myPage/myPageBody.jsp");
		model.addAttribute("display","/myPage/myPageIndex.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="getSerialCount", method=RequestMethod.POST)
	public ModelAndView getSerialCount(@RequestParam String serial) {
		Map<String, Integer> map = buyListDAO.getSerialCount(serial);
		ModelAndView mav = new ModelAndView();
		mav.addObject("count", map.get("TOTALCOUNT"));
		mav.addObject("price", map.get("TOTALPRICE"));
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//주문배송조회
	@RequestMapping(value="tracking", method=RequestMethod.GET)
	public String tracking(@RequestParam(required=false, defaultValue="1") String pg, Model model, HttpSession session) {
		int currentPage = Integer.parseInt(pg);
		int pageSize = 5;
		int endNum = pageSize*currentPage;
		int startNum = endNum-pageSize+1;
		
		MemberDTO login = (MemberDTO)session.getAttribute("memberDTO");
		Map<String,String> map = new HashMap<String,String>();
		map.put("id",login.getId());
		map.put("status", "");
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		List<BuyListDTO> list = buyListDAO.getBuyList(map);
		
		int totalA = buyListDAO.getDeliveryTotalA(map);
		
		DefaultPaging paging = new DefaultPaging();
		paging.setCurrentPage(currentPage);
		paging.setPageSize(pageSize);
		paging.setPageBlock(3);
		paging.setTotalA(totalA);
		paging.makePagingHTML();
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("myPageBody", "/myPage/tracking.jsp");
		model.addAttribute("display","/myPage/myPageIndex.jsp");
		return "/main/index";
	}
	
	//주문번호에 해당하는 아이템 로딩
	@RequestMapping(value="getSerialMapper", method=RequestMethod.POST)
	public ModelAndView getSerialMapper(@RequestParam String serial) {
		List<Map<String,String>> list = itemDAO.getSerialMapper(serial);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//주문상세내역
	@RequestMapping(value="trackingDetail", method=RequestMethod.GET)
	public String trackingDetail(@RequestParam(required=false) String serial, Model model) {
		if(serial!=null) {
			BuyListDTO buyListDTO = buyListDAO.getOneBuylist(serial);
			model.addAttribute("buyListDTO", buyListDTO);
		}
		
		model.addAttribute("myPageBody", "/myPage/trackingDetail.jsp");
		model.addAttribute("display","/myPage/myPageIndex.jsp");
		return "/main/index";
	}
	
	//취소.교환.반품 내역
	@RequestMapping(value="modifyList", method=RequestMethod.GET)
	public String modifyList(@RequestParam(required=false, defaultValue="1") String pg, Model model) {
		
		model.addAttribute("pg", pg);
		model.addAttribute("myPageBody", "/myPage/modifyList.jsp");
		model.addAttribute("display","/myPage/myPageIndex.jsp");
		return "/main/index";
	}
	
	//위시리스트
	@RequestMapping(value="wishList", method=RequestMethod.GET)
	public String wishList(@RequestParam(required=false, defaultValue="1") String pg, Model model, HttpSession session) {
		int currentPage = Integer.parseInt(pg);
		int pageSize = 20;
		int endNum = pageSize*currentPage;
		int startNum = endNum-pageSize+1;
		
		MemberDTO login = (MemberDTO)session.getAttribute("memberDTO");
		
		if(login!=null) {
			Map<String,String> map = new HashMap<String,String>();
			map.put("startNum", startNum+"");
			map.put("endNum", endNum+"");		
			map.put("id", login.getId());
		
			int totalA = itemDAO.getWishListCount(login.getId()); 
			
			WishListPaging paging = new WishListPaging();
			paging.setCurrentPage(currentPage);
			paging.setPageBlock(3);
			paging.setPageSize(pageSize);
			paging.setTotalA(totalA);
			paging.makePagingHTML();		
					
			List<Map<String,String>> list = itemDAO.wishList(map);
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
		}	
		
		model.addAttribute("myPageBody", "/myPage/wishList.jsp");
		model.addAttribute("display","/myPage/myPageIndex.jsp");
		return "/main/index";
	}
	
	//상품후기 내역
	@RequestMapping(value="myReview", method=RequestMethod.GET)
	public String myReview(@RequestParam(required=false,defaultValue="1") String pg, HttpSession session, Model model) {
		model.addAttribute("myPageBody", "/myPage/myReview.jsp");
		model.addAttribute("display","/myPage/myPageIndex.jsp");
		return "/main/index";
	}
	
	//상품후기 페이지처리
	@RequestMapping(value="reviewRefresh", method=RequestMethod.POST)
	public ModelAndView reviewRefresh(@RequestParam Map<String,String> map) {
		ModelAndView mav = new ModelAndView();
		
		int currentPage = Integer.parseInt(map.get("pg"));
		int pageSize = 10;
		int endNum = pageSize*currentPage;
		int startNum = endNum-pageSize+1;
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		if(map.get("status").equals("작성내역")) {
			int reviewListTotalA = itemDAO.reviewListTotalA(map.get("id"));
			List<Map<String,String>> reviewList = itemDAO.reviewList(map);
			DefaultPaging reviewListPaging = new DefaultPaging();
			reviewListPaging.setCurrentPage(currentPage);
			reviewListPaging.setPageBlock(3);
			reviewListPaging.setPageSize(pageSize);
			reviewListPaging.setTotalA(reviewListTotalA);
			reviewListPaging.makePagingHTML();
			
			mav.addObject("list", reviewList);
			mav.addObject("paging", reviewListPaging);
		}else if(map.get("status").equals("상품후기 쓰기")) {
			int reviewAvailableListTotalA = itemDAO.reviewAvailableListTotalA(map.get("id"));
			List<Map<String,String>> list = itemDAO.reviewAvailableList(map);
			DefaultPaging reviewAvailableListPaging = new DefaultPaging();
			reviewAvailableListPaging.setCurrentPage(currentPage);
			reviewAvailableListPaging.setPageBlock(3);
			reviewAvailableListPaging.setPageSize(pageSize);
			reviewAvailableListPaging.setTotalA(reviewAvailableListTotalA);
			reviewAvailableListPaging.makePagingHTML();
			
			mav.addObject("list", list);
			mav.addObject("paging", reviewAvailableListPaging);
		}
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	//상품후기 상세보기
	@RequestMapping(value="reviewDetail", method=RequestMethod.POST)
	public ModelAndView reviewDetail(@RequestParam Map<String,String> map, HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		map.put("id", memberDTO.getId());
		
		Item_reviewDTO item_reviewDTO = itemDAO.getReviewDetail(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("item_reviewDTO", item_reviewDTO);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//후기 삭제
	@ResponseBody
	@RequestMapping(value="reviewDelete", method=RequestMethod.POST)
	public String reviewDelete(@RequestParam Map<String, String> map, HttpSession session) {
		itemDAO.reviewOneDelete(map);
		
		return "ok";
	}
	
	//마일리지현황
	@RequestMapping(value="myPoint", method=RequestMethod.GET)
	public String myPoint(Model model) {
		model.addAttribute("myPageBody", "/myPage/myPoint.jsp");
		model.addAttribute("display","/myPage/myPageIndex.jsp");
		return "/main/index";
	}
	
	//회원등급
	@RequestMapping(value="grade", method=RequestMethod.GET)
	public String grade(Model model) {
		model.addAttribute("myPageBody", "/myPage/grade.jsp");
		model.addAttribute("display","/myPage/myPageIndex.jsp");
		return "/main/index";
	}
	
	//최근 5개월 구매 횟수,가격
	@RequestMapping(value="buyListCount", method=RequestMethod.POST)
	public ModelAndView buyListCount(@RequestParam Map<String,String> map) {		
		Map<String, Integer> grade = buyListDAO.getBuyListCount(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("grade", grade);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//취소/교환/반품내역 목록 띄우기 
	@RequestMapping(value="viewModifyList", method=RequestMethod.POST)
	public ModelAndView viewModifyList(@RequestParam(required=false, defaultValue="1") String pg
									   ,HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		
		//1페이지당 10개씩
		int endNum = Integer.parseInt(pg)*10;
		int startNum = endNum-9;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("endNum", endNum+"");
		map.put("startNum", startNum+"");
		map.put("id", memberDTO.getId());
		
		List<RefundRequestDTO> list = refundRequestDAO.viewModifyList(map);
		
		//페이징처리
		int totalA=refundRequestDAO.getrefundRequestTotalA(map);
		
		refundRequestPaging.setCurrentPage(Integer.parseInt(pg));
		refundRequestPaging.setPageBlock(3);
		refundRequestPaging.setPageSize(10);
		refundRequestPaging.setTotalA(totalA);
		refundRequestPaging.makePagingHTML(); 
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("refundRequestPaging", refundRequestPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//주문취소/교환/반품 type에 따라서 띄우기
	@RequestMapping(value="viewModifyList_orderType", method=RequestMethod.POST)
	public ModelAndView vieworderType(@RequestParam(required=false, defaultValue="") String type 
													,@RequestParam(required=false, defaultValue="1") String pg
													,HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		
		//1페이지당 10개씩
		int endNum = Integer.parseInt(pg)*10;
		int startNum = endNum-9;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("endNum", endNum+"");
		map.put("startNum", startNum+"");
		map.put("type", type);
		map.put("id", memberDTO.getId());
		
		List<RefundRequestDTO> list = refundRequestDAO.vieworderType(map);
		
		//페이징처리
		int totalA=refundRequestDAO.getorderTypeTotalA(map);
		
		refundRequestPaging.setCurrentPage(Integer.parseInt(pg));
		refundRequestPaging.setPageBlock(3);
		refundRequestPaging.setPageSize(10);
		refundRequestPaging.setTotalA(totalA);
		refundRequestPaging.makePagingHTML(); 
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("refundRequestPaging", refundRequestPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//주문취소
	@RequestMapping(value="trackingCancel", method=RequestMethod.GET)
	public String trackingCancel(@RequestParam String serial ,Model model) {
		List<Map<String,String>> list = itemDAO.getSerialMapper(serial);
		
		model.addAttribute("list", list);
		model.addAttribute("myPageBody", "/myPage/trackingCancel.jsp");
		model.addAttribute("display","/myPage/myPageIndex.jsp");
		return "/main/index";
	}
	
	//주문취소 집어넣기
   @RequestMapping(value="trackingCancelInsert", method=RequestMethod.POST)
   public ModelAndView trackingCancelInsert(@RequestParam String[] serial
                                 ,@RequestParam String[] startDate
                                 ,@RequestParam String[] count
                                 ,@RequestParam String[] seq
                                 ,@RequestParam String[] color
                                 ,@RequestParam String[] size1
                                 ,@RequestParam String[] size2
                                 ,HttpSession session) {
      MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
      
      //List<Map<String,String>> list = new ArrayList<Map<String,String>>();
      
      Map<String,String> insertMap = new HashMap<String, String>();
      insertMap.put("id", memberDTO.getId());
      insertMap.put("serial", serial[0]);
      insertMap.put("startDate", startDate[0]);
      
      refundRequestDAO.trackingCancelInsert(insertMap);
      
	  for(int i=0; i < seq.length; i++) {
	     Map<String,String> map = new HashMap<String, String>();
	     map.put("id", memberDTO.getId());
	     map.put("count", count[i]);
	     map.put("seq", seq[i]);
	     map.put("color", color[i]);
	     map.put("size1", size1[i]);
	     map.put("size2", !size2[i].equals("-") ? size2[i] : "");
	     //list.add(map);
	     refundRequestDAO.trackingCancelList(map);
	  }
      
      ModelAndView mav = new ModelAndView();
      mav.setViewName("jsonView");
      return mav;
   }
	
	//주문취소완료
	@RequestMapping(value="trackingCancelOk", method=RequestMethod.GET)
	public String trackingCancelOk(Model model) {
		model.addAttribute("myPageBody", "/myPage/trackingCancelOk.jsp");
		model.addAttribute("display","/myPage/myPageIndex.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="myPointInfo", method=RequestMethod.POST)
	public ModelAndView myPointInfo(@RequestParam Map<String,String> map) {
		int pg = 1;
		if(!map.get("pg").equals("")) pg = Integer.parseInt(map.get("pg"));
		
		int pageSize = 3;
		int endNum = pageSize*pg;
		int startNum = endNum-pageSize+1;
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		int totalA =  buyListDAO.getPointTotalA(map);
		
		myPointPaging paging = new myPointPaging();
		paging.setCurrentPage(pg);
		paging.setPageBlock(3);
		paging.setPageSize(pageSize);
		paging.setTotalA(totalA);
		paging.makePagingHTML();
		
		List<Map<String, String>> mapList = new ArrayList<Map<String,String>>();
		mapList = buyListDAO.myPointInfo(map);
		
		int totalPoint = buyListDAO.getTotalPoint(map.get("id"));
		int totalUsedPoint = buyListDAO.getTotalUsedPoint(map.get("id"));

		ModelAndView mav = new ModelAndView();
		mav.addObject("paging", paging);
		mav.addObject("totalPoint", totalPoint);
		mav.addObject("totalUsedPoint", totalUsedPoint);
		mav.addObject("mapList",mapList);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="myUsedPointInfo", method=RequestMethod.POST)
	public ModelAndView myUsedPointInfo(@RequestParam Map<String,String> map) {		
		int pg = 1;
		if(!map.get("pg").equals("")) pg = Integer.parseInt(map.get("pg"));
		
		int pageSize = 3;
		int endNum = pageSize*pg;
		int startNum = endNum-pageSize+1;
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		int totalA =  buyListDAO.getUsedPointTotalA(map);
		
		myUsedPointPaging usedPaging = new myUsedPointPaging();
		usedPaging.setCurrentPage(pg);
		usedPaging.setPageBlock(3);
		usedPaging.setPageSize(pageSize);
		usedPaging.setTotalA(totalA);
		usedPaging.makeUsedPagingHTML();
		
		List<Map<String, String>> mapList = new ArrayList<Map<String,String>>();
		mapList = buyListDAO.myUsedPointInfo(map);

		ModelAndView mav = new ModelAndView();
		mav.addObject("paging", usedPaging);
		mav.addObject("mapList",mapList);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="guestTracking")
	public String guestTracking(@RequestParam Map<String,String> map, Model model) {
		MemberDTO memberDTO = memberDAO.getGuest(map);
		BuyListDTO buyListDTO = buyListDAO.getOneBuylist(map.get("serial"));
		
		model.addAttribute("serial", map.get("serial"));
		model.addAttribute("logtime", new SimpleDateFormat("yyyy-MM-dd").format(memberDTO.getLogtime()));
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("buyListDTO", buyListDTO);
		model.addAttribute("display", "/myPage/trackingDetail.jsp");
		return "/main/index";
	}

	@RequestMapping(value="orderList")
	public ModelAndView orderList(HttpSession session, @RequestParam String serial, @RequestParam(required=false) String id) {
		ModelAndView mav = new ModelAndView();
		if(id!=null) {
			MemberDTO memberDTO = memberDAO.getMember(id);
			mav.addObject("memberDTO", memberDTO);
		}
		List<Map<String, String>> list = buyListDAO.getOrderList(serial);
		mav.addObject("list", list);
		mav.setViewName("/myPage/orderList");
		
		return mav;
	}
}
