
function deleteMemberBtn(memberNo){
    fetch("/manager/deleteMemberBtn?memberNo=" + memberNo)
    .then(resp => resp.text())
    .then(result => {
        if(result > 0){
            alert("강퇴 성공!");
            location.href =  location.href ;
        }else{
            alert("강퇴 실패...")
        }
    })
    .catch(err => console.log(err));
}



function restoreMemberBtn(memberNo){
    fetch("/manager/restoreMemberBtn?memberNo=" + memberNo)
    .then(resp => resp.text())
    .then(result => {
        if(result > 0){
            alert("계정복구 성공!");
            location.href =  location.href ;
        }else{
            alert("계정복구 실패...")
        }
    })
    .catch(err => console.log(err));
}
