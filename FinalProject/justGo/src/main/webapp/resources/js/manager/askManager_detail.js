const answerBtn = document.getElementById("manager--answerStartBtn");
const answerBox = document.getElementsByClassName("manager--inquiryAnswerBox");
let answerWrite = document.getElementById("manager--answerWrite");

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

    const answerForm = document.createElement("form");
    answerForm.action = "/askManager_detail/{feedbackNo}";
    answerForm.id = "manager--answerForm";
    answerForm.method = "put";
    answerTextBefore.append(answerForm);
    
    const answerTextarea = document.createElement("textarea");
    answerTextarea.className='manager--answerTextarea';
    answerTextarea.id='manager--textarea';
    answerForm.append(answerTextarea);
    answerTextarea.focus();
    
    const answerBtns = document.createElement("div");
    answerBtns.className='manager--answerBtns';
    answerForm.append(answerBtns);
    
    const answerStartBTN = document.createElement("button");
    answerStartBTN.className='manager--answerStartBTN';
    answerStartBTN.style.disabled;
    answerStartBTN.innerText="완료";
    answerBtns.append(answerStartBTN);
    
    
    
});

const answerForm = document.getElementsByClassName("manager--answerForm");
const managerTextarea = document.getElementsByClassName("manager--textarea");
// const answerStartBTN = document.getElementsByClassName("manager--answerStartBTN");




answerForm.addEventListener("submit", e=>{

    if(managerTextarea.value === ""){
        alert="답변을 입력해주세요."
        managerTextarea.focus();
        e.preventDefault();
        return;
    }

});
