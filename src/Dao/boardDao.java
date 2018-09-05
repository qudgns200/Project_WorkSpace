package Dao;

import java.util.List;

import Model.board;
import Model.boardComment;
import Model.qna;
import Model.qnaComment;

public interface boardDao {

	public List<board>	searchBoard(String searchWord, int type);
	public int	insertBoard(board board);
	public int	updateBoard(board board);
	public int	deleteBoard(int no);
	public List<board>	selectNotice();
	public List<board>	selectBoard();
	public board selectOneBoard(int no);
	public int	insertBoardComment(boardComment boardComment);
	public List<boardComment>	selectBoardComment(int no);
	public List<qna>	searchQna(String id);
	public int	insertQna(qna qna);
	public int	updateQna(qna qna);
	public int	deleteQna(int no);
	public List<qna> selectQna();
	public qna	selectOneQna(int no);
	public int	insertQnaComment(qnaComment qnaComment);
	public List<qnaComment>	selectQnaComment(int no);

}
