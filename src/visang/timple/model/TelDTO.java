package visang.timple.model;

public class TelDTO {

	private String quest; // 수정 및 삭제
	private String memberId; // 팀 순서
	private String name; // 이름
	private String email; // 메일
	private String tel; // 전화
	private String pw; // 암호
	private String teamid; // 회원 순서
	private String projectseq; // 프로젝트 번호
	private String memseq; // 회원 번호 참조
	private String grade; // 직위
	private String participation; // 참여여부
	private String fixname; // 수정용
	private String fixemail; // 수정용
	private String fixtel; // 수정용
	private String fixpw; // 수정용
	private String fixmem; // 수정용s
	private String memSeq;
	private int start;
	private int end;
	private int total;
	private int pages;
	private int pagesize;
	private int ceil;
	private String sort;
	private String word;
	private String num;
	private String page;
	
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
	public String getFixname() {
		return fixname;
	}
	public void setFixname(String fixname) {
		this.fixname = fixname;
	}
	public String getFixemail() {
		return fixemail;
	}
	public void setFixemail(String fixemail) {
		this.fixemail = fixemail;
	}
	public String getFixtel() {
		return fixtel;
	}
	public void setFixtel(String fixtel) {
		this.fixtel = fixtel;
	}
	public String getFixpw() {
		return fixpw;
	}
	public void setFixpw(String fixpw) {
		this.fixpw = fixpw;
	}
	public String getQuest() {
		return quest;
	}
	public void setQuest(String quest) {
		this.quest = quest;
	}
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
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
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getParticipation() {
		return participation;
	}
	public void setParticipation(String participation) {
		this.participation = participation;
	}
	public String getFixmem() {
		return fixmem;
	}
	public void setFixmem(String fixmem) {
		this.fixmem = fixmem;
	}
	public String getMemSeq() {
		return memSeq;
	}
	public void setMemSeq(String memSeq) {
		this.memSeq = memSeq;
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
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}

}