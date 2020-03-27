package test.board.service;

import test.board.paging.Criteria;
import test.board.searching.SearchCriteria;
import test.board.dto.BoardDTO;

import java.util.List;

public interface BoardService { // business logic 처리, DAO 로 DB 접근, DTO(VO)로 데이터를 전달 받고, 비지니스 로직을 처리해 데이터 반환하는 역할

    /*원래 자바에서는 에러처리를 위하여 try, catch 문을 이용하여 적절한 에러처리를 해야하지만,
    * 모든곳에서 동일한 에러처리를 하는것은 힘들고, 예상하지 못한 에러도 발생할 수 있다.
    * 그래서 모든 메서드에서는 에러가 발생하면 Exception 을 날리고, 공통으로 이 Exception 을 처리하는 로직을 추가한다.*/
    void create(BoardDTO boardDTO) throws Exception;

    BoardDTO read(int bno) throws Exception;

    void update(BoardDTO boardDTO) throws Exception;

    void delete(int bno) throws Exception;

    List<BoardDTO> getListAll(Criteria criteria) throws Exception;

    int checkId(String emp_id) throws Exception;

    int checkInterphone(String interphone) throws Exception;

    int countAllList() throws Exception;

    List<BoardDTO>listSearch(SearchCriteria searchCriteria) throws Exception;

    int countSearchedList(SearchCriteria searchCriteria) throws  Exception;
}
