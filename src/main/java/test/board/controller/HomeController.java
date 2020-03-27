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
public class HomeController {

    //메인 페이지로 이동
    @RequestMapping("/")
    public String goToMain(){
        return "main";
    }

}
