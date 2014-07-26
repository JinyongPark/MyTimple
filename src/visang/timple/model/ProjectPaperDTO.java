package visang.timple.model;

public class ProjectPaperDTO {

	
  private String paperid;	 	
  private String content;	
  private String regdate;	
  private String sendmemseq;
  private String receivememseq;
  private String kind;
  private String projectid;
  
  

public String getPaperid() {
	return paperid;
}


public void setPaperid(String paperid) {
	this.paperid = paperid;
}




public String getRegdate() {
	return regdate;
}


public void setRegdate(String regdate) {
	this.regdate = regdate;
}


public String getSendmemseq() {
	return sendmemseq;
}


public void setSendmemseq(String sendmemseq) {
	this.sendmemseq = sendmemseq;
}


public String getReceivememseq() {
	return receivememseq;
}


public void setReceivememseq(String receivememseq) {
	this.receivememseq = receivememseq;
}


public String getKind() {
	return kind;
}


public void setKind(String kind) {
	this.kind = kind;
}


public String getContent() {
	return content;
}


public void setContent(String content) {
	this.content = content;
}


public String getProjectid() {
	return projectid;
}


public void setProjectid(String projectid) {
	this.projectid = projectid;
}

	
}
