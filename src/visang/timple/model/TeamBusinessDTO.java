package visang.timple.model;

public class TeamBusinessDTO {
	
	// 업무 테이블
	private String subject;		// 제목
	
	private String startday;	// 시작날짜
	private String endday;		// 끝날짜
		
	// 회원 테이블
	private String name;		// 담당자
	
	// 업무테이블
	private String importance;  // 중요도		
	
	// 업무상태 테이블
	private String status;	    // 현재상태
	
	// 업무로그 테이블	
	private String editdate;    // 수정날짜
	
	// 업무테이블 
	private String content;		// 내용
	
	
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getImportance() {
		return importance;
	}
	public void setImportance(String importance) {
		this.importance = importance;
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
	public String getEditdate() {
		return editdate;
	}
	public void setEditdate(String editdate) {
		this.editdate = editdate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
