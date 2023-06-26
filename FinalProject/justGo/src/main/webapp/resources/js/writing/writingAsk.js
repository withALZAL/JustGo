// 게시글 등록 시 제목, 내용 작성 여부 검사
const writeAskFrm = document.getElementById('writeAskFrm');
const askTitle = document.querySelector("[name=askTitle]");
const askText = document.querySelector("[name=askText]");

writeAskFrm.addEventListener("submit", e => {

    if(askTitle.value.trim().length == 0 ){
        alert("제목을 입력해주세요.");
        askTitle.value = "";
        askTitle.focus();
        e.preventDefault();
        return;
    }

    if(askText.value.trim().length == 0 ){
        alert("내용을 입력해주세요.");
        askText.value = "";
        askText.focus();
        e.preventDefault();
        return;
    }


});

