package visang.timple.model;

import org.springframework.web.multipart.MultipartFile;

public class FileDTO {
	
	private String name;
	private String num;
	
	//**
	private MultipartFile attach;
	private String fileName; //서버에 저장될 파일명(2014061916033128417800260905.png)
	private String orgFileName; //진짜 파일명(1.png)
	
	
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
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
	
}
