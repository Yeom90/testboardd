package test.board.etc;

public class PageMakerByArmi {
    private int totalCount; // 총 갯수 담을 필드
    private int startPage = 1; //시작페이지는 0이 될 수 없으니 무조건 1을 대입한다.
    private int endPage; //끝 페이지를 담을 필드
    private int curPage; //현재페이지를 담을 필드
    private int perPage; // 한페이지에 몇개를 담을 지 정하는 필드

    private boolean prev; //이전 페이지 분기
    private boolean next; //다음 페이지 분기

    private SearchDTOByArmi sDto; //검색 쿼리를 생성하기 위한 DTO

    private int displayPageStart = 10; // 목록 페이지 번호 (1~10)

    public PageMakerByArmi(){ //생성자
        curPage = 1; // 생성자가 생성되자마자 보여질 현재 페이지는 1페이지
        perPage = 15; // 생성자가 생성되자마자 보여질 현재 게시물 갯수는 15개
    }


    public SearchDTOByArmi getsDto() {
        return sDto;
    }

    public void setsDto(SearchDTOByArmi sDto) {
        this.sDto = sDto;
    }
    public int getCurPage() {
        return curPage;
    }

    public void setCurPage(int curPage) {
        if(curPage <= 0){//현재페이지는 0보다 작을 수 없다 (=0보다 작은 페이지는 있을 수 없다)
            this.curPage = 1; //1페이지로 고정
            return;
        }
        this.curPage = curPage; //아닌경우 (1보다 큰 경우) 현재페이지는 파라미터로 받은 현재페이지
    }

    public int getPerPage() {
        return perPage;
    }

    public void setPerPage(int perPage) {
        this.perPage = perPage;
    }

    public int getCurPageStart(){ //mybatis mapper명명규칙만 맞게 설정되어있다면, maaper에서 curPageStart로 호출 할 수 있다.
        return (this.curPage -1 )* perPage;
        // mapper의 limit에서 범위 지정을 위한 메서드, 데이터 0번부터 불러온다 현재페이지 1-1*게시물번호 = 0, 2페이지는 2-1 * 15 이기 때문에 15부터 출력한다
    }

    public int getTotalCount() {
        return totalCount;
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


    public void setTotalCount(int totalEmpCount){ //총 갯수가 넘어오면
        this.totalCount = totalEmpCount; // 선언된 총 갯수에 대입해서
        calculatePage(); //페이지 계산 메서드 실행
    }

    private void calculatePage(){ // 게시글 전체 갯수가 정해지면 메서드 호출, 계산한다.

        endPage = (int) (Math.ceil(curPage / (double)displayPageStart)*displayPageStart); // 이게 계속 변화하는 끝페이지
        //Math.ceil(java.base-java.lang.Math.Ceil
        //Returns the smallest (closest to negative infinity) double value that is greater than or equal to the argument and is equal to a mathematical integer.
        // 주어진 숫자보다 크거나 같은 숫자 중 가장 작은 숫자를 integer 로 반환합니다.
        // 소수점 이하 올림
        //끝페이지 = (현재페이지/페이지번호 갯수)*페이지번호 갯수
        // ( 1 / 10(고정, 10페이지단위로 바뀐다)) * 10
        // 0.1 * 10 = 1
        // endPage = 1
        // (2/10)*10 = 0.2*10 = 2
        // endPage = 2
        // 11/10 *10 = 1.1 * 10 = 11 (ceil) = 20
        // endPage =20
        // 21/10*10 =2.1 * 10 = 21 (ceil) = 30
        //endPage = 30

        startPage = (endPage-displayPageStart)+1;
        //시작페이지 = (끝페이지 - 목록페이지번호(10 고정)) + 1
        //시작페이지는 끝페이지(20 - 10) + 1 11페이지부터 시작해야 하니까.

        //  displayPageStart 가 있으면 end도 있어야 하는데 start는 현재 range랑 다름이 없다 .
        int tmpEndPage = (int) Math.ceil(totalCount/(double)perPage);
        // 임시 끝 페이지 = 총 갯수/한 페이지에 보여질 갯수
        // 1 = 17/15

        if(endPage>tmpEndPage){ // 실제 끝 > 임시끝
            endPage = tmpEndPage; // 실제 끝 페이지 <- 대입 임시 끝 페이지
        }

        prev = curPage > 1 ? true : false;
        // 이전 버튼 = 현재 페이지 값이 1보다 큰지 여부 에 따라 prev 활성화 ( 1페이지가 지나가면 무조건 활성화한다) (boolean 타입)

        if(curPage != endPage) next = endPage * perPage >= totalCount ? true : false;
        // 현재페이지가 끝페이지와 같지 않을 때, 다음 버튼 = 끝페이지*한 페이지 보여질 갯수 가 총 갯수보다 크거나 같은지? 에 따라 next 버튼 활성화

    }

}
