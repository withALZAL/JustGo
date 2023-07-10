// 좋아요 버튼이 클릭 되었을 때!
const boardLike = document.getElementById("boardLike");

boardLike.addEventListener("click",e=>{

if(loginMemberNo==""){
    // alert("로그인 후 이용해주세요!")
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
            title: '로그인 후 이용해주세요.' /* 메시지 담기 */
        })
    return;
}

let check; // 기존에 좋아요가 X(빈하트) : 00
           // 좋아요 O : 1(꽉찬하트) 

// contains("클래스명") : 클래스가 있으면 true, 없으면 false
if(e.target.classList.contains("fa-regular")){ // 빈하트
    check = 0; 
}else{ // 꽉찬하트
    check = 1; 
}

// ajax로 서버로 제출할 파라미터를 모아둔 JS객체
const data = {"boardNo" : boardNo, "memberNo" : loginMemberNo,"check": check};

// ajax 코드 작성
fetch("/board/like",{
    method : "POST",
    headers : {"Content-Type" : "application/json"},
    body : JSON.stringify(data)
    
})

.then(resp=>resp.text()) // 응답 객체를 필요한 형태로 파싱
.then(count=>{
    console.log("count:"+count);

    if(count == -1){ // insert or delete 실패시 
        console.log("좋아요 처리 실패");
        return;

    }
    // toggle() : 클래스가 있으면 없애고 없으면 추가하고 
    e.target.classList.toggle("fa-regular");
    e.target.classList.toggle("fa-solid");
    // 현재 게시글의 좋아요 수를 화면에 출력
    e.target.parentElement.nextElementSibling.innerText=count;




}) // 파싱된 데이터를 받아서 처리하는 코드 작성
.catch(err=>{
    console.log("예외 발생");
    console.log(err);
})

});

// document.getElementById("deleteBtn1").addEventListener("click",()=>{
//     // http://localhost/board/2/175?cp=1
//     // http://localhost/writing/{boardCode}/{boardNo}/update
//     // 1. location.href = boardNo + "/update";

//     const pathname =location.pathname.replace("board","writing")+ "/delete";

//     location.href = pathname;

// });



document.getElementById("updateBtn").addEventListener("click",()=>{
    // http://localhost/board/2/175?cp=1
    // http://localhost/writing/{boardCode}/{boardNo}/update
    // 1. location.href = boardNo + "/update";

    const pathname =location.pathname.replace("board","writing")+ "/update";

    location.href = pathname;

});

document.getElementById("deleteBtn").addEventListener("click",()=>{
    // http://localhost/board/2/175?cp=1
    // http://localhost/writing/{boardCode}/{boardNo}/update
    // 1. location.href = boardNo + "/update";

    const pathname =location.pathname.replace("board","writing")+ "/delete";

    location.href = pathname;

});







// 회원이 게시글 신고
function reportBoardBtn(boardNo){
    
    let reportReason = document.getElementById("reportReason");
    let etc = document.getElementById("etc");
    const category = document.querySelector('input[name="reportCategory"]:checked');
    
    if(!category){
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
            title: '신고 사유를 선택해주세요.' /* 메시지 담기 */
        })
        return;
    }

    if(etc.checked){
        etc.value = reportReason.value;
    }
    
    
    const reportCategory = document.querySelector('input[name="reportCategory"]:checked').value;
    const data = {"boardNo" : boardNo,
            "reportCategory" : reportCategory, 
            "memberNo" : loginMemberNo 
    }

    fetch("/board/reportBoardBtn/" + boardNo, {
        method: "POST",
        headers: {"Content-Type": "application/json"},    
        body: JSON.stringify(data)
    })
    .then(resp => resp.text())
    .then(result => {
        console.log(result)
        if(result > 0){

            // const alarmContent = memberNickname+"님께서 " + boardTitle +" 게시글을 신고하셨습니다.";

            sendMessage(loginMemberNo, memberNickname, boardNo, boardTitle);
            // alert("해당 게시글을 신고하였습니다.");
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
                    title: '해당 게시물을 신고하였습니다.' /* 메시지 담기 */
                })
            location.href =  location.href ;
            // sendMessage(1, memberNickname, boardTitle.replace(/"가 &quot;/g, ''));
        }else{
            // alert("게시물 신고 실패...")
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
                    title: '이미 신고한 게시글입니다.' /* 메시지 담기 */
                })
        }
    })
    .catch(err => console.log(err));
}

