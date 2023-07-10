// 게시글 등록 시 제목, 내용 작성 여부 검사
const writeAskFrm = document.getElementById('writeAskFrm');
const askTitle = document.querySelector("[name=feedbackTitle]");
const askText = document.querySelector("[name=feedbackText]");

writeAskFrm.addEventListener("submit", e => {

    if(askTitle.value.trim().length == 0 ){
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
        askTitle.value = "";
        askTitle.focus();
        e.preventDefault();
        return;
    }

    if(askText.value.trim().length == 0 ){
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
        askText.value = "";
        askText.focus();
        e.preventDefault();
        return;
    }


});

