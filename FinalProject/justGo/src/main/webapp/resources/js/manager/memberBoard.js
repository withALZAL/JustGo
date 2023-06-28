// const delBtn = document.getElementById("manager--delBtn")

// delBtn.addEventListener("click" , () => {

//     if(confirm("정말 삭제하시겠습니까?")){
//         location.href =  location.href ;
//     }

// });



function nobtn(boardNo){
    fetch("/manager/nobtn?boardNo=" + boardNo)
    .then(resp => resp.text())
    .then(result => {
        if(result > 0){
            alert("삭제되었습니다.");
            location.href =  location.href ;
        }else{
            alert("삭제 실패")
        }
    })
    .catch(err => console.log(err));
}