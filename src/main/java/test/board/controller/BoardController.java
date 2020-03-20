package test.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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
    public ModelAndView listPost() throws Exception{
        List<BoardVO> list = boardServiceImpl.getListAll();
        ModelAndView mav = new ModelAndView("/board/test_list");
        mav.addObject("board", list);
        return mav;
    }

    //글 작성 요청 처리
    @RequestMapping(value = "/write", method = RequestMethod.POST)
    @ResponseBody
    public String insert(@ModelAttribute BoardVO vo, RedirectAttributes redirectAttributes) throws Exception{
        logger.info("Controller: " + vo.toString()); //vo에 어떤데이터가 담겨오는지 로그 찍기
        boardServiceImpl.create(vo);
        //리다이렉트 직전 플래시에 저장하는 메소드다. 리다이렉트 이후에는 소멸한다.
        //플래시 : FlashMap 스프링에서 파라미터를 간편하게 전달하기 위한 자료구조, URL에 데이터를 노출시키지 않으면서 데이터를 전달, 세션에 넣기에는 적합하지 않고 spring에서 자동으로 값을 지워줌(휘발성)
        redirectAttributes.addFlashAttribute("msg", "regSuccess");
        return "redirect:/";
    }

    //글 조회
    @RequestMapping("/read")
    @ResponseBody
    public BoardVO readPost(@RequestParam(value = "boardNo") String boardNo) throws Exception{
        //넘어오는 값 확인
        logger.info("boardNo :"+boardNo);
        //웹문서에서는 데이터를 문자열로 보내기 때문에 int형으로 형변환을 해줘야 함
        int bno = Integer.parseInt(boardNo); //String을 int형으로 형변환
        logger.info("bno :"+bno);

        logger.info(String.valueOf(boardServiceImpl.read(bno)));
        return boardServiceImpl.read(bno); // 비동기식으로 통신하기 때문에 리턴하는 값을 직접 보내야 한다.
    }

    //글 수정 폼으로 이동
    @RequestMapping("/modifyForm")
    public String modifyForm(@RequestParam(value = "boardNo")String boardNo, Model model) throws Exception{
        //웹문서에서는 데이터를 문자열로 보내기 때문에 int형으로 형변환을 해줘야 함
        int bno = Integer.parseInt(boardNo); //String을 int형으로 형변환
        model.addAttribute("board", boardServiceImpl.read(bno));
        return "/board/modifyForm";
    }

    //글 수정 요청 처리
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifyPost(@ModelAttribute BoardVO boardVO, RedirectAttributes redirectAttributes) throws Exception{
        boardServiceImpl.update(boardVO);
        redirectAttributes.addFlashAttribute("msg","modifySuccess");
        return "redirect:/";
    }

    //글 삭제 요청 처리
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deletePost(@RequestParam("boardNo") int bno, RedirectAttributes redirectAttributes) throws Exception{
        boardServiceImpl.delete(bno);
        redirectAttributes.addFlashAttribute("msg","deleteSuccess");
        return "redirect:/";
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
