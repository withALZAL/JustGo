// 게시글 수정 시 제목, 내용 작성 여부 검사
const wirteUpdateFrm = document.getElementById('writeFrm');

const boardTitle = document.querySelector("[name=boardTitle]");

const boardText = document.querySelector("[name=boardText]");

wirteUpdateFrm.addEventListener("submit", e => {

    if(boardTitle.value.trim().length == 0 ){
        alert("제목을 입력해주세요.");
        boardTitle.value = "";
        boardTitle.focus();
        e.preventDefault();
        return;
    }

    if(boardText.value.trim().length == 0 ){
        alert("내용을 입력해주세요.");
        boardText.value = "";
        boardText.focus();
        e.preventDefault();
        return;
    }


});
