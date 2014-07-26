package visang.timple.model;

import java.sql.Date;

public class BbsDTO {
	private int boardId;
	private String post_type;
	private int memSeq;
	private String subject;
	private String content;
	private Date regDate;
	private int readCount;
	private int recomCount;
	private String imgFileName;
	private String imgOrgFileName;
	private int thread;
	private int depth;
	private String newImg;
	

	
	private int memberid;
	
	
	// 
	private String name;
	private String rowNum;

	// 게시판 페이징 변수
	private int total;
	
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

	private int pages;
	
	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getPost_type() {
		return post_type;
	}

	public void setPost_type(String post_type) {
		this.post_type = post_type;
	}

	public int getmemSeq() {
		return memSeq;
	}

	public void setmemSeq(int memSeq) {
		this.memSeq = memSeq;
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

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public int getRecomCount() {
		return recomCount;
	}

	public void setRecomCount(int recomCount) {
		this.recomCount = recomCount;
	}

	public String getImgFileName() {
		return imgFileName;
	}

	public void setImgFileName(String imgFileName) {
		this.imgFileName = imgFileName;
	}

	public String getImgOrgFileName() {
		return imgOrgFileName;
	}

	public void setImgOrgFileName(String imgOrgFileName) {
		this.imgOrgFileName = imgOrgFileName;
	}

	public int getThread() {
		return thread;
	}

	public void setThread(int thread) {
		this.thread = thread;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRowNum() {
		return rowNum;
	}

	public void setRowNum(String rowNum) {
		this.rowNum = rowNum;
	}

	public int getMemberid() {
		return memberid;
	}

	public void setMemberid(int memberid) {
		this.memberid = memberid;
	}

	public String getNewImg() {
		return newImg;
	}

	public void setNewImg(String newImg) {
		this.newImg = newImg;
	}




}
