package tad.entity;
// Generated Apr 3, 2023, 10:50:00 AM by Hibernate Tools 4.3.6.Final

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Comment generated by hbm2java
 */
@Entity
@Table(name = "Comment", schema = "dbo", catalog = "DB_Tad")
public class Comment {
	@Id
	@Column(name = "CommentID", unique = true, nullable = false)
	private String commentId;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "UserID", nullable = false)
	private User user;

	@Column(name = "CommentContent")
	private String commentContent;

	@Column(name = "Status", nullable = false)
	private boolean status;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "PostingDate", length = 23)
	private Date postingDate;

	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "comments")
	private Set<Feedback> feedbacks = new HashSet<>(0);

	public Comment() {
	}

	public Comment(String commentId, User user, boolean status) {
		this.commentId = commentId;
		this.user = user;
		this.status = status;
	}

	public Comment(String commentId, User user, String commentContent, boolean status, Date postingDate,
			Set<Feedback> feedbacks) {
		this.commentId = commentId;
		this.user = user;
		this.commentContent = commentContent;
		this.status = status;
		this.postingDate = postingDate;
		this.feedbacks = feedbacks;
	}

	public String getCommentId() {
		return this.commentId;
	}

	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}


	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}


	public String getCommentContent() {
		return this.commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}


	public boolean isStatus() {
		return this.status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}


	public Date getPostingDate() {
		return this.postingDate;
	}

	public void setPostingDate(Date postingDate) {
		this.postingDate = postingDate;
	}


	public Set<Feedback> getFeedbacks() {
		return this.feedbacks;
	}

	public void setFeedbacks(Set<Feedback> feedbacks) {
		this.feedbacks = feedbacks;
	}

}
