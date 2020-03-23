package test.board.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import test.board.paging.Criteria;
import test.board.vo.BoardVO;

import javax.inject.Inject;
import java.util.List;

@Repository //DAO 클래스에서 쓰는 annotation, DB에 접근하는 메서드를 가지고 있는 클래스에서 쓰임
/*  component 를 써도 되지만, component 특성도 가지고 DAO 메소드에서 발생할 수 있는 체크불가능한 예외들을 스프링의 dataAccess exception 으로도 처리 할 수 있다.
*   component 는 자바클래스를 Spring Bean 이라고 표시하는 역할을 한다. 이걸 Application Context 에 bean 이라고 등록하게 만들어준다.
*   component 는 controller, service, dao, 외의 클래스에서만 사용해야 한다.
*   @Component, @Controller, @Service, @Repository 가 선언된 클래스들은 Spring 의 DI 컨테이너에 의해 스캔되어져 bean 으로 등록된 후에만 사용 가능,
*   이 때문에 applicationContext.xml 에 context:component-scan 으로 선언함, 이 어트리뷰트가 선언된 패키지를 "시작점"으로 해서 component 를 찾는다.
*   최상위 폴더 하나만 등록하지 말고 각각 패키지를 등록하여 필요한 bean 들을 찾게 하는것이 좋다.
*/
public class BoardDAOImpl implements BoardDAO{

    private final static Logger logger = LoggerFactory.getLogger(BoardDAOImpl.class); //log4j 사용하기위한 Object 생성

    private static final String NAMESPACE = "boardMapper"; //TODO: final에 static이 붙는 이유 찾아봐!

    private final SqlSessionTemplate sqlST;

    //스프링 빈에 있는 SqlSessionTemplate Bean을 주입
    @Inject
    public BoardDAOImpl(SqlSessionTemplate sqlST) {
        this.sqlST = sqlST;
    }


    public void create(BoardVO vo) throws Exception{
        logger.info("create DAO: " + vo.toString()); //vo에 어떤데이터가 담겨오는지 로그 찍기
        //모든 쿼리는 namespace.sqlId 의 구조로 구성된다.
        sqlST.insert(NAMESPACE + ".create", vo);
    }

    public BoardVO read(int bno) throws Exception{
        //ibatis.sqlSession 에서 제공하는 selectOne 메소드는 오직 하나의 객체만을 리턴한다.
        //sqlSessionTemplate 에서 제공하는 int update (java.lang.String statement, java.lang.Object parameter)가 원형
        return sqlST.selectOne(NAMESPACE + ".read", bno);
    }

    public void update(BoardVO vo) throws  Exception{
        logger.info("update DAO: "+vo.toString());
        sqlST.update(NAMESPACE + ".update", vo);
    }

    public void delete(int bno) throws Exception{
        sqlST.delete(NAMESPACE + ".delete", bno);
    }

    public List<BoardVO> getListAll(Criteria criteria) throws Exception{
        //List<E> selectList(String statement)가 원형이며 boardMapper.listAll 을 실행하여 BoardVO 객체들로 구성된 List 를 반환한다.
        return sqlST.selectList(NAMESPACE + ".listAll", criteria);
    }

    public int checkId(String emp_id) throws Exception {
        return sqlST.selectOne(NAMESPACE + ".checkId", emp_id);
    }

    public int checkInterphone(String interphone) throws Exception{
        return sqlST.selectOne(NAMESPACE + ".checkInterphone", interphone);
    }

    public int listAllCnt()throws Exception{
        return sqlST.selectOne(NAMESPACE + ".listAllCnt");
    }
}
