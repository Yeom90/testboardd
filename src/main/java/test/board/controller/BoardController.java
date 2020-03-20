package test.board.controller;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import test.board.paging.PageTest;
import test.board.service.BoardServiceImpl;
import test.board.vo.BoardVO;

import javax.inject.Inject;
import java.util.List;

/*Controller 는 해당 RequestMapping 에 따라 적절한 view 와 mapping 처리를 한다.
* service 의 메소드를 이용, DTO 를 body 에 담아 Client 에게 반환한다.
* API 와 View 를 동시에 사용하는 경우에 사용, API 서비스로 사용하는 경우 @ResponseBody 를 사용하여 객체 반환*/
@Controller
public class BoardController {

    private final BoardServiceImpl boardServiceImpl; // BoardService를 주입 하기위한 필드

    private final static Logger logger = LoggerFactory.getLogger(BoardController.class); //log4j 사용하기위한 Object 생성

    @Inject // 생성자를 이용하여 무엇을 주입, 무엇을 주입 했는지 보기 좋고 안정성 면에서도 뛰어남
    public BoardController(BoardServiceImpl boardServiceImpl) {
        this.boardServiceImpl = boardServiceImpl;
    }

    //글 목록
    @RequestMapping("/")
    public ModelAndView listPost(@RequestParam(defaultValue="1") int curPage) throws Exception{

        //페이징 할 인스턴스 만들기
        PageTest pageTest = new PageTest();

        //글 목록 가져오기
        List<BoardVO> list = boardServiceImpl.getListAll(pageTest);

        ModelAndView mav = new ModelAndView("/board/test_list");
        mav.addObject("board", list);
        mav.addObject("pageMaker", list);
        mav.addObject("listAllCnt", boardServiceImpl.listAllCnt());
        logger.info("listAllCnt: " + String.valueOf(boardServiceImpl.listAllCnt()));
        return mav;
    }

    @Test
    public void testListPaging() throws Exception{
        PageTest pageTest = new PageTest();
        pageTest.setPage(3);
        pageTest.setPerPageNum(10);

        List<BoardVO> empList = boardServiceImpl.getListAll(pageTest);

        for(BoardVO boardVO : empList){
            logger.info(boardVO.getEmpId() + ":" + boardVO.getEmpName());
        }
    }


    //글 작성 요청 처리
    @RequestMapping(value = "/write", method = RequestMethod.POST)
    @ResponseBody
    public void insert(@ModelAttribute BoardVO vo) throws Exception{
        logger.info("Controller: " + vo.toString()); //vo에 어떤데이터가 담겨오는지 로그 찍기
        boardServiceImpl.create(vo);
    }

    //글 조회
    @RequestMapping("/read")
    @ResponseBody
    public BoardVO readPost(@RequestParam(value = "boardNo") String boardNo) throws Exception{
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
    public void modifyPost(@ModelAttribute BoardVO boardVO) throws Exception{
        logger.info("modify Controller : "+ boardVO.toString());
        boardServiceImpl.update(boardVO);
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
