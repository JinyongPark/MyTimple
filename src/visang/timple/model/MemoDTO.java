package visang.timple.model;

import com.mysql.fabric.xmlrpc.base.Data;

public class MemoDTO {
	// 회원 컬럼
	private String memberId; // 회원번호 PK
	private String name; // 이름
	private String pw; // 암호
	private String profile; // 사진 경로
	// 팀 컬럼
	private String teamid; // 팀 번호 PK
	private String projectseq; // 프로젝트 번호
	private String memseq; // 회원 번호 FK
	// 팀 메모 컬럼
	private String teammemoid; // 메모 번호 PK
	private String teamseq; // 팀 번호 FK
	private String content; // 내용
	private String regdate; // 날짜
	private String theme; // 사진 경로 
	// 페이징 처리
	private int start; // 시작
	private int end; // 끝
	private int total; // 총페이지
	private int pages; 
	private int pagesize; // 페이지 크기
	private int ceil;
	
	private String ment; // 완료 비완료 안내멘트
	private String num; // 수정 및 삭제 등록구분
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getTeamid() {
		return teamid;
	}
	public void setTeamid(String teamid) {
		this.teamid = teamid;
	}
	public String getProjectseq() {
		return projectseq;
	}
	public void setProjectseq(String projectseq) {
		this.projectseq = projectseq;
	}
	public String getMemseq() {
		return memseq;
	}
	public void setMemseq(String memseq) {
		this.memseq = memseq;
	}
	public String getTeammemoid() {
		return teammemoid;
	}
	public void setTeammemoid(String teammemoid) {
		this.teammemoid = teammemoid;
	}
	public String getTeamseq() {
		return teamseq;
	}
	public void setTeamseq(String teamseq) {
		this.teamseq = teamseq;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPages() {
		return pages;
	}
	public void setPages(int pages) {
		this.pages = pages;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public int getCeil() {
		return ceil;
	}
	public void setCeil(int ceil) {
		this.ceil = ceil;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getMent() {
		return ment;
	}
	public void setMent(String ment) {
		this.ment = ment;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	
	
	
}
