package visang.timple.interfaces;

import java.util.ArrayList;

public interface IBbs {
	
	// 게시물 공지사항 3개 가져오기
	public ArrayList<Object> list1();
	
	// 게시물 추천 3개 가져오기
	public ArrayList<Object> list2();
	
	// 게시물 목록 10개 가져오기
	public ArrayList<Object> list3();
	
}
