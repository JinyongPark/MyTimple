package visang.timple.model;

import java.util.Date;

public class PlanDTO {
	private String bpid;
	private String projectseq;
	private String name;
	private Date startday;
	private Date endday;
	private String explanation;
	private String state;
	
	public String getBpid() {
		return bpid;
	}
	public void setBpid(String bpid) {
		this.bpid = bpid;
	}
	public String getProjectseq() {
		return projectseq;
	}
	public void setProjectseq(String projectseq) {
		this.projectseq = projectseq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getStartday() {
		return startday;
	}
	public void setStartday(Date startday) {
		this.startday = startday;
	}
	public Date getEndday() {
		return endday;
	}
	public void setEndday(Date endday) {
		this.endday = endday;
	}
	public String getExplanation() {
		return explanation;
	}
	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
}
