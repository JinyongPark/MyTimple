package visang.timple.interfaces;

import java.util.ArrayList;
import java.util.HashMap;

import visang.timple.model.ProjectDTO;

public interface IProject {
	
	//프로젝트 생성하기
	void add(ProjectDTO dto);
	
	//최근 생성한 프로젝트 seq 가져오기
	String seq();
	
	//프로젝트 타이틀 가져오기
	String title(String seq);
	
	//프로젝트 전체 진행률 가져오기
	float percent(String seq);
	
	//오늘의 일정 가져오기
	ArrayList<Object> list(HashMap<String, String> map);
	
	//BP 진행률 가져오기
	float bpercent(HashMap<String, String> map2);
	
	

	

}
