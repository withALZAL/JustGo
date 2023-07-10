// 두 번째 선택 옵션 변경 함수
document.querySelector("#boardSelect").addEventListener("change", e => {

    const boardSelect = e.target;

    // console.log(boardSelect); // select 태그
    // console.log(boardSelect.options); // select 태그의 option 태그들

    // boardSelect.selectedIndex : boardSelect에서 선택된 option의 인덱스
    console.log(boardSelect.options[boardSelect.selectedIndex]); // 선택된 option 요소

    const option = boardSelect.options[boardSelect.selectedIndex];

    console.log(option.className);

    if (option.className == "b") { // 자유게시판, 질문 게시판 선택 
        boardSelect.name = 'boardCode';
    } else {
        boardSelect.name = 'countryNo';
    }

});


// 게시글 등록 시 제목, 내용 작성 여부 검사
const writeFrm = document.getElementById('writeFrm');

const boardTitle = document.querySelector("[name=boardTitle]");

const boardText = document.querySelector("[name=boardText]");

writeFrm.addEventListener("submit", e => {

    if (boardTitle.value.trim().length == 0) {
        // alert("제목을 입력해주세요.");
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
                title: '제목을 입력해주세요.' /* 메시지 담기 */
            })
        boardTitle.value = "";
        boardTitle.focus();
        e.preventDefault();
        return;
    }

    const contentTemp = boardText.value.replaceAll("<p>", "").replaceAll("</p>", "").replaceAll("<br>", "").replaceAll("&nbsp;", "").replaceAll(" ", "");

    if (contentTemp === "") {
        // alert("내용을 입력해주세요.");
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
                title: '내용을 입력해주세요.' /* 메시지 담기 */
            })
        boardText.value = "";
        boardText.focus();
        e.preventDefault();
        return;
    }

    const regExp = /<img[^>]+src\s*=\s*['"]([^'"]+)['"][^>]*>/g;

    let temp = regExp.exec(boardText.value);

    if (temp != null) {
        document.querySelector("#thumbnail").value = temp[1];
    }
});



// 글쓰기 버튼을 눌렀을 때 countryNO의 select의 options 들 중에 value 일치하는 요소(배열에 있는 요소)에 selected 속성 추가하기 
document.addEventListener("DOMContentLoaded", function () {

    const boardSelect = document.getElementById("boardSelect"); // boardSelect 의 아이디와 일치하는 요소(객체) 불러오기



    if (countryNo == '') { //처음 메인화면의 주소가 공백이라면 (질문, 자유)
        const optionList = document.querySelectorAll("#boardSelect .b"); // boardSelect 들 중에 자식인 b 전체을 선택

        for (let option of optionList) { // boardSelect의 optionList 의 요소들 중에 하나의 요소를 꺼내서
            if (option.value == boardCode) { // option의 value와 boardCode (주소) 같다면
                option.selected = true; // option의 value 일치하는 요소에 selected 속성 추가
                
            }
            


        }
        if(boardCode ==2 ){
            const tagSelector = document.getElementById("tagSelector");
            tagSelector.style.display="none";

        }
        

    } else {
        for (let i = 0; i < boardSelect.options.length; i++) { // for 문을 돌려 boardSelect.options.length 만큼 불러오기

            if (boardSelect.options[i].value == countryNo) { // boardSelect.options의 요소가 countryNo 와 같다면 (여행)

                boardSelect.options[i].selected = true; // boardSelect 의 options 들 중에 value 일치하는 요소에 selected 속성 추가

                boardSelect.name = "countryNo"; // 여행게시판의 글쓰기 버튼을 들어가면 boardSelect option의 value을 countryNo 로 지정
            }
        }
    }


    history.replaceState({}, null, location.pathname);
    // url의 주소창을 없애기 /* jsp의 주소 설정 http://localhost/writing/writingBoard/***?boardCode=1&countryNo=1 지우기***/


});

const boardSelect = document.getElementById("boardSelect");
const tagSelector = document.getElementById("tagSelector");

boardSelect.addEventListener("change", function() {
    const selectedOption = boardSelect.options[boardSelect.selectedIndex];
    const value = selectedOption.value;
    const hasClassB = selectedOption.classList.contains("b");

    if (value === "2" && hasClassB) {
        tagSelector.style.display = "none";
        tagSelector.removeAttribute("name");

    } else {
        tagSelector.style.display = "block";
        tagSelector.setAttribute("name","tagNo");
    }
});
