package test.board.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import test.board.dao.BoardDAOImpl;
import test.board.paging.Criteria;
import test.board.vo.BoardVO;

import javax.inject.Inject;
import java.util.List;

@Service    //비지니스 로직을 수행하는 클래스 정의
public class BoardServiceImpl implements BoardService {

    private final static Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class); //log4j 사용하기위한 Object 생성

    private final BoardDAOImpl boardDAOImpl;

    //이름으로 필드, 메소드, 생성자 의존적주입(설정파일에서 명시하지 않아도 자동적으로 객체를 찾아서 필요한 의존성 주입) 가능, 사용시 javax 라이브러리 추가
    @Inject
    public BoardServiceImpl(BoardDAOImpl boardDAOImpl){
        this.boardDAOImpl = boardDAOImpl;
    }

    //사원정보 작성
    public void create(BoardVO vo) throws Exception{
        logger.info("create Service: " + vo.toString()); //vo에 어떤데이터가 담겨오는지 로그 찍기
        boardDAOImpl.create(vo);
    }

    //사원정보 읽기
    public BoardVO read(int bno) throws  Exception{
        return boardDAOImpl.read(bno);
    }

    //사원정보 수정
    public void update(BoardVO vo) throws Exception{
        logger.info("update Service: "+vo.toString());
        boardDAOImpl.update(vo);
    }

    //사원정보 삭제
    public void delete(int bno) throws Exception{
        boardDAOImpl.delete(bno);
    }

    //사원 목록
    public List<BoardVO> getListAll(Criteria criteria) throws Exception{
        return boardDAOImpl.getListAll(criteria);
    }

    //아이디 체크
    public int checkId(String emp_id) throws Exception{
        return boardDAOImpl.checkId(emp_id);
    }

    //내선번호 체크
    public int checkInterphone(String interphone) throws Exception{
        return boardDAOImpl.checkInterphone(interphone);
    }

    //총 게시물 개수
    public int listAllCnt() throws Exception{
        return boardDAOImpl.listAllCnt();
    }

}
