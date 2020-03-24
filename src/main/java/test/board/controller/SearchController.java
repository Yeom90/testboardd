package test.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import test.board.paging.PageMaker;
import test.board.searching.SearchCriteria;
import test.board.service.BoardService;

import javax.inject.Inject;

@Controller
@RequestMapping("/search")
public class SearchController {

    private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

    private final BoardService boardServiceImpl;

    @Inject
    public SearchController(BoardService boardServiceImpl){
        this.boardServiceImpl = boardServiceImpl;
    }

    @RequestMapping("/")//TODO: ModelAttribute 어노테이션의 () 특징 찾기
    public String list(@ModelAttribute("searchCriteria") SearchCriteria searchCriteria, Model model) throws Exception {
        logger.info("search list() called ...");
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCriteria(searchCriteria);
        pageMaker.setTotalCount(boardServiceImpl.countSearchedList(searchCriteria));

        model.addAttribute("board", boardServiceImpl.listSearch(searchCriteria));
        model.addAttribute("pageMaker", pageMaker);

        return "/search/list";
    }

    @RequestMapping("/teamList")
    public String teamList(@ModelAttribute SearchCriteria searchCriteria, Model model) throws Exception {
        logger.info("teamList() called...");
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCriteria(searchCriteria);
        pageMaker.setTotalCount(boardServiceImpl.countSearchedList(searchCriteria));

        model.addAttribute("teamList", boardServiceImpl.listSearch(searchCriteria));
        model.addAttribute("pageMaker", pageMaker);
        return "/etc/teamList";
    }
}
