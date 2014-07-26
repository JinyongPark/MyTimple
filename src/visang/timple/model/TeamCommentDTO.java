package visang.timple.model;

public class TeamCommentDTO {

	private String teamcommentId;
	private String subject;
	private String regdate;
	private String teamboardseq;
	private int teamseq;
	private String teamcomment;
	
	
	public String getTeamcommentId() {
		return teamcommentId;
	}
	public void setTeamcommentId(String teamcommentId) {
		this.teamcommentId = teamcommentId;
	}
	public int getTeamseq() {
		return teamseq;
	}
	public void setTeamseq(int teamseq) {
		this.teamseq = teamseq;
	}
	public String getTeamcomment() {
		return teamcomment;
	}
	public void setTeamcomment(String teamcomment) {
		this.teamcomment = teamcomment;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getTeamboardseq() {
		return teamboardseq;
	}
	public void setTeamboardseq(String teamboardseq) {
		this.teamboardseq = teamboardseq;
	}
	
	
	
}
