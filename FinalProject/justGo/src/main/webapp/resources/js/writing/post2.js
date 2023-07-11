

document.getElementById("deleteBtn1").addEventListener("click",()=>{
    // http://localhost/board/2/175?cp=1
    // http://localhost/writing/{boardCode}/{boardNo}/update
    // 1. location.href = boardNo + "/update";
    

    if(confirm("정말 삭제 하시겠습니까")){
    const pathname =location.pathname.replace("board","writing")+ "/delete";

    location.href = pathname;
    }
});

