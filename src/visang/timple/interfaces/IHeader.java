package visang.timple.interfaces;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import visang.timple.model.FriendsListDTO;
import visang.timple.model.MemoDTO;
import visang.timple.model.NotiListDTO;
import visang.timple.model.PaperListDTO;
import visang.timple.model.ProjectMemberDTO;

public interface IHeader {
	public List<ProjectMemberDTO> getMyProject(int memberId);
	public ArrayList<Object> getMember(int memberId);
	public List<FriendsListDTO> getFriendsList(int memberId);
	public List<PaperListDTO> getPaperList(int memberId);
	public List<NotiListDTO> getNotiList(int memberId);
	public List<MemoDTO> getMemoList(int memberId);
	public void updateNoti(int id);
	public int insertPaper(String from, String to, String content);
	public int unfriend(HashMap<String, Integer> map);
	public List<PaperListDTO> getPaperListAtNoti(int memberId);
	public int addFriend(HashMap<String, Integer> map);
	public int addFriendReject(HashMap<String, Integer> map);
	public int addRejectOk(HashMap<String, Integer> map);
}