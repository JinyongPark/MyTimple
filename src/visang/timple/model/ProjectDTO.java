package visang.timple.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ProjectDTO {
	
	
	private String projectid;
	private String name;
	private String startday;
	private String endday;
	private String content;
	private String open;
	private String thumnail;
	private String twoCategory;
	
	//파일 업,다운로드 필요
	private MultipartFile attach;
	private String fileName;
	private String orgFileName;
	
	
	
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
	public String getProjectid() {
		return projectid;
	}
	public void setProjectid(String projectid) {
		this.projectid = projectid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStartday() {
		return startday;
	}
	public void setStartday(String startday) {
		this.startday = startday;
	}
	public String getEndday() {
		return endday;
	}
	public void setEndday(String endday) {
		this.endday = endday;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public String getThumnail() {
		return thumnail;
	}
	public void setThumnail(String thumnail) {
		this.thumnail = thumnail;
	}
	public String getTwoCategory() {
		return twoCategory;
	}
	public void setTwoCategory(String twoCategory) {
		this.twoCategory = twoCategory;
	}
	
	
	
}
