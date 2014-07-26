package visang.timple.model;

public class OrderDTO {
	
	private String SettingId;
	private String SideOrder;
	private String SideName;
	private String ProjectSeq;
	private String seq;
	
	public String getSettingId() {
		return SettingId;
	}
	public void setSettingId(String settingId) {
		SettingId = settingId;
	}
	public String getSideOrder() {
		return SideOrder;
	}
	public void setSideOrder(String sideOrder) {
		SideOrder = sideOrder;
	}
	public String getSideName() {
		return SideName;
	}
	public void setSideName(String name) {
		SideName = name;
	}
	public String getProjectSeq() {
		return ProjectSeq;
	}
	public void setProjectSeq(String projectSeq) {
		ProjectSeq = projectSeq;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
}
