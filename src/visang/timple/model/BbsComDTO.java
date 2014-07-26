package visang.timple.model;

public class BbsComDTO {
	private int commentId;
	private int boardId;
	private int memSeq;
	private String regDate;
	private String content;
	private String name;

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public int getMemSeq() {
		return memSeq;
	}

	public void setMemSeq(int memSeq) {
		this.memSeq = memSeq;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getboardId() {
		return boardId;
	}

	public void setboardId(int boardId) {
		this.boardId = boardId;
	}

}
