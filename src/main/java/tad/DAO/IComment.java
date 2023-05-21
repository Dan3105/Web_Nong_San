package tad.DAO;

import tad.entity.Comment;

public interface IComment {

	boolean insertComment(Comment comment);

	boolean updateComment(Comment comment);

	boolean deleteComment(Comment comment);

	Comment getComment(int feedbackId);

}
