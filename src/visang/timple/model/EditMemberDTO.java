package visang.timple.model;

public class EditMemberDTO {

	private String email;
	private String name;
	private int questionSeq;
	private String quereply;
	private String tel;
	private int oneCategorySeq;
	private int twoCategoryId;
	private int career;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getQuestionSeq() {
		return questionSeq;
	}
	public void setQuestionSeq(int questionSeq) {
		this.questionSeq = questionSeq;
	}
	public String getQuereply() {
		return quereply;
	}
	public void setQuereply(String quereply) {
		this.quereply = quereply;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getOneCategorySeq() {
		return oneCategorySeq;
	}
	public void setOneCategorySeq(int oneCategorySeq) {
		this.oneCategorySeq = oneCategorySeq;
	}
	public int getTwoCategoryId() {
		return twoCategoryId;
	}
	public void setTwoCategoryId(int twoCategoryId) {
		this.twoCategoryId = twoCategoryId;
	}
	public int getCareer() {
		return career;
	}
	public void setCareer(int career) {
		this.career = career;
	}
	
}
