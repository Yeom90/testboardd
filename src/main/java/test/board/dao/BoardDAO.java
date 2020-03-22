package test.board.dao;

import test.board.paging.Criteria;
import test.board.vo.BoardVO;

import java.util.List;

//DB에 data를 CRUD 하는 계층(Persistence Layer) Service -DB를 연결하는 고리, SQL을 사용하여 DB에 접근 후 적절한 CRUDAPI 제공
public interface BoardDAO {

    public void create (BoardVO boardVO) throws Exception;

    public BoardVO read (int bno) throws Exception;

    public void update (BoardVO boardVO) throws Exception;

    public void delete (int bno) throws Exception;

    public List<BoardVO> getListAll(Criteria criteria) throws Exception;

    public int checkId(String emp_id) throws Exception;

    public int checkInterphone(String interphone) throws Exception;

    public int listAllCnt()throws Exception;
}
