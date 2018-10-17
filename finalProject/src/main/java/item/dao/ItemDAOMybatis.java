package item.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import item.bean.EventDTO;
import item.bean.ItemDTO;
import item.bean.Item_askDTO;
import item.bean.Item_detailDTO;
import item.bean.Item_infoDTO;
import item.bean.Item_reviewDTO;

@Transactional
@Component
public class ItemDAOMybatis implements ItemDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<ItemDTO> getItemList() {
		return sqlSession.selectList("itemSQL.getItemList");
	}

	public List<Map<String, String>> getInfoList(Map<String, String> map) {
		return sqlSession.selectList("itemSQL.getInfoList", map);
	}

	public int getTotalA(Map<String,String> map) {
		return sqlSession.selectOne("itemSQL.getTotalA", map);
	}
	
	public List<ItemDTO> getCategory() {	
		return sqlSession.selectList("itemSQL.getCategory");
	}

	public List<ItemDTO> getImageList(String main_codename) {
		return sqlSession.selectList("itemSQL.getImageList", main_codename);
	}

	public List<String> getSubList(String main_codename) {
		return sqlSession.selectList("itemSQL.getSubList", main_codename);
	}


	public List<Map<String,String>> wishList(Map<String,String> map) {
		return sqlSession.selectList("itemSQL.wishList", map);
	}


	public int getWishListCount(String id) {
		return sqlSession.selectOne("itemSQL.getWishListCount", id);
	}
	
	//itemView
	public List<String> getColor(int seq) {
		return sqlSession.selectList("itemSQL.getColor", seq);
	}

	public List<String> getSize1(Map<String, String> map) {
		return sqlSession.selectList("itemSQL.getSize1", map);
	}
	
	
	public List<String> getSize2(Map<String, String> map) {
		return sqlSession.selectList("itemSQL.getSize2", map);
	}
	
	public ItemDTO getItemDTO(int seq) {
		return sqlSession.selectOne("itemSQL.getItemDTO", seq);
	}

	public List<String> checkMain_codename() {
		return sqlSession.selectList("itemSQL.checkMain_codename");
	}

	public List<String> checkSub_codename(String main_codename) {
		return sqlSession.selectList("itemSQL.checkSub_codename", main_codename);
	}
	
	public List<Map<String,String>> getSerialMapper(String serial) {
		return sqlSession.selectList("itemSQL.getSerialMapper", serial);
	}
	
	//상품 검색
	public List<ItemDTO> getRecommendation(String main_codename) {
		return sqlSession.selectList("itemSQL.getRecommendation", main_codename);
	}

	public int getSearchFormTotalA(String name) {
		return sqlSession.selectOne("itemSQL.getSearchFormTotalA", name);
	}

	public List<Map<String, String>> getSearchFormList(Map<String, String> map) {
		return sqlSession.selectList("itemSQL.getSearchFormList", map);
	}
	
	public void itemDelete(String[] seq) {
		for(int i=0; i<seq.length; i++){
			sqlSession.delete("itemSQL.itemDelete",seq[i]);
		}
	}

	public List<ItemDTO> itemSearchList(Map<String, String> map) {
		return sqlSession.selectList("itemSQL.itemSearchList", map);
	}

	public void itemModify(Item_infoDTO item_infoDTO) {
		sqlSession.update("itemSQL.itemModify",item_infoDTO);
	}

	public int getAllTotalA(Map<String, String> map) {
		return sqlSession.selectOne("itemSQL.getAllTotalA",map);
	}

	public List<Item_infoDTO> itemDetailList(int seq) {
		return sqlSession.selectList("itemSQL.itemDetailList", seq);
	}

	public void item_infoDelete(String[] sub_seqs) {
		for(int i=0; i<sub_seqs.length; i++){
			String sub_seq = sub_seqs[i];
			sqlSession.delete("itemSQL.item_infoDelete",sub_seq);
		}
	}

	public void itemAdd(Map<String, String> map) {
		sqlSession.insert("itemSQL.itemAdd",map);
	}

	public List<Map<String,String>> getBestImageList(String main_codename) {
		return sqlSession.selectList("itemSQL.getBestImageList", main_codename);
	}

	public List<Map<String,String>> getBestInfoList(Map<String, String> map) {
		return sqlSession.selectList("itemSQL.getBestInfoList", map);
	}

	public int getBestTotalA(Map<String, String> map) {
		return sqlSession.selectOne("itemSQL.getBestTotalA",map);
	}

	//리뷰 작성 가능 리스트
	public List<Map<String,String>> reviewAvailableList(Map<String,String> map) {
		return sqlSession.selectList("itemReviewSQL.reviewAvailableList", map);
	}
	public int reviewAvailableListTotalA(String id) {
		return sqlSession.selectOne("itemReviewSQL.reviewAvailableListTotalA", id);
	}
	//작성한 리뷰 리스트
	public List<Map<String,String>> reviewList(Map<String,String> map) {
		return sqlSession.selectList("itemReviewSQL.reviewList", map);
	}
	public int reviewListTotalA(String id) {
		return sqlSession.selectOne("itemReviewSQL.reviewListTotalA", id);
	}
	//리뷰 상세보기
	public Item_reviewDTO getReviewDetail(Map<String,String> map) {
		return sqlSession.selectOne("itemReviewSQL.getReviewDetail", map);
	}
	
	//-------------
	public List<EventDTO> eventMainList(Map<String, String> map) {
		return sqlSession.selectList("itemSQL.eventMainList", map);
	}

	public int getEventTotalA() {
		return sqlSession.selectOne("itemSQL.getEventTotalA");
	}

	public EventDTO eventDetailList(int seq) {
		return sqlSession.selectOne("itemSQL.eventDetailList", seq);
	}

	public void eventAdd(Map<String, String> map) {
		sqlSession.insert("itemSQL.eventAdd",map);
		
	}

	public void itemViewReview(Map<String, String> map) {
		sqlSession.insert("itemSQL.itemViewReview",map);
	}
	
	public void itemDetailAdd(Map<String, String> map) {
		sqlSession.insert("itemSQL.itemDetailAdd",map);
	}

	public List<Map<String,String>> itemReviewList(Map<String, String> map) {
		return sqlSession.selectList("itemReviewSQL.itemReviewList",map);
	}

	public int getItemReviewTotalA() {
		return sqlSession.selectOne("itemReviewSQL.getItemReviewTotalA");
	}

	public List<Map<String, String>> itemQnAList(Map<String, String> map) {
		return sqlSession.selectList("itemSQL.itemQnAList",map);
	}

	public int getItemQnATotalA() {
		return sqlSession.selectOne("itemSQL.getItemQnATotalA");
	}

	public void itemQnAModify(Map<String, String> map) {
		sqlSession.update("itemSQL.itemQnAModify",map);
	}

	public void discountModify(Map<String, String> map) {
		sqlSession.update("itemSQL.discountModify",map);
	}
	
	//itemViewMid2
	public List<Item_askDTO> itemViewMid2List(Map<String, String> map) {
		return sqlSession.selectList("itemSQL.itemViewMid2List",map);
	}
	
	public int QnAGetTotal(Map<String, String> map) {
		return sqlSession.selectOne("itemSQL.QnAGetTotal",map);
	}
	
	public int itemReviewGetTotal(Map<String, String> map) {
		return sqlSession.selectOne("itemSQL.itemReviewGetTotal",map);
	}
	
	public void replyUpdate(Map<String, String> map) {
		sqlSession.update("itemSQL.replyUpdate", map);	
	}
	
	public void uploadQnAWrite(Map<String, String> map) {
		sqlSession.insert("itemSQL.uploadQnAWrite", map);	
	}
	
	public List<Map<String, String>> itemViewMid2ReviewList(Map<String, String> map) {
		return sqlSession.selectList("itemSQL.itemViewMid2ReviewList",map);
	}
	
	public List<Map<String, String>> CheckItemViewReview(Map<String, String> map) {
		return sqlSession.selectList("itemReviewSQL.CheckItemViewReview",map);
	}

	public void itemViewReview2(Map<String, String> map) {
		sqlSession.insert("itemReviewSQL.itemViewReview2",map);
	}

	public void MemberPoint(Map<String, String> map1) {
		sqlSession.update("itemReviewSQL.MemberPoint",map1);
	}
	//itemView-상품설명
	public List<Item_detailDTO> viewItemDetail(ItemDTO itemDTO) {
		return sqlSession.selectList("itemSQL.viewItemDetail", itemDTO);
	}
	
	public void reviewOneDelete(Map<String, String> map) {
		sqlSession.delete("itemReviewSQL.reviewOneDelete",map);
	}
	
	public List<Map<String, String>> getChartData() {
		return sqlSession.selectList("itemSQL.getChartData");
	}

	public int itemAskDelete(int seq) {
		return sqlSession.delete("itemSQL.itemAskDelete", seq);
	}
	
}
