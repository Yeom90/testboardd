package test.board.dao;

import test.board.paging.Criteria;
import test.board.searching.SearchCriteria;
import test.board.vo.BoardVO;

import java.util.List;

//DB에 data를 CRUD 하는 계층(Persistence Layer) Service -DB를 연결하는 고리, SQL을 사용하여 DB에 접근 후 적절한 CRUDAPI 제공
public interface BoardDAO {

    public void create (BoardVO boardVO) throws Exception; // 추상메서드는 접근제한자의 의미가 없음

    BoardVO read (int bno) throws Exception;

    void update (BoardVO boardVO) throws Exception;

    void delete (int bno) throws Exception;

    List<BoardVO> getListAll(Criteria criteria) throws Exception;

    int checkId(String emp_id) throws Exception;

    int checkInterphone(String interphone) throws Exception;

    int listAllCnt()throws Exception;

    //검색된 목록을 리턴하는 추상 메서드
    List<BoardVO> listSearch(SearchCriteria searchCriteria) throws Exception;

    //검색된 게시글의 갯수를 리턴하는 추상 메서드
    int countSearchedList(SearchCriteria searchCriteria) throws Exception;
}
