package item.dao;

import java.util.List;
import java.util.Map;

import item.bean.EventDTO;
import item.bean.ItemDTO;
import item.bean.Item_askDTO;
import item.bean.Item_detailDTO;
import item.bean.Item_infoDTO;
import item.bean.Item_reviewDTO;

public interface ItemDAO {

	public List<ItemDTO> getItemList();

	public List<Map<String, String>> getInfoList(Map<String, String> map);

	public int getTotalA(Map<String,String> map);
	
	public List<ItemDTO> getCategory();

	public List<ItemDTO> getImageList(String main_codename);

	public List<String> getSubList(String main_codename);

	public List<Map<String,String>> wishList(Map<String,String> map);

	public int getWishListCount(String id);
	
	public List<String> getColor(int seq);

	public List<String> getSize1(Map<String, String> map);

	public List<String> getSize2(Map<String, String> map);
	
	public ItemDTO getItemDTO(int seq);

	public List<String> checkMain_codename();

	public List<String> checkSub_codename(String main_codename);

	public List<Map<String,String>> getSerialMapper(String serial);
	
	public List<ItemDTO> getRecommendation(String main_codename);

	public int getSearchFormTotalA(String name);
	
	public List<Map<String, String>> getSearchFormList(Map<String, String> map);
	
	public void itemDelete(String[] seq);

	public List<ItemDTO> itemSearchList(Map<String, String> map);

	public void itemModify(Item_infoDTO item_infoDTO);

	public int getAllTotalA(Map<String, String> map);

	public List<Item_infoDTO> itemDetailList(int seq);

	public void item_infoDelete(String[] sub_seq);

	public void itemAdd(Map<String, String> map);

	public List<Map<String, String>> getBestImageList(String main_codename);

	public List<Map<String, String>> getBestInfoList(Map<String, String> map);

	public int getBestTotalA(Map<String, String> map);
	
	public List<Map<String,String>> reviewAvailableList(Map<String,String> map);
	
	public int reviewAvailableListTotalA(String id);
	
	public List<Map<String,String>> reviewList(Map<String,String> map);
	
	public int reviewListTotalA(String id);
	
	public Item_reviewDTO getReviewDetail(Map<String,String> map);
	
	public List<EventDTO> eventMainList(Map<String, String> map);
	
	public int getEventTotalA();

	public EventDTO eventDetailList(int seq);

	public void eventAdd(Map<String, String> map);

	public void itemViewReview(Map<String, String> map);
	
	public void itemDetailAdd(Map<String, String> map);

	public List<Map<String,String>> itemReviewList(Map<String, String> map);

	public int getItemReviewTotalA();

	public List<Map<String, String>> itemQnAList(Map<String, String> map);

	public int getItemQnATotalA();

	public void itemQnAModify(Map<String, String> map);

	public void discountModify(Map<String, String> map);

	public List<Item_askDTO> itemViewMid2List(Map<String, String> map);
	
	public int QnAGetTotal(Map<String, String> map);
	
	public int itemReviewGetTotal(Map<String, String> map);
	
	public void replyUpdate(Map<String, String> map);
	
	public void uploadQnAWrite(Map<String, String> map);
	
	public List<Map<String, String>> itemViewMid2ReviewList(Map<String, String> map);
	
	public List<Map<String, String>> CheckItemViewReview(Map<String, String> map);

	public void itemViewReview2(Map<String, String> map);

	public void MemberPoint(Map<String, String> map1);
	
	public List<Item_detailDTO> viewItemDetail(ItemDTO itemDTO);
	
	public void reviewOneDelete(Map<String, String> map);
	
	public List<Map<String, String>> getChartData();

	public int itemAskDelete(int seq);
}

