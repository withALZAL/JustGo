// 두 번째 선택 옵션 변경 함수
document.querySelector("#boardSelect").addEventListener("change", e => {

    const boardSelect = e.target;
    
    // console.log(boardSelect); // select 태그
    // console.log(boardSelect.options); // select 태그의 option 태그들

    // boardSelect.selectedIndex : boardSelect에서 선택된 option의 인덱스
    console.log(boardSelect.options[boardSelect.selectedIndex]); // 선택된 option 요소

    const option = boardSelect.options[boardSelect.selectedIndex];

    console.log(option.className);

    if(option.className == "b"){ // 자유게시판, 질문 게시판 선택 
        boardSelect.name = 'boardCode';
    }else{
        boardSelect.name = 'countryNo';
    }

});