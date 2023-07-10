// 게시글 수정 시 제목, 내용 작성 여부 검사
const wirteUpdateFrm = document.getElementById('wirteUpdateFrm');

// const boardTitle = document.querySelector("[name=boardTitle]");

// const boardText = document.querySelector("[name=boardText]");

wirteUpdateFrm.addEventListener("submit", e => {

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

    if (contentTemp === '') {
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

    // console.log(temp[1]);


    // e.preventDefault();

});

// 선택된 select 값 유지하기
document.addEventListener("DOMContentLoaded", function () {

    // 수정 버튼을 눌렀을 때 게시글의 countryNo 와 
    // select 의 option들 중에 value  일치하는  요소에 selected 속성 추가하기


    const boardSelect = document.getElementById("boardSelect");
    const tagSelector = document.getElementById("tagSelector");
    // 현재 선택된 옵션의 값을 변수 opt에 저장하고
    const opt = boardSelect.options[boardSelect.selectedIndex];
    // 선택된 옵션의 값이 class b 가 있는 것이 true  아니면 false
    const hasClassB = opt.classList.contains("b");

    for (let i = 0; i < boardSelect.options.length; i++) {
        if (boardSelect.options[i].value == countryNo) {
            boardSelect.options[i].selected = true;
            boardSelect.name = "countryNo";
        }

        if (boardSelect.options[i].value == boardCode) {
            boardSelect.options[i].selected = true;
        }
    }

    if (boardSelect.options[boardSelect.selectedIndex].value == 2 && hasClassB) {
        tagSelector.style.display = "none";
        tagSelector.removeAttribute("name");
    }

    for (let i = 0; i < tagSelector.options.length; i++) {
        if (tagSelector.options[i].innerText == tagContent) {
            tagSelector.options[i].selected = true;
        }
    }
});



// 수정버튼 눌렀을 때 자유게시판 선택 시 tagSelector 안보이게 하는 로직 
const boardSelect1 = document.getElementById("boardSelect");
const tagSelector1 = document.getElementById("tagSelector");

boardSelect1.addEventListener("change", () => {

    const opt = boardSelect1.options[boardSelect1.selectedIndex];
    const value = opt.value
    const hasClassB = opt.classList.contains("b");

    if (value == 2 && hasClassB) {
        tagSelector1.style.display = "none";
        tagSelector1.removeAttribute("name");

    } else {
        tagSelector1.style.display = "block";
        tagSelector1.setAttribute("name", "tagNo")

    }


});