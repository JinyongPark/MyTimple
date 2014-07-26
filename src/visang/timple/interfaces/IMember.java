package visang.timple.interfaces;

import java.util.ArrayList;
import java.util.HashMap;

import visang.timple.model.MemberDTO;
import visang.timple.model.PaperDTO;

public interface IMember {
	
	public ArrayList<Object> getOneCategory();
	public ArrayList<Object> getTwoCategory(int oneCategorySeq);
	public ArrayList<Object> getQuestion();
	
	public int emailCheck(String email);										// 이메일 존재 여부 체크
	public int socialEmailCheck(MemberDTO mdto);
	public MemberDTO login(HashMap<String, String> map);
	
	public HashMap<String, Object> getMemQuestion(HashMap<String, String> map);	// 비밀번호 찾기 질문을 가져온다.
	public int quereplyCheck(HashMap<String, Object> map);						// 비밀번호 찾기 질문에 대한 답변이 맞는지 체크한다.
	public void resetPw(HashMap<String, Object> map);
	
	public void addMember(MemberDTO mdto);
	public void addSocialMember(MemberDTO mdto);
	public void addMemberQuestion(HashMap<String, Object> map);
	
	public int getMemberId(String email);
	public int getMemberIdWithSocial(HashMap<String, Object> map);
	
	public int sendPaper(PaperDTO pdto);
	public int getPaperId();
	public void addAcceptance(Integer paperId);
	
	public Object getMemberInfo(Integer loginSeq);
	
	public void editMember(MemberDTO mdto);
	public void editMemQuestion(HashMap<String, Object> mqMap);
	public void editOccupation(HashMap<String, Object> oMap);
	
	public int adminLogin(HashMap<String, Object> adMap);
}