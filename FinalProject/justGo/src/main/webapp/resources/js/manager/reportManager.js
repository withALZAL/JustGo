
function conbtn(reportNo){
    fetch("/manager/conbtn?reportNo=" + reportNo)
    .then(resp => resp.text())
    .then(result => {
        if(result > 0){
            alert("신고 처리 완료");
            location.href =  location.href ;
        }else{
            alert("신고 처리 실패")
        }
    })
    .catch(err => console.log(err));
}