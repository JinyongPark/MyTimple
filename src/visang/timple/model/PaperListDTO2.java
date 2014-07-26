/**
 * 
 */
package visang.timple.model;

/**
 * @author YJH
 *
 */
public class PaperListDTO2 {
	private int rowNum;
	private int paperId;
	private String content;
	private int receivememseq;
	private int fromId;
	private String fromMem;
	private String regdate;
		
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public int getPaperId() {
		return paperId;
	}
	public void setPaperId(int paperId) {
		this.paperId = paperId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReceivememseq() {
		return receivememseq;
	}
	public void setReceivememseq(int receivememseq) {
		this.receivememseq = receivememseq;
	}
	public int getFromId() {
		return fromId;
	}
	public void setFromId(int fromId) {
		this.fromId = fromId;
	}
	public String getFromMem() {
		return fromMem;
	}
	public void setFromMem(String fromMem) {
		this.fromMem = fromMem;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
