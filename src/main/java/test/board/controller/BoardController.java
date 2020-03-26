package test.board.controller;

/* slf4j (simple logging facade for java) 추상형 logging framework
*  배포시에 원하는 logging framework( log4j, log4j2, logback 등) 을 선택할 수 있다.
*  api, binding, bridging 모듈 제공
*  binding : slf4j 인터페이스를 로깅 구현체와 연결하는 어댑터 역할을 하는 라이브러리.
*  bridging : 다른 로깅 api 로의 logger 호출을 slf4j 인터페이스로 연결(redirect)하여 slf4j api 가 대신 처리 할수 있도록 일종의 어댑터 역할.
*  하나의 logging framework 에 종속되는 것이 아니라 느슨하고 유연하게 만들어야 함.*/
import org.slf4j.Logger;
//https://github.com/qos-ch/slf4j/blob/master/slf4j-api/src/main/java/org/slf4j/LoggerFactory.java
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import test.board.paging.Criteria;
import test.board.paging.PageMaker;
import test.board.service.BoardServiceImpl;
import test.board.dto.BoardDTO;

import javax.inject.Inject;

/*Controller 는 해당 RequestMapping 에 따라 적절한 view 와 mapping 처리를 한다.
* service 의 메소드를 이용, DTO 를 body 에 담아 Client 에게 반환한다.
* API 와 View 를 동시에 사용하는 경우에 사용, API 서비스로 사용하는 경우 @ResponseBody 를 사용하여 객체 반환*/
@Controller
public class BoardController {

    private final BoardServiceImpl boardServiceImpl; // BoardService를 주입 하기위한 필드

    //TODO: 명확하게 알지 못하는 클래스는 무조건 API 문서 볼 것
    private final static Logger logger = LoggerFactory.getLogger(BoardController.class); //log4j 사용하기위한 Object 생성

    @Inject //자바에서 제공하는 javax.inject 패키지에 있는 클래스
    public BoardController(BoardServiceImpl boardServiceImpl) {
        this.boardServiceImpl = boardServiceImpl;
    }// 생성자를 이용하여 무엇을 주입, 무엇을 주입 했는지 보기 좋고 안정성 면에서도 뛰어남

    //글 목록
    @RequestMapping("/")
    public ModelAndView listPost(@ModelAttribute Criteria criteria) throws Exception{
        logger.info("criteria: "+ criteria);
        int totalCount = boardServiceImpl.countAllList(); //전체게시글 개수 리턴
        logger.info("listAllCnt: "+totalCount);
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCriteria(criteria); //뷰에서 받아온 페이지 번호를 넣어줌
        pageMaker.setTotalCount(totalCount); //하단 목록 번호 계산을 위한 전체 게시글 개수 저장

        ModelAndView mav = new ModelAndView("/board/test_list");
        mav.addObject("board", boardServiceImpl.getListAll(criteria));//게시글 가져오기
        mav.addObject("pageMaker", pageMaker);//하단 페이지 번호 만든 인스턴스 뷰로 보내기
        return mav;
    }

    //글 작성 요청 처리
    @RequestMapping(value = "/write", method = RequestMethod.POST)
    @ResponseBody
    public void insert(@ModelAttribute BoardDTO vo) throws Exception{
        logger.info("Controller: " + vo.toString()); //vo에 어떤데이터가 담겨오는지 로그 찍기
        boardServiceImpl.create(vo);
    }

    //글 조회
    @RequestMapping("/read")
    @ResponseBody
    public BoardDTO readPost(@RequestParam(value = "boardNo") String boardNo) throws Exception{
        //넘어오는 값 확인
        logger.info("boardNo :"+boardNo);
        //웹문서에서는 데이터를 문자열로 보내기 때문에 int형으로 형변환을 해줘야 함
        int bno = Integer.parseInt(boardNo); //String을 int형으로 형변환
        logger.info(String.valueOf(boardServiceImpl.read(bno))); //boardServiceImpl.read(bno)의 리턴값을 문자열로 바꿔 로그 출력
        return boardServiceImpl.read(bno); // 비동기식으로 통신하기 때문에 리턴하는 값을 직접 보내야 한다.
    }

    //사원 정보 수정
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    @ResponseBody
    public void modifyPost(@ModelAttribute BoardDTO boardDTO) throws Exception{
        logger.info("modify Controller : "+ boardDTO.toString());
        boardServiceImpl.update(boardDTO);
    }

    //사원 정보 삭제
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public void deletePost(@RequestParam("boardNo") String boardNo)throws Exception{
        logger.info("delete Controller :"+ boardNo);
        int bno = Integer.parseInt(boardNo);
        boardServiceImpl.delete(bno);
    }

    //아이디 중복 체크
    @RequestMapping(value = "/idCheck", method = RequestMethod.POST)
    @ResponseBody
    public int checkId(@RequestParam(value = "emp_id", required = true) String emp_id) throws Exception {
        logger.info("id체크: " + emp_id);
        return boardServiceImpl.checkId(emp_id);
    }

    //내선번호 중복 체크
    @RequestMapping(value = "/interphoneCheck", method = RequestMethod.POST)
    @ResponseBody
    public int checkInterphone(@RequestParam(value = "interphone", required = true) String interphone) throws Exception {
        logger.info("내선번호 : " + interphone);
        return boardServiceImpl.checkInterphone(interphone);
    }
}
