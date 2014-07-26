/**
 * 
 */
package visang.timple.model;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author YJH
 *
 */
public class MemberDTO {
	private int memberId;
	private String name;
	private String email;
	private String tel;
	private String pw;
	private String inform;
	private int alertCount;
	
	private String socialType;
	private MultipartFile attach;
	private String orgFileName;
	private String fileName;
	
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
	public MultipartFile getAttach() {
		return attach;
	}
	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}
	@Override
	public String toString() {
		return "MemberDTO [memberId=" + memberId + ", name=" + name
				+ ", email=" + email + ", tel=" + tel + ", pw=" + pw
				+ ", inform=" + inform + ", alertCount=" + alertCount
				+ ", socialType=" + socialType + "]";
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getInform() {
		return inform;
	}
	public void setInform(String inform) {
		this.inform = inform;
	}
	public int getAlertCount() {
		return alertCount;
	}
	public void setAlertCount(int alertCount) {
		this.alertCount = alertCount;
	}
	
	public String getSocialType() {
		return socialType;
	}
	public void setSocialType(String socialType) {
		this.socialType = socialType;
	}
}
