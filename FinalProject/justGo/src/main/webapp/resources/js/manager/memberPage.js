
function nobtn(boardNo){
    fetch("/manager/nobtn?boardNo=" + boardNo)
    .then(resp => resp.text())
    .then(result => {
        if(result > 0){
            alert("게시글이 삭제되었습니다.");
            location.href =  location.href ;
        }else{
            alert("게시글 삭제 실패")
        }
    })
    .catch(err => console.log(err));
}



function rebtn(boardNo){
    fetch("/manager/rebtn?boardNo=" + boardNo)
    .then(resp => resp.text())
    .then(result => {
        if(result > 0){
            alert(" 게시글이 복원되었습니다.");
            location.href =  location.href ;
        }else{
            alert("게시글 복원 실패")
        }
    })
    .catch(err => console.log(err));
}