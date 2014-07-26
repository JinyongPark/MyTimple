package visang.timple.model;

public class PaperDTO {

	private String content;
	private int sendMemSeq;
	private int receiveMemSeq;
	private int kind;
	
	public PaperDTO() {
		return;
	}
	public PaperDTO(String content, int sendMemSeq, int recieveMemSeq, int kind) {
		this.content = content;
		this.sendMemSeq = sendMemSeq;
		this.receiveMemSeq = recieveMemSeq;
		this.kind = kind;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getSendMemSeq() {
		return sendMemSeq;
	}
	public void setSendMemSeq(int sendMemSeq) {
		this.sendMemSeq = sendMemSeq;
	}
	public int getReceiveMemSeq() {
		return receiveMemSeq;
	}
	public void setReceiveMemSeq(int receiveMemSeq) {
		this.receiveMemSeq = receiveMemSeq;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	@Override
	public String toString() {
		return "PaperDTO [content=" + content + ", sendMemSeq=" + sendMemSeq
				+ ", receiveMemSeq=" + receiveMemSeq + ", kind=" + kind + "]";
	}
	
}
