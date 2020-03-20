package test.board.paging;

public class PageMaker {
    private int totalCount; // 총 개수 담는 필드
    private int startPage = 1; //시작페이지는 0이 될 수 없으니 무조건 1을 대입한다.
    private int endPage; //끝 페이지를 담을 필드
    private int curPage; //현재페이지를 담을 필드
    private int perPage; //한 페이지에 몇개를 담을 지 정하는 필드

    private boolean prev; //이전 페이지 분기
    private boolean next; //다음 페이지 분기

    private int displayPageStart = 10; // 목록 페이지 번호(1~10)

    public PageMaker(){
        curPage = 1; //생성자가 생성되자마자 보여질 현재 페이지는 1페이지
        perPage = 10; //생성자가 생성되자마자 보여질 현재 게시물 개수는 10개
    }

    public int getCurPage(){
        return curPage;
    }

    public void serCurPage(int curPage){
        if(curPage <= 0){//현재페이지는 0보다 작을 수 없다
            this.curPage = 1; //1페이지로 고정
            return;
        }
        this.curPage = curPage; //아닌경우 (1보다 큰 경우) 현재페이지는 파라미터로 받은 현재페이지
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalEmpCount) {//총 개수가 넘어오면
        this.totalCount = totalEmpCount; //선언된 총 개수에 대입해서
        calculatePage();//페이지 계산 메서드 실행
    }

    private void calculatePage(){//게시글 전체 개수가 정해지면 메서드 호출, 총 페이지 수를 계산
        endPage = (int)(Math.ceil(curPage / (double)displayPageStart)*displayPageStart);//계속 변화하는 끝 페이지
        /*Math.ceil(java.base-java.lang.Math.Ceil
        * Returns the smallest (closest to negative infinity) double value that is greater than or equal to the argument and is equal to a mathematical Integer.
        * 주어진 숫자보다 크거나 같은 숫자 중 가장 작은 숫자를 Integer 로 반환합니다
        * 소수점 이하 올림
        * 끝페이지 = (현재페이지/페이지번호 개수)*페이지번호 개수
        * (1 / 10(고정, 10페이지 단위로 바뀐다)) * 10
        * 0.1*10 = 1
        * endPage = 1
        * (2/10)*10 = 0.2*10 = 2
        * endPage = 2
        * 11/10*10 = 1.1*10 - 11 (ceil) = 20
        * endPage = 20
        * 21/10*10 = 2.1*10 = 21 (ceil) = 30
        * endPage = 30
        * */

        startPage = (endPage-displayPageStart)+1;
        //시작페이지 = (끝페이지 - 목록페이지번호(10 고정))+1
        //시작페이지는 끝페이지(20-10)+1, 11페이지부터 시작해야 하기때문

        //displayPageStart 가 있으면 end도 있어야 하는데 start는 현재 range랑 다름이 없다.
        int tmpEndPage = (int)Math.ceil(totalCount/(double)perPage);
        //임시 끝 페이지 = 총 개수/ 한 페이지에 보여질 개수
        //1 = 17/15

        if(endPage > tmpEndPage){//실제 끝 > 임시 끝
            endPage = tmpEndPage; //실제 끝 페이지 <- 임시 끝 페이지 대입
        }

        prev = curPage > 1 ? true : false;
        //이전 버튼 = 현재 페이지 값이 1보다 큰지 여부에 따라 prev 활성화(1 페이지가 지나가면 무조건 활성화 된다)(boolean 타입)

        if(curPage != endPage) next = endPage * perPage >= totalCount ? true : false;
        //현재페이지가 끝페이지와 같지 않을때, 다음 버튼 = 끝페이지*한 페이지 보여질 개수가 총 개수보다 크거나 같은지?에 따라 next 버튼 활성화
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public void setCurPage(int curPage) {
        this.curPage = curPage;
    }

    public int getPerPage() {
        return perPage;
    }

    public void setPerPage(int perPage) {
        this.perPage = perPage;
    }

    public boolean isPrev() {
        return prev;
    }

    public void setPrev(boolean prev) {
        this.prev = prev;
    }

    public boolean isNext() {
        return next;
    }

    public void setNext(boolean next) {
        this.next = next;
    }

    public int getDisplayPageStart() {
        return displayPageStart;
    }

    public void setDisplayPageStart(int displayPageStart) {
        this.displayPageStart = displayPageStart;
    }
}
