package visang.timple.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mysql.fabric.xmlrpc.base.Array;

import visang.timple.interfaces.ICommon;
import visang.timple.interfaces.ITeamMain;
import visang.timple.model.TeamBusinessDTO;

@Service("teamMainService")
public class TeamMainDAO implements ITeamMain{
	
	@Autowired
	public ICommon cdao;
	
	
	public ArrayList<Object> printList(String bpid) {
		ArrayList<Object> list = cdao.selectList("teamMain.printList", bpid);		
		return list;
	} // 업무리스트 가져오기
	
	
	public TeamBusinessDTO businessDetail(String businessid) {
		TeamBusinessDTO bdto = null;		
		bdto = (TeamBusinessDTO) cdao.selectOne("teamMain.businessDetail", businessid);	
		
		return bdto;	
	}
	
	
	public ArrayList<Object> businessDataList(String businessid) {
		ArrayList<Object> list = null;		
		list = cdao.selectList("teamMain.businessDataList", businessid);	
		
		return list;	
	}
	
	
	public void deleteBusinessFile(String fileName) {
		cdao.delete("teamMain.deleteBusinessFile", fileName);		
	}
	
	
	public String BPNamebyBusiness(String businessid) {
		String result = "Business Process";
		result = (String) cdao.selectOne("teamMain.BPNamebyBusiness", businessid);
		return result;
	}

	
	public String BPNamebyBP(String BPid) {
		String result = (String) cdao.selectOne("teamMain.BPNamebyBP", BPid);
		return result;
	}
	public ArrayList<Object> statusSelector() {
		ArrayList<Object> list = null;
		list = cdao.selectList("teamMain.statusSelector");
		return list;
	}

	public void addBusiness(HashMap<String, Object> map) {
		
		cdao.insert("teamMain.addBusiness1", map); // 업무테이블 추가
		
		String businessid = (String) cdao.selectOne("teamMain.addBusiness2");		
		
		HashMap<String, Object> eachMap = new HashMap<String, Object>();
			eachMap.put("businessid", businessid);			// 업무번호	
			eachMap.put("bpId", map.get("bpId"));			// BP번호
			eachMap.put("chargePersonId",map.get("chargePersonId"));	// 팀원번호
			
			cdao.insert("teamMain.addBusiness3", eachMap);
		
		// 업무로그 남기기
		HashMap<String, Object> logMap = new HashMap<String, Object>(); 
		logMap.put("selStatus", map.get("selStatus"));
		logMap.put("businessid", businessid);
		
		cdao.insert("addBusiness4", logMap);
	}

	public String rankConfirm(String bpId) {
		String memberid = "0"; 
		memberid = (String) cdao.selectOne("teamMain.rankConfirm", bpId);		
		
		return memberid;
	}

	public ArrayList<Object> searchBpMem(String bpId) {
		ArrayList<Object> list = cdao.selectList("teamMain.searchBpMem", bpId);
		return list;
	}

	public String getTeamSeq(HashMap<String, Object> cmap) {
		String teamSeq = (String) cdao.selectOne("teamMain.getTeamSeq", cmap);
		return teamSeq;
	}

	public ArrayList<Object> findBusinessPerson(String businessid) {
		ArrayList<Object> list = cdao.selectList("teamMain.findBusinessPerson", businessid);		
		return list;
	}

	public void editBusiness(HashMap<String, Object> map) {
		
		cdao.update("teamMain.editBusiness1", map);				
		
		String businessid = (String) map.get("businessid");
			
		// 업무로그 남기기
		HashMap<String, Object> logMap = new HashMap<String, Object>(); 
		logMap.put("selStatus", map.get("editState"));
		logMap.put("businessid", businessid);
		
		cdao.insert("addBusiness4", logMap);	
		
	}

	public void deleteBusiness(String businessid) {
		cdao.delete("teamMain.deleteBusiness1", businessid);	// 자료 삭제	
		cdao.delete("teamMain.deleteBusiness2", businessid);	// 댓글 삭제
		cdao.delete("teamMain.deleteBusiness3", businessid);	// 로그 삭제
		cdao.delete("teamMain.deleteBusiness4", businessid);	// 담당자 삭제
		cdao.delete("teamMain.deleteBusiness5", businessid);	// 업무 삭제
	}


	public String findBpid(String businessid) {
		String bpid = (String) cdao.selectOne("teamMain.findBpid", businessid);
		return bpid;
	}


	public void addAlarm(HashMap<String, Object> alarmMap) {
		cdao.insert("teamMain.addAlarm", alarmMap);		
	}


	public void insertBusinessComment(HashMap<String, Object> map) {
		cdao.insert("teamMain.insertBusinessComment", map);		
	}


	public String findTeamSeq(HashMap<String, Object> fmap) {
		String teamid = (String) cdao.selectOne("teamMain.findTeamSeq", fmap);
		return teamid;		
	}


	public ArrayList<Object> commentList(String businessid) {
		ArrayList<Object> list = cdao.selectList("teamMain.commentList", businessid);
		return list;
	}


	public void deleteBusinessComment(String businesscommentid) {
		cdao.delete("teamMain.deleteBusinessComment", businesscommentid);
	}
			
}
