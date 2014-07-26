package visang.timple.model;

import java.sql.Date;

public class NoticeDTO {

	private String noticeId;
	private String managerSeq;
	private String subject;
	private String content;
	private Date regDate;
	private String id;
	private String pw;
	private String newImg;

	private String name;

	// 게시판 페이징 변수
	private int rowNum;
	private int total;
	private int pages;

	public int getPages() {
		return pages;
	}

	public void setPages(int pages) {
		this.pages = pages;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}

	public String getManagerSeq() {
		return managerSeq;
	}

	public void setManagerSeq(String managerSeq) {
		this.managerSeq = managerSeq;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getNewImg() {
		return newImg;
	}

	public void setNewImg(String newImg) {
		this.newImg = newImg;
	}

}
