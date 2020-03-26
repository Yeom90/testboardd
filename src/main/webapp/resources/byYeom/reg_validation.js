let isClickedEmpId = false; //아이디 중복체크를 눌렀는지 확인하는 변수
let isClickedInterphone = false;//내선번호 중복체크
let isIdOk = false;
let isInterphoneOk = false;
let isNameOk = false;

//아이디 유효성 검사
$($('#empId')).keyup(function () {
    isClickedEmpId = false; //중복검사전
    let idValidation = /^[a-zA-z0-9]{4,12}$/; // 영문 대소문자, 숫자, 4~12글자(유효성검사)

    if($('#empId').val() == ""){
        $('#empIdChecked').text("공백 입니다.").css('color', 'red');
        isIdOk = false;
    }else if(!idValidation.test($('#empId').val())){
        $('#empIdChecked').text("아이디는 영문 대소문자, 숫자 4~12자리로 입력해야 합니다.").css('color', 'red');
        isIdOk = false;
    }else{
        $('#empIdChecked').text("");
        isIdOk = true;
    }
});
//아이디 중복 체크 로직
$('#checkIdBtn').click(function () {
    if(isIdOk){
        $.ajax({
            url : "/idCheck",
            type : "POST",
            //data : emp_id, //이건 안됨!!! 저 변수명은 키값으로 인식이 안됨
            data : { emp_id : $('#empId').val() },//객체 형식으로 key : value 로 보내야 컨트롤러에서 저 key값으로 데이터를 받을 수 있다.
            success: function (result) {
                if(result == "0"){
                    $('#empIdChecked').text("사용 가능한 아이디 입니다.").css('color', 'blue');
                    isClickedEmpId = true;
                }else{
                    $('#empIdChecked').text("이미 있는 아이디 입니다.").css('color', 'red');
                    isClickedEmpId = false;
                }
            },
            error: function (xhr, status) {
                console.log(xhr, status);
            }
        });
    }else{
        alert("아이디를 확인하세요.");
    }
});

//사원명 유효성 검사
$('input[name=empName]').keyup(function () {
    let nameValidation = /[가-힣]/; // 한글(유효성검사)

    if($('input[name=empName]').val() == ""){
        $('span[name=empNameChecked]').text("공백 입니다.").css('color', 'red');
        isNameOk = false;
    }else if(!nameValidation.test($('input[name=empName]').val())){
        $('span[name=empNameChecked]').text("사원명은 한글만 가능합니다.").css('color', 'red');
        isNameOk = false;
    }else{
        $('span[name=empNameChecked]').text("");
        isNameOk = true;
    }
});

//내선번호 유효성 검사
$('input[name=interphone]').keyup(function () {
    isClickedInterphone = false; //중복검사전
    let interphoneValidation = /^[0-9]{4}$/; // 숫자 4글자(유효성검사)
    if($('input[name=interphone]').val() == ""){
        $('span[name=interphoneChecked]').text("공백 입니다..").css('color', 'red');
        isInterphoneOk = false;
    }else if(!interphoneValidation.test($('input[name=interphone]').val())){
        $('span[name=interphoneChecked]').text("내선번호는 숫자 4개입니다.").css('color', 'red');
        isInterphoneOk = false;
    }else{
        $('span[name=interphoneChecked]').text("");
        isInterphoneOk = true;
    }
});

//내선번호 중복 체크 로직
$('button[name=checkInterphoneBtn]').click(function () {
    if(isInterphoneOk){
        let interphone = $("input[name=interphone]").val();
        $.ajax({
            url : "/interphoneCheck",
            type : "POST",
            data : { interphone : interphone },//객체 형식으로 key : value 로 보내야 컨트롤러에서 저 key 값으로 데이터를 받을 수 있다.
            success: function (result) {
                if(result == "0"){
                    $('span[name=interphoneChecked]').text("사용 가능한 번호 입니다.").css('color', 'blue');
                    isClickedInterphone = true;
                }else{
                    $('span[name=interphoneChecked]').text("이미 있는 번호 입니다.").css('color', 'red');
                    isClickedInterphone = false;
                }
            },
            error: function (xhr, status) {
                console.log(xhr, status);
            }
        })
    }else{
        alert("내선번호 확인해주세요.")
    }
});

//부서코드 유효성 검사
$('#companyName').change(function () {
    if($('#companyName').val() == "본부명선택"){
        $('#companyNameChecked').text("본부명을 선택해 주세요").css('color', 'red');
    }else{
        $('#companyNameChecked').text("");
    }
});

//팀명 유효성 검사
$('#teamName').change(function () {
    if($('#teamName').val() == "팀명선택"){
        $('#teamNameChecked').text("팀명을 선택해 주세요").css('color', 'red');
    }else{
        $('#teamNameChecked').text("");
    }
});

//재직여부 유효성 검사
$('#isWorking').change(function () {
    if($('#isWorking').val() == "선택"){
        $('#isWorkingChecked').text("재직여부를 선택해 주세요").css('color', 'red');
    }else{
        $('#isWorkingChecked').text("");
    }
});
//업무 유효성 검사
$('#task').change(function () {
    if($('#task').val() == "선택"){
        $('#taskChecked').text("업무를 선택해 주세요").css('color', 'red');
    }else{
        $('#taskChecked').text("");
    }
});
//권한 유효성 검사
$('#athority').change(function () {
    if($('#athority').val() == "선택"){
        $('#athorityChecked').text("권한을 선택해 주세요").css('color', 'red');
    }else{
        $('#athorityChecked').text("");
    }
});
//입사일자 유효성 검사
$('#inDate').mouseenter(function () {
    if($('#inDate').val() == ""){
        $('#inDateChecked').text("날짜를 선택해 주세요").css('color', 'red');
    }else{
        $('#inDateChecked').text("");
    }
});


//submit 누르기 전에 중복체크 했는지 확인 TODO: 수정필요(작동안함)
function checkForm(){
    alert("1");
    if(isClickedEmpId && isClickedInterphone){
        alert("2")
        return true;
    }else{
        alert("3");
        return false;
    }
}
