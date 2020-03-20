package test.board.paging;

public class PageTest {

    private int page; // 페이지 번호를 담을 필드
    private int perPageNum; // 한페이지에 담을 양을 정하는 필드

    public PageTest(){
        this.page = 1; //페이지는 1번부터 시작
        this.perPageNum = 10; //
    }

    public void setPage(int page){
        if(page <= 0){ // 페이지번호가 0이하면 1로 바꿔줌
            this.page = 1;
            return;
        }
        this.page = page; // 파라미터로 들어온 페이지 번호를 멤버필드에 대입

    }
    public int getPage(){//멤버필드(page) 값을 돌려줄 겟터
        return page;
    }

    public void setPerPageNum(int perPageNum){ // 페이지에 보여줄 양을 정하는 필드를 세팅하는 셋터
        if(perPageNum <= 0 || perPageNum > 100){// 한페이지에 양이 0보다 작거나 100을 넘으면 10으로 초기화
            this.perPageNum = 10;
            return;
        }
        this.perPageNum = perPageNum; // 그 외에 파라미터로 넘어온 값을 대입
    }

    public int getPerPageNum(){
        return perPageNum;
    }

    public int getPageStart(){// 해당 페이지의 첫 게시물 번호를 정해줄 함수
        return (page - 1)*perPageNum;
    }

    @Override
    public String toString() {
        return "PageTest{" +
                "page=" + page +
                ", perPageNum=" + perPageNum +
                '}';
    }
}
