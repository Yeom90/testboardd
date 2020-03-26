package test.board.dto;

/*VO(ValueObject RealdOnly 속성) 계층간 데이터교환을 위한 자바빈즈, 로직을 가지면 안되고, getter, setter 메소드만 가지고 있다.
* 필드명과 해당 테이블 레코드의 이름이 같아야 한다.
* DTO 와 VO의 차이점은 동일 개념이지만,
* VO 는 특정 비지니스 "값"을 담는 객체이고,
* DTO 는 Layer 간의 통신용도(Controller, view, business, persistent)로 오고가는 객체, 데이터의 컨테이너 역할.
* EX)   DTO a = new DTO(1);
*       DTO b = new DTO(1);
*       a != b
*       VO a = new VO(1);
*       VO b = new VO(1);
*       a == b */
//TODO: VO와 DTO의 차이점 명확하게 찾아봐!
public class BoardDTO {

    private int bno;
    private String empId;
    private String empName;
    private int interphone;
    private String companyName;
    private String teamName;
    private String athority;
    private String isWorking;
    private String inDate;
    private String outDate;
    private int pwdErCnt;
    private String register;
    private String regDate;
    private String extraInfo;

    public int getBno() {
        return bno;
    }

    public void setBno(int bno) {
        this.bno = bno;
    }

    public String getEmpId() {
        return empId;
    }

    public void setEmpId(String empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public int getInterphone() {
        return interphone;
    }

    public void setInterphone(int interphone) {
        this.interphone = interphone;
    }

    public String getAthority() {
        return athority;
    }

    public void setAthority(String athority) {
        this.athority = athority;
    }

    public String getIsWorking() {
        return isWorking;
    }

    public void setIsWorking(String isWorking) {
        this.isWorking = isWorking;
    }

    public String getInDate() {
        return inDate;
    }

    public void setInDate(String inDate) {
        this.inDate = inDate;
    }

    public String getOutDate() {
        return outDate;
    }

    public void setOutDate(String outDate) {
        this.outDate = outDate;
    }

    public int getPwdErCnt() {
        return pwdErCnt;
    }

    public void setPwdErCnt(int pwdErCnt) {
        this.pwdErCnt = pwdErCnt;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public String getExtraInfo() {
        return extraInfo;
    }

    public void setExtraInfo(String extraInfo) {
        this.extraInfo = extraInfo;
    }

    public String getRegister() {
        return register;
    }

    public void setRegister(String register) {
        this.register = register;
    }

    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    @Override
    public String toString() {
        return "BoardVO{" +
                "bno=" + bno +
                ", empId='" + empId + '\'' +
                ", empName='" + empName + '\'' +
                ", interphone=" + interphone +
                ", companyName='" + companyName + '\'' +
                ", teamName='" + teamName + '\'' +
                ", athority='" + athority + '\'' +
                ", isWorking='" + isWorking + '\'' +
                ", inDate='" + inDate + '\'' +
                ", outDate='" + outDate + '\'' +
                ", pwdErCnt=" + pwdErCnt +
                ", register='" + register + '\'' +
                ", regDate='" + regDate + '\'' +
                ", extraInfo='" + extraInfo + '\'' +
                '}';
    }
}
