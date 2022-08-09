package fetch;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
public class Question {
	@Id
	@Column(name = "question_id_")
	private int questionId;
	@Column(name = "question_name")
	private String questionName;
//	@OneToMany // three table will create have mapping of question table
//	@JoinColumn(name="jio")
	@OneToMany(mappedBy = "question")//here only on table will create 
	private List<Answer> questionAnswerField;
	@OneToMany(mappedBy = "question2")//here only on table will create 
	private List<Answer> questionAnswerField2;

	public Question() {
		super();
	}

	protected Question(int questionId, String questionName, List<Answer> questionAnswerField) {
		super();
		this.questionId = questionId;
		this.questionName = questionName;
		this.questionAnswerField = questionAnswerField;
	}

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public String getQuestionName() {
		return questionName;
	}

	public void setQuestionName(String questionName) {
		this.questionName = questionName;
	}

	public List<Answer> getQuestionAnswerField() {
		return questionAnswerField;
	}

	public void setQuestionAnswerField(List<Answer> questionAnswerField) {
		this.questionAnswerField = questionAnswerField;
	}

	@Override
	public String toString() {
		return "Question [questionId=" + questionId + ", questionName=" + questionName + ", questionAnswerField="
				+ questionAnswerField + "]";
	}

}
