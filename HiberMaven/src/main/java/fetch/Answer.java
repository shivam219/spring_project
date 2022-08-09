package fetch;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Answer {
	@Id
	@Column(name = "answer_id")
	private int answerId;
	@Column(name = "answer_name")
	private String answerName;
//	@
//	@Column(name = "answer_answer_field")
//	OneMany and ManytoMany only work with collection object 
	@ManyToOne
	@JoinColumn(name = "jio")
	private Question question;
	@ManyToOne
	@JoinColumn(name = "jio2")
	private Question question2;

	public Answer() {
		super();
	}

	protected Answer(int answerId, String answerName, Question answerAnswerField) {
		super();
		this.answerId = answerId;
		this.answerName = answerName;
		this.question = answerAnswerField;
	}

	public int getAnswerId() {
		return answerId;
	}

	public void setAnswerId(int answerId) {
		this.answerId = answerId;
	}

	public String getAnswerName() {
		return answerName;
	}

	public void setAnswerName(String answerName) {
		this.answerName = answerName;
	}

	public Question getAnswerAnswerField() {
		return question;
	}

	public void setAnswerAnswerField(Question answerAnswerField) {
		this.question = answerAnswerField;
	}
	public Question getAnswerAnswerField2() {
		return question2;
	}
	
	public void setAnswerAnswerField2(Question answerAnswerField) {
		this.question2 = answerAnswerField;
	}

	@Override
	public String toString() {
		return "Answer [answerId=" + answerId + ", answerName=" + answerName + ", answerAnswerField=" + question + "]";
	}
}
