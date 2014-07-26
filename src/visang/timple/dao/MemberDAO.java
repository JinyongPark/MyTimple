package visang.timple.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import visang.timple.interfaces.ICommon;
import visang.timple.interfaces.IMember;
import visang.timple.model.MemberDTO;
import visang.timple.model.PaperDTO;

@Service("memberService")
public class MemberDAO implements IMember {

	@Autowired
	private ICommon cdao;
	
	@Override
	public ArrayList<Object> getOneCategory() {
		ArrayList<Object> list = new ArrayList<Object>();
		list = cdao.selectList("member.getOneCategory");
		return list;
	}

	@Override
	public ArrayList<Object> getTwoCategory(int oneCategorySeq) {
		return cdao.selectList("member.getTwoCategory", oneCategorySeq);
	}

	@Override
	public ArrayList<Object> getQuestion() {
		ArrayList<Object> list = new ArrayList<Object>();
		list = cdao.selectList("member.getQuestion");
		return list;
	}
	
	@Override
	public int emailCheck(String email) {
		return cdao.getIntValue("member.emailCheck", email);
	}
	
	@Override
	public int socialEmailCheck(MemberDTO mdto) {
		return cdao.getIntValue("member.socialEmailCheck", mdto);
	}
	
	@Override
	public MemberDTO login(HashMap<String, String> map) {
		return (MemberDTO) cdao.selectOne("member.login", map);
	}

	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, Object> getMemQuestion(HashMap<String, String> map) {
		return (HashMap<String, Object>) cdao.selectOne("member.getMemQuestion", map);
	}
	
	@Override
	public int quereplyCheck(HashMap<String, Object> map) {
		return cdao.getIntValue("member.quereplyCheck", map);
	}
	
	@Override
	public void resetPw(HashMap<String, Object> map) {
		cdao.update("member.resetPw", map);
	}
	
	@Override
	public void addMember(MemberDTO mdto) {
		cdao.insert("member.addMember", mdto);
	}

	@Override
	public void addSocialMember(MemberDTO mdto) {
		cdao.insert("member.addSocialMember", mdto);
	}
	
	@Override
	public void addMemberQuestion(HashMap<String, Object> map) {
		cdao.insert("member.addMemQuestion", map);
	}

	@Override
	public int getMemberId(String email) {
		return cdao.getIntValue("member.getMemberId", email);
	}

	@Override
	public int getMemberIdWithSocial(HashMap<String, Object> map) {
		return cdao.getIntValue("member.getMemberIdWithSocial", map);
	}

	@Override
	public int sendPaper(PaperDTO pdto) {
		return cdao.insert("member.sendPaper", pdto);
	}

	@Override
	public int getPaperId() {
		return cdao.getIntValue("member.getPaperId");
	}

	@Override
	public void addAcceptance(Integer paperId) {
		cdao.insert("member.addAcceptance", paperId);
	}

	@Override
	public Object getMemberInfo(Integer loginSeq) {
		return cdao.selectOne("member.getMemberInfo", loginSeq);
	}

	@Override
	public void editMember(MemberDTO mdto) {
		cdao.update("member.editMember", mdto);
	}

	@Override
	public void editMemQuestion(HashMap<String, Object> mqMap) {
		cdao.update("member.editMemQuestion", mqMap);
	}

	@Override
	public void editOccupation(HashMap<String, Object> oMap) {
		cdao.update("member.editOccupation", oMap);
	}

	@Override
	public int adminLogin(HashMap<String, Object> adMap) {
		return cdao.getIntValue("member.adminLogin", adMap);
	}

}
