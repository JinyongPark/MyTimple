package visang.timple.model;

import org.springframework.web.multipart.MultipartFile;

public class TeamDataDTO {

	private String dataId;
	private MultipartFile attach;
	private String fileName;
	private String orgFileName;
	private String filexplanation;
	private Object projectseq;
	private String logid;
	private String dataseq;
	private String editdate;
	private int teamseq;
	private int filestatusseq;
	
	public String getLogid() {
		return logid;
	}
	public void setLogid(String logid) {
		this.logid = logid;
	}
	public String getDataseq() {
		return dataseq;
	}
	public void setDataseq(String dataseq) {
		this.dataseq = dataseq;
	}
	public String getEditdate() {
		return editdate;
	}
	public void setEditdate(String editdate) {
		this.editdate = editdate;
	}
	public int getTeamseq() {
		return teamseq;
	}
	public void setTeamseq(int teamseq) {
		this.teamseq = teamseq;
	}
	public int getFilestatusseq() {
		return filestatusseq;
	}
	public void setFilestatusseq(int filestatusseq) {
		this.filestatusseq = filestatusseq;
	}
	public Object getProjectseq() {
		return projectseq;
	}
	public void setProjectseq(Object projectseq) {
		this.projectseq = projectseq;
	}
	public String getDataId() {
		return dataId;
	}
	public void setDataId(String dataId) {
		this.dataId = dataId;
	}
	public MultipartFile getAttach() {
		return attach;
	}
	public void setAttach(MultipartFile attach) {
		this.attach = attach;
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
	public String getFilexplanation() {
		return filexplanation;
	}
	public void setFilexplanation(String filexplanation) {
		this.filexplanation = filexplanation;
	}
	
}
