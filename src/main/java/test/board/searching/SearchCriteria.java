package test.board.searching;

import test.board.paging.Criteria;

public class SearchCriteria extends Criteria {

    private String ftSearchType;  //첫번째 검색조건(재직상태)
    private String sdSearchType; // 두번째 검색조건(사원명, 사원아이디, 내선번호 등등)
    private String keyword; // 검색 키워드

    public String getFtSearchType() {
        return ftSearchType;
    }

    public void setFtSearchType(String ftSearchType) {
        this.ftSearchType = ftSearchType;
    }

    public String getSdSearchType() {
        return sdSearchType;
    }

    public void setSdSearchType(String sdSearchType) {
        this.sdSearchType = sdSearchType;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    @Override
    public String toString() {
        return "SearchCriteria{" +
                "ftSearchType='" + ftSearchType + '\'' +
                ", sdSearchType='" + sdSearchType + '\'' +
                ", keyword='" + keyword + '\'' +
                '}';
    }
}
