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

    // const contentTemp = boardText.value.replaceAll("<p>","").replaceAll("</p>","").replaceAll("<br>","").replaceAll("&nbsp;","").replaceAll(" ",""); 
    
    if(contentTemp === '' ){
        alert("내용을 입력해주세요.");
        boardText.value = "";
        boardText.focus();
        e.preventDefault();
        return;
    }

    const regExp =  /<img[^>]+src\s*=\s*['"]([^'"]+)['"][^>]*>/g;

    let temp = regExp.exec(boardText.value);

    if(temp != null){
        document.querySelector("#thumbnail").value = temp[1];
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
            boardSelect.name="countryNo";
        } 

        if(boardSelect.options[i].value ==  boardCode){
            boardSelect.options[i].selected = true;
        }
    }

    for(let i =0; i<tagSelector.options.length; i++){

        if(tagSelector.options[i].value == tagNo){
            tagSelector.options[i].selected = true;
        }

        
    }
    
});


