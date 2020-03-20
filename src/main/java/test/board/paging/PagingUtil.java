package test.board.paging;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;

public class PagingUtil {

    public static final int PAGE_SIZE = 10; // 페이지당 항목수
    public static final int LIST_ROWS = 10; // 블럭당 항목수

    private int totCnt;
    private int totPage;
    private int page;

    private double pp;
    private double stptr;

    public void setPaging(int totCnt, int page){

        this.pp = Math.floor((page - 1) / LIST_ROWS);
        this.stptr = this.pp * LIST_ROWS + 1;

        this.totCnt = totCnt;
        this.totPage = (totCnt % PAGE_SIZE > 0) ? (int)totCnt/PAGE_SIZE + 1 : (int)totCnt/PAGE_SIZE;
        this.page = page;
    }

    public String setPagingNav(HttpServletRequest request){

        StringBuffer pageNavArr = new StringBuffer();
        StringBuffer strFormArr = new StringBuffer();

        Enumeration names = request.getParameterNames();
        String field = "";
        String fvalue = "";

        strFormArr.append("<form name=\"pagingForm\" method=\"post\">\n");
        strFormArr.append("<input type=\"hidden\" name=\"page\" value=\"" + this.page + "\">\n");

        while(names.hasMoreElements()){

            field = (String)names.nextElement();
            fvalue = request.getParameter(field);

            if(!field.equals(field)){
                strFormArr.append("<input type=\"hidden\" name=\"" + field + "\" value=\"" + fvalue +"\">\n");
            }
        }

        strFormArr.append("</form>\n");

        int totPage = this.totPage;
        int page = this.page;

        int pp = (int)Math.floor((page - 1) / LIST_ROWS);
        int stptr = pp * LIST_ROWS + 1;

        String pprve = (page > LIST_ROWS)? " <var><a href=\"\" onClick=\"javascript:jsPagingNav(\'" + (stptr-LIST_ROWS) + "\', \'pagingForm\');return false;\"><img src=\"/images/pre_arr2.gif\" width=\"20\" height=\"15\" align=\"absmiddle\"></a></var> " : " <var><img src=\"/images/pre_arr2.gif\" width=\"20\" height=\"15\" align=\"absmiddle\"></var> ";
        String prve = (page > 1)? " <a href=\"\" onClick=\"javascript:jsPagingNav(\'" + (page-1) + "\', \'pagingForm\');return false;\"><img src=\"/images/bt_prev2.gif\" width=\"20\" height=\"15\" align=\"absmiddle\"></a> " : " <var><img src=\"/images/bt_prev2.gif\" width=\"20\" height=\"15\" align=\"absmiddle\"></var> ";

        String nnext = ((stptr + LIST_ROWS) <= totPage)? "<var><a href=\"\" onClick=\"javascript:jsPagingNav(\'" + (stptr + LIST_ROWS) + "\', \'pagingForm\');return false;\"><img src=\"/images/last_arr2.gif\" width=\"20\" height=\"15\" align=\"absmiddle\"></a></var>" : " <var><img src=\"/images/last_arr2.gif\" width=\"20\" height=\"15\" align=\"absmiddle\"></var> ";
        String next = (page < (stptr + LIST_ROWS) && page < totPage )? "<a href=\"\" onClick=\"javascript:jsPagingNav(\'" + (page+1) + "\', \'pagingForm\');return false;\"><img src=\"/images/bt_next2.gif\" width=\"20\" height=\"15\" align=\"absmiddle\"></a> " : " <var><img src=\"/images/bt_next2.gif\" width=\"20\" height=\"15\" align=\"absmiddle\"></var> ";

        pageNavArr.append(strFormArr);

        pageNavArr.append("<div>\n");
        pageNavArr.append(pprve);
        pageNavArr.append(prve);
        pageNavArr.append("&nbsp;&nbsp;");

        for(int pi=(int)stptr; pi < (int)stptr+LIST_ROWS; pi++){

            if(pi > totPage) break;
            //if(pi != (int)stptr) pageNavArr.append(" <img src=\"/images/page_dot.gif\" width=\"2\" height=\"5\">  ");
            if(page == pi){
                pageNavArr.append("<span class=\"sel\">" + pi + "</span> \n");
            }else{
                pageNavArr.append("<a href=\"#\" class=\"numBox\" onClick=\"javascript:jsPagingNav(\'" + pi + "\', \'pagingForm\');return false;\">" + pi + "</a> \n");
            }
        }
        pageNavArr.append("&nbsp;&nbsp;");
        pageNavArr.append(next);
        pageNavArr.append(nnext);
        pageNavArr.append("</div>\n");

        return pageNavArr.toString();
    }

    public String setPagingNav2(HttpServletRequest request) {

        StringBuffer pageNavArr = new StringBuffer();
        StringBuffer strFormArr = new StringBuffer();
        Enumeration names = request.getParameterNames();
        String field = "";
        String fvalue = "";

        strFormArr.append("<form name=\"pagingForm\" method=\"post\">\n");
        strFormArr.append("<input type=\"hidden\" name=\"page\" value=\""+ this.page +"\">\n");

        while(names.hasMoreElements()) {

            field = (String)names.nextElement();
            fvalue = request.getParameter(field);
            if(!field.equals("page")){
                strFormArr.append("<input type=\"hidden\" name=\"" + field +"\" value=\""+ fvalue +"\">\n");
            }

        }

        strFormArr.append("</form>\n");

        int totPage = this.totPage;
        int page = this.page;

        int pp = (int)Math.floor((page - 1) / LIST_ROWS);
        int stptr = pp * LIST_ROWS + 1;

        String pprve = (page > LIST_ROWS)? " <var><a href=\"\" onClick=\"javascript:jsPagingNav(\'" + (stptr-LIST_ROWS) + "\', \'pagingForm\');return false;\"><img src=\"/images/pre_arr2.gif\" width=\"20\" height=\"15\" align=\"absmiddle\"></a></var> " : " <var><img src=\"/images/pre_arr2.gif\" width=\"20\" height=\"15\" align=\"absmiddle\"></var> ";
        String prve = (page > 1)? " <a href=\"#\" class=\"numPrev\" onClick=\"javascript:jsPagingNav(\'" + (page-1) + "\', \'pagingForm\');return false;\">이전페이지</a> " : " <a href=\"#\" class=\"numPrev\">이전페이지</a> ";

        String next = (page < (stptr + LIST_ROWS) && page < totPage )? " <a href=\"#\" class=\"numNext\" onClick=\"javascript:jsPagingNav(\'" + (page+1) + "\', \'pagingForm\');return false;\">다음페이지</a> " : " <a href=\"#\" class=\"numNext\">다음페이지</a> ";
        String nnext = ((stptr + LIST_ROWS) <= totPage)? "<var><a href=\"\" onClick=\"javascript:jsPagingNav(\'" + (stptr + LIST_ROWS) + "\', \'pagingForm\');return false;\"><img src=\"/images/last_arr2.gif\" width=\"20\" height=\"15\" align=\"absmiddle\"></a></var>" : " <var><img src=\"/images/last_arr2.gif\" width=\"20\" height=\"15\" align=\"absmiddle\"></var> ";


        pageNavArr.append(strFormArr);

        //pageNavArr.append("<div>\n");
        //pageNavArr.append(pprve);
        pageNavArr.append(prve);
        //pageNavArr.append("&nbsp;&nbsp;");

        for(int pi=(int)stptr; pi < (int)stptr+LIST_ROWS; pi++){

            if(pi > totPage) break;
            //if(pi != (int)stptr) pageNavArr.append(" <img src=\"/images/page_dot.gif\" width=\"2\" height=\"5\">  ");
            if(page == pi){
                pageNavArr.append("<span class=\"sel\">"+pi+"</span>\n");
            }else{
                pageNavArr.append("<a href=\"#\" class=\"numBox\" onClick=\"javascript:jsPagingNav(\'" + pi + "\', \'pagingForm\');return false;\">"+pi+"</a> \n");
                //pageNavArr.append("<a href=\"#\" class=\"numBox\" onClick=\"javascript:jsPagingNav(\'" + pi + "\', \'pagingForm\');return false;\">" + pi + "</a> \n");
            }
        }
        //pageNavArr.append("&nbsp;&nbsp;");
        pageNavArr.append(next);
        //pageNavArr.append(nnext);
        //pageNavArr.append("</div>\n");

        return pageNavArr.toString();
    }

    public int getPrev(int page){

        int prev = 0;

        if(page > 1){
            prev = page - 1;
        }else{
            prev = page;
        }
        return prev;
    }

    public int getNext(int page){

        int next = 0;

        if(page < (this.stptr + LIST_ROWS) && page < this.totPage){
            next = page + 1;
        }else{
            next = page;
        }
        return next;
    }

    public int getLastPage(){

        double lastPage = 0;

        lastPage = this.stptr + LIST_ROWS;
        lastPage = (lastPage > totPage)? totPage : lastPage;

        return (int)lastPage;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public double getPp() {
        return pp;
    }

    public void setPp(double pp) {
        this.pp = pp;
    }

    public double getStptr() {
        return stptr;
    }

    public void setStptr(double stptr) {
        this.stptr = stptr;
    }

    public int getTotCnt() {
        return totCnt;
    }

    public void setTotCnt(int totCnt) {
        this.totCnt = totCnt;
    }

    public int getTotPage() {
        return totPage;
    }

    public void setTotPage(int totPage) {
        this.totPage = totPage;
    }
}
