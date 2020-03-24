package test.board.etc;


public class SearchDTOByArmi extends PageMakerByArmi {
    private String customer_company;
    private String emp_center;
    private String emp_team;
    private String emp_option;
    private String valueText;
    private String emp_section;
    private String emp_dep;
    private String emp_status;
    private String emp_enter_com_date;
    private String emp_out_date;
    private String emp_work_type;
    private String ser_bank_acc;


    public SearchDTOByArmi() {
    }


    @Override
    public String toString() {
        return "SearchDTO{" +
                "customer_company='" + customer_company + '\'' +
                ", emp_center='" + emp_center + '\'' +
                ", emp_team='" + emp_team + '\'' +
                ", emp_option='" + emp_option + '\'' +
                ", valueText='" + valueText + '\'' +
                ", emp_section='" + emp_section + '\'' +
                ", emp_dep='" + emp_dep + '\'' +
                ", emp_status='" + emp_status + '\'' +
                ", emp_enter_com_date='" + emp_enter_com_date + '\'' +
                ", emp_out_date='" + emp_out_date + '\'' +
                ", emp_work_type='" + emp_work_type + '\'' +
                ", ser_bank_acc='" + ser_bank_acc + '\'' +
                '}';
    }

    public SearchDTOByArmi(String customer_company, String emp_center, String emp_team, String emp_option, String valueText,
                           String emp_section, String emp_dep, String emp_status, String emp_enter_com_date, String emp_out_date, String emp_work_type, String ser_bank_acc) {
        this.customer_company = customer_company;
        this.emp_center = emp_center;
        this.emp_team = emp_team;
        this.emp_option = emp_option;
        this.valueText = valueText;
        this.emp_section = emp_section;
        this.emp_dep = emp_dep;
        this.emp_status = emp_status;
        this.emp_enter_com_date = emp_enter_com_date;

        this.emp_out_date = emp_out_date;
        this.emp_work_type = emp_work_type;
        this.ser_bank_acc = ser_bank_acc;
    }

    public String getCustomer_company() {
        return customer_company;
    }

    public void setCustomer_company(String customer_company) {
        this.customer_company = customer_company;
    }

    public String getEmp_center() {
        return emp_center;
    }

    public void setEmp_center(String emp_center) {
        this.emp_center = emp_center;
    }

    public String getEmp_team() {
        return emp_team;
    }

    public void setEmp_team(String emp_team) {
        this.emp_team = emp_team;
    }

    public String getEmp_option() {
        return emp_option;
    }

    public void setEmp_option(String emp_option) {
        this.emp_option = emp_option;
    }

    public String getValueText() {
        return valueText;
    }

    public void setValueText(String valueText) {
        this.valueText = valueText;
    }

    public String getEmp_section() {
        return emp_section;
    }

    public void setEmp_section(String emp_section) {
        this.emp_section = emp_section;
    }

    public String getEmp_dep() {
        return emp_dep;
    }

    public void setEmp_dep(String emp_dep) {
        this.emp_dep = emp_dep;
    }

    public String getEmp_status() {
        return emp_status;
    }

    public void setEmp_status(String emp_status) {
        this.emp_status = emp_status;
    }

    public String getEmp_enter_com_date() {
        return emp_enter_com_date;
    }

    public void setEmp_enter_com_date(String emp_enter_com_date) {
        this.emp_enter_com_date = emp_enter_com_date;
    }

    public String getEmp_out_date() {
        return emp_out_date;
    }

    public void setEmp_out_date(String emp_out_date) {
        this.emp_out_date = emp_out_date;
    }

    public String getEmp_work_type() {
        return emp_work_type;
    }

    public void setEmp_work_type(String emp_work_type) {
        this.emp_work_type = emp_work_type;
    }

    public String getSer_bank_acc() {
        return ser_bank_acc;
    }

    public void setSer_bank_acc(String ser_bank_acc) {
        this.ser_bank_acc = ser_bank_acc;
    }
}
