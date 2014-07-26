package visang.timple.model;

import org.springframework.web.multipart.MultipartFile;

public class TeamBoardDTO {

	private Object teamboardId;
	private String subject;
	private String content;
	private String teamseq;
	private String regdate;
	private String readCount;
	private String theme;
	private int teamBoardSortSeq;
	private int teamBoardGrade;
	private String col;
	private String word;
	private int start;
	private int pageSize;
	private int total;
	private int pages;	
	private MultipartFile attach;
	private String fileName;
	private String orgFileName;
	private String name;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Object getTeamboardId() {
		return teamboardId;
	}
	public void setTeamboardId(Object teamboardId) {
		this.teamboardId = teamboardId;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getCol() {
		return col;
	}
	public void setCol(String col) {
		this.col = col;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public int getTeamBoardSortSeq() {
		return teamBoardSortSeq;
	}
	public void setTeamBoardSortSeq(int teamBoardSortSeq) {
		this.teamBoardSortSeq = teamBoardSortSeq;
	}
	public int getTeamBoardGrade() {
		return teamBoardGrade;
	}
	public void setTeamBoardGrade(int teamBoardGrade) {
		this.teamBoardGrade = teamBoardGrade;
	}
	
    public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOrgFileName() {
		return orgFileName;
	}
	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}
	
	public MultipartFile getAttach() {
		return attach;
	}
	public void setAttach(MultipartFile attach) {
		this.attach = attach;
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
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTeamseq() {
		return teamseq;
	}
	public void setTeamseq(String teamseq) {
		this.teamseq = teamseq;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getReadCount() {
		return readCount;
	}
	public void setReadCount(String readCount) {
		this.readCount = readCount;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	
	
	
	
}
