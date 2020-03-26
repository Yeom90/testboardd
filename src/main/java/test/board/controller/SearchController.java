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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import test.board.paging.Criteria;
import test.board.paging.PageMaker;
import test.board.searching.SearchCriteria;
import test.board.service.BoardService;
import test.board.dto.BoardDTO;

import javax.inject.Inject;

/*Controller 는 해당 RequestMapping 에 따라 적절한 view 와 mapping 처리를 한다.
 * service 의 메소드를 이용, DTO 를 body 에 담아 Client 에게 반환한다.
 * API 와 View 를 동시에 사용하는 경우에 사용, API 서비스로 사용하는 경우 @ResponseBody 를 사용하여 객체 반환*/
@Controller
@RequestMapping("/emp_list")
public class SearchController {

    //TODO: 명확하게 알지 못하는 클래스는 무조건 API 문서 볼 것

    /* Logger 인터페이스 type 인 logger 변수에 LoggerFactory.getLogger()메서드를 호출하여 받은 리턴값을 대입했는데,
    *  LoggerFactory 클래스를 인스턴스 하지 않고도 대입할수 있는 것은 메서드가 static 이기 때문이다. */
    private static final Logger scLogger = LoggerFactory.getLogger(SearchController.class);

    private final BoardService boardServiceImpl; // BoardServiceImpl 을 담기위한 필드

    @Inject //자바에서 제공하는 javax.inject 패키지에 있는 클래스, type으로 매칭하여 Dependency Injection 한다.
    /*톰캣 구동시 component-scan 에 의하여 컨트롤러가 인스턴스 될때 파라미터 인자로 BoardService 를 선언한 이 생성자를 호출 하면서
    *   Inject 어노테이션이 servlet container 에서 BoardServiceImpl 빈을 발견하고 주입을 해주고 주입 받은 변수를 boardServiceImpl 필드에 대입한다. */
    public SearchController(BoardService boardServiceImpl){
        this.boardServiceImpl = boardServiceImpl;
    }

    //사원 관리 페이지 요청시 보여주는 사원 목록.
    @RequestMapping("/")
    //반환 타입이 ModelAndView 이며 파라미터로 Criteria 클래스 타입의 criteria 클래스변수를 받는 getList 메서드.
    //ModelAndView 은 Model 과 View 를 모두 담을 수 있는 클래스 이다. TODO: Model 과 ModelAndView 의 차이점 더 알아보자(시간날때).
    public ModelAndView getList(@ModelAttribute Criteria criteria) throws Exception{
        scLogger.info("criteria: "+ criteria.toString()); //파라미터로 들어온 criteria 값 확인

        //boardServiceImpl 인스턴스의 countAllList 메서드의 반환 값을 int 타입 변수 totalCount 에 대입
        int totalCount = boardServiceImpl.countAllList(); //전체게시글 개수 리턴
        scLogger.info("totalCount : "+totalCount);
        PageMaker pgMaker = new PageMaker();
        pgMaker.setCriteria(criteria); //뷰에서 받아온 페이지 번호를 넣어줌
        pgMaker.setTotalCount(totalCount); //하단 목록 번호 계산을 위한 전체 게시글 개수 저장

        ModelAndView mav = new ModelAndView("/board/emp_list");
        mav.addObject("board", boardServiceImpl.getListAll(criteria));//게시글 가져오기
        mav.addObject("pageMaker", pgMaker);//하단 페이지 번호 만든 인스턴스 뷰로 보내기
        return mav;
    }

    //검색 요청시 검색된 사원 목록을 List 에 담아 뷰에 보내는 메서드
    @RequestMapping("/search")
    //@ModelAttribute("a" 타입 변수)로 attribute 값을 주면 뷰(JSP)로 해당 타입의 변수에 담긴 값을 "a"라는 attributeName 으로 보내준다.
    //Model 은 인터페이스이며 model 변수에서 실제 구현체는 ModelMap 으로 추정된다. TODO:Model model 이 어떤 클래스를 사용하는지 확인해보자.
    //ModelMap 은 Map 인터페이스를 implemented 하였으며 key:value 로 데이터를 저장하도록 구현되어 있다.(key 중복 안됨)
    public String searchList(@ModelAttribute("srcCriteria") SearchCriteria shCriteria, Model model) throws Exception {
        scLogger.info("shCriteria: "+shCriteria.toString());// 뷰에서 받은 shCriteria 의 값 확인
        PageMaker pgMaker = new PageMaker(); //PageMaker 클래스를 pgMaker 클래스명으로 인스턴스
        pgMaker.setCriteria(shCriteria); //pgMaker 인스턴스의 criteria 필드 셋터를 이용하여 뷰에서 받은 shCriteria 값 대입
        pgMaker.setTotalCount(boardServiceImpl.countSearchedList(shCriteria)); //totalCount 필드 셋터를 이용하여 boardServiceImpl 인스턴스의 countSearchedList 메서드 반환 값 대입

        //"board"라는 attributeName 으로 boardServiceImpl 인스턴스의 listSearch 메서드 반환 값을 Model Object 에 담는다.
        model.addAttribute("board", boardServiceImpl.listSearch(shCriteria));

        //pgMaker 인스턴스를 "pageMaker"라는 attributeName 으로 Model Object 에 담는다.
        model.addAttribute("pageMaker", pgMaker);

        /* "/board/emp_list"라는 문자열(렌더링 하기위한 뷰 네임)을 반환 하였지만 dispatcher-servlet이 이것을 viewResolver 에게 보내
            뷰 Object 를 반환 받은 후, Model Object 데이터들을 뷰 Object 에 추가하고 렌더링하여 HTML(Hyper Text Markup Language)문서를
            클라이언트에게 응답(response) 한다.*/
        return "/board/emp_list";
    }

    //글 작성 요청 처리 메서드
    @RequestMapping(value = "/write", method = RequestMethod.POST)
    @ResponseBody
    public void insertEmp(@ModelAttribute BoardDTO bdDTO) throws Exception{
        scLogger.info("write method bdDTO : " + bdDTO.toString()); //bdDTO 에 어떤 데이터가 담겨오는지 로그 찍기.

        //boardServiceImpl 인스턴스의 create 메서드에 파라미터 값으로 bdDTO 를 담아 호출.
        boardServiceImpl.create(bdDTO);
    }

    //글 상세 조회하기위한 요청 처리 메서드
    @RequestMapping("/read")
    @ResponseBody
    public BoardDTO readEmp(@RequestParam(value = "boardNo") String boardNo) throws Exception{
        scLogger.info("read method boardNo :"+boardNo);
        //HTTP(HyperText Transfer Protocol)을 통해 전달되는 데이터는 문자열이기 때문에 int 타입으로 타입변환을 해준다.(테이블에 bno 컬럼 데이터 타입이 int)
        //Integer 클래스는 java.base 모듈안의 java.lang 패키지안에 있는 래퍼클래스(Wrapper Class)이기 때문에 명시적으로 import 하지 않아도 사용이 가능하다.
        //래퍼클래스(Wrapper Class)란 기본자료형(primitive data types)에 대한 클래스 표현이다, 기본 자료형에 대해서 클래스로 인식되도록 포장을 했다는 뜻이다.
        int bno = Integer.parseInt(boardNo); //String 을 int 타입으로 변환해주는 메소드
        scLogger.info(String.valueOf(boardServiceImpl.read(bno))); //boardServiceImpl.read(bno)의 리턴값을 문자열로 바꿔 로그 출력
        return boardServiceImpl.read(bno); // 비동기식으로 통신하기 때문에 리턴하는 값을 직접 보내야 한다.
    }

    //사원 정보 수정 요청 처리 메서드
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    @ResponseBody
    public void modifyEmp(@ModelAttribute BoardDTO bdDTO) throws Exception{
        scLogger.info("modify method boardNo : "+ bdDTO.toString());
        boardServiceImpl.update(bdDTO);
    }

    //사원 정보 삭제 요청 처리 메서드
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public void deleteEmp(@RequestParam("boardNo") String boardNo)throws Exception{
        scLogger.info("delete method boardNo :"+ boardNo);
        int bno = Integer.parseInt(boardNo);
        boardServiceImpl.delete(bno);
    }

    //아이디 중복 체크 요청 처리 메서드
    @RequestMapping(value = "/idCheck", method = RequestMethod.POST)
    @ResponseBody
    public int checkEmpId(@RequestParam(value = "emp_id", required = true) String emp_id) throws Exception {
        scLogger.info("emp_id : " + emp_id);
        return boardServiceImpl.checkId(emp_id);
    }

    //내선번호 중복 체크 요청 처리 메서드
    @RequestMapping(value = "/interphoneCheck", method = RequestMethod.POST)
    @ResponseBody
    public int checkInterphone(@RequestParam(value = "interphone", required = true) String interphone) throws Exception {
        scLogger.info("interphone : " + interphone);
        return boardServiceImpl.checkInterphone(interphone);
    }

//    @RequestMapping("/teamList")
//    public String getTeamList(@ModelAttribute SearchCriteria searchCriteria, Model model) throws Exception {
//        scLogger.info("getTeamList() called...");
//        PageMaker pgMaker = new PageMaker();
//        pgMaker.setCriteria(searchCriteria);
//        pgMaker.setTotalCount(boardServiceImpl.countSearchedList(searchCriteria));
//
//        scLogger.info("teamList: "+boardServiceImpl.listSearch(searchCriteria).toString());
//        model.addAttribute("teamList", boardServiceImpl.listSearch(searchCriteria));
//        model.addAttribute("pageMaker", pgMaker);
//        return "/etc/teamList";
//    }
}
