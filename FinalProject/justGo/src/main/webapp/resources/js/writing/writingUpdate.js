// 게시글 수정 시 제목, 내용 작성 여부 검사
const wirteUpdateFrm = document.getElementById('wirteUpdateFrm');

// const boardTitle = document.querySelector("[name=boardTitle]");

// const boardText = document.querySelector("[name=boardText]");

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

// 선택된 select 값 유지하기
document.addEventListener("DOMContentLoaded", function() {
    
    // 수정 버튼을 눌렀을 때 게시글의 countryNo 와 
    // select 의 option들 중에 value  일치하는  요소에 selected 속성 추가하기


    const boardSelect = document.getElementById("boardSelect");
    const tagSelector = document.getElementById("tagSelector");

    for (let i = 0; i<boardSelect.options.length ; i++){

        if(boardSelect.options[i].value == countryNo){
            boardSelect.options[i].selected = true;
        } 

        if(boardSelect.options[i].value ==  boardCode){
            boardSelect.options[i].selected = true;
        }
    }

    for(let i =0; i<tagSelector.options.length; i++){

        if(tagSelector.options[i].value == countryNo){
            tagSelector.options[i].selected = true;
        }

        if(tagSelector.options[i].value == boardCode){
            tagSelector.options[i].selected = true;
        }
    }
    
});


