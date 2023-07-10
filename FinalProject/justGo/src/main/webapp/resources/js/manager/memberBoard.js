
function nobtn(boardNo){
    fetch("/manager/nobtn?boardNo=" + boardNo)
    .then(resp => resp.text())
    .then(result => {
        if(result > 0){
            // alert("게시글이 삭제되었습니다.");
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
                    title: '게시글이 삭제되었습니다.' /* 메시지 담기 */
            })
            location.href =  location.href ;
        }else{
            // alert("게시글 삭제 실패")
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
                    title: '게시글 삭제 실패' /* 메시지 담기 */
            })
        }
    })
    .catch(err => console.log(err));
}



function rebtn(boardNo){
    fetch("/manager/rebtn?boardNo=" + boardNo)
    .then(resp => resp.text())
    .then(result => {
        if(result > 0){
            // alert(" 게시글이 복원되었습니다.");
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
                    title: '게시글이 복원되었습니다.' /* 메시지 담기 */
            })
            location.href =  location.href ;
        }else{
            // alert("게시글 복원 실패")
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
                    title: '게시글 복원 실패' /* 메시지 담기 */
            })
        }
    })
    .catch(err => console.log(err));
}