package Service;

<<<<<<< HEAD
=======
import java.io.File;

import java.io.IOException;
import java.util.HashMap;
>>>>>>> origin/master
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.boardDao;
import Model.board;
import Model.boardComment;
import Model.qna;
import Model.qnaComment;

@Service
public class boardServiceImpl implements boardService{

	@Autowired
	private boardDao boardDao;
	
	@Override
	public List<board> searchBoard(String searchWord, int type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBoard(board board) {
		return boardDao.insertBoard(board);
	}

	@Override
	public int updateBoard(board board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<board> selectNotice() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<board> selectBoard() {
		// TODO Auto-generated method stub
		return boardDao.selectBoard();
	}

	@Override
	public board selectOneBoard(int no) {
		// TODO Auto-generated method stub
		return boardDao.selectOneBoard(no);
	}

	@Override
	public int insertBoardComment(boardComment boardComment) {
		// TODO Auto-generated method stub
		return boardDao.insertBoardComment(boardComment);
	}

	@Override
	public List<boardComment> selectBoardComment(HashMap<String, Object>params) {
		// TODO Auto-generated method stub
<<<<<<< HEAD
		return 0;
	}

	@Override
	public List<boardComment> selectBoardComment(int no) {
		// TODO Auto-generated method stub
		return null;
=======
		return boardDao.selectBoardComment(params);
>>>>>>> origin/master
	}

	@Override
	public List<qna> searchQna(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertQna(qna qna) {

		return boardDao.insertQna(qna);
	}

	@Override
	public int updateQna(qna qna) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteQna(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<qna> selectQna() {
		// TODO Auto-generated method stub
		return boardDao.selectQna();
	}

	@Override
	public qna selectOneQna(int no) {
		// TODO Auto-generated method stub
		return boardDao.selectOneQna(no);
	}

	@Override
	public int insertQnaComment(qnaComment qnaComment) {
		// TODO Auto-generated method stub
		return boardDao.insertQnaComment(qnaComment);
	}

	@Override
<<<<<<< HEAD
	public List<qnaComment> selectQnaComment(int no) {
=======
	public List<qnaComment> selectQnaComment(HashMap<String, Object>params) {
		// TODO Auto-generated method stub
		return boardDao.selectQnaComment(params);
	}

	@Override
	public boardComment selectBoardLatestcomment() {
>>>>>>> origin/master
		// TODO Auto-generated method stub
		return boardDao.selectBoardLatestcomment();
	}

<<<<<<< HEAD
=======
	@Override
	public qnaComment selectQnaLatestcomment() {
		// TODO Auto-generated method stub
		return boardDao.selectQnaLatestcomment();
	}

	@Override
	public int selectOneById(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return boardDao.selectOneById(params);
	}
>>>>>>> origin/master

}
