const answerBtn = document.getElementById("manager--answerStartBtn");
const answerBox = document.getElementsByClassName("manager--inquiryAnswerBox");
let answerWrite = document.getElementById("manager--answerWrite");
var answerForm;


// 답변하기 버튼 클릭 시 답변 작성하는 textarea생성
answerBtn.addEventListener("click",() => {
    
    let answerTitle = document.getElementById("manager--answerTitle");
    if (answerTitle) {
        answerTitle.parentNode.removeChild(answerTitle);
        
    }
    let answerManager = document.getElementById("manager--answerManager");
    if (answerManager) {
        answerManager.parentNode.removeChild(answerManager);
        
    }
    let answerText = document.getElementById("manager--answerText");
    if (answerText) {
        answerText.parentNode.removeChild(answerText);
        
    }
    let aBtns = document.getElementById("manager--aBtns");
    if (aBtns) {
        aBtns.parentNode.removeChild(aBtns);
    }


    const answerTitleWrite = document.createElement("div");
    answerTitleWrite.className='manager--inquiryAnswerTitle';
    answerTitleWrite.innerText="A. 문의에 대한 답변드립니다.";
    answerWrite.append(answerTitleWrite);
    
    
    const managerNickname = document.createElement("div");
    managerNickname.className='manager--inquiryAnswerTitle';
    answerTitleWrite.append(managerNickname);
    
    
    const managerArea = document.createElement("div");
    managerArea.className='manager--managerArea';
    managerArea.innerText="문의에 대한 답변을 작성해주세요.";
    answerWrite.append(managerArea);
    
    
    const answerTextBefore = document.createElement("div");
    answerTextBefore.className='manager--answerTextBefore';
    answerWrite.append(answerTextBefore);

    answerForm = document.createElement("form");
    answerForm.action = "/manager/askManager_detail/"+ feedbackNo;
    answerForm.id = "manager--answerForm";
    answerForm.method = "post";
    answerTextBefore.append(answerForm);
    
    let answerTextarea = document.createElement("textarea");
    answerTextarea.className='manager--answerTextarea';
    answerTextarea.id='manager--textarea';
    answerTextarea.name='AdminText';
    answerForm.append(answerTextarea);
    answerTextarea.focus();
    
    const answerBtns = document.createElement("div");
    answerBtns.className='manager--answerBtns';
    answerForm.append(answerBtns);
    
    const answerStartBTN = document.createElement("button");
    answerStartBTN.setAttribute("type", "button");
    answerStartBTN.className='manager--answerStartBTN';
    answerStartBTN.innerText="완료";
    answerBtns.append(answerStartBTN);
    

    
    // (AJAX)
    answerStartBTN.addEventListener("click", () => {

        
        const data = {"feedbackNo" : feedbackNo,
        "adminText" : answerTextarea.value, 
        "adminNo" : loginMemberNo 
        }

        fetch("/manager/askManager_detail/"+ feedbackNo,{
            method : "post",
            headers : {"Content-Type" : "application/json"},
            body : JSON.stringify(data)
            
            
        })
        .then(resp=>resp.text())
        .then(result => {

            console.log(result)
            if(result > 0){
                // alert("1:1문의 답변이 등록되었습니다.");
                const Toast = Swal.mixin({
                    toast: true,
                    position: 'top-end', /* 우측 상단 */
                    showConfirmButton: false, /* 컨펌버튼 없음 */
                    timer: 3000, /* 3초 간 뜨기 */
                    timerProgressBar: true, /* 진행바 */
                    showCloseButton: true, /* 취소 버튼 */
                    didOpen: (toast) => {
                        toast.addEventListener('mouseenter', Swal.stopTimer)
                        toast.addEventListener('mouseleave', Swal.resumeTimer)
                    }
                    })
            
                    Toast.fire({
                        icon: 'success', /* 아이디 실패 시 ! 경고 */
                        title: '1:1문의 답변이 등록되었습니다.' /* 메시지 담기 */
                })
                location.reload();

            }else{
                // alert("1:1문의 답변 등록 실패");
                const Toast = Swal.mixin({
                    toast: true,
                    position: 'top-end', /* 우측 상단 */
                    showConfirmButton: false, /* 컨펌버튼 없음 */
                    timer: 3000, /* 3초 간 뜨기 */
                    timerProgressBar: true, /* 진행바 */
                    showCloseButton: true, /* 취소 버튼 */
                    didOpen: (toast) => {
                        toast.addEventListener('mouseenter', Swal.stopTimer)
                        toast.addEventListener('mouseleave', Swal.resumeTimer)
                    }
                    })
            
                    Toast.fire({
                        icon: 'warning', /* 아이디 실패 시 ! 경고 */
                        title: '1:1문의 답변에 실패했습니다.' /* 메시지 담기 */
                })
            }
        })
        .catch(err => console.log(err));
            

    });

    
});

