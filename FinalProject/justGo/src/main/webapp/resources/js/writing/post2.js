

document.getElementById("deleteBtn1").addEventListener("click",()=>{
    // http://localhost/board/2/175?cp=1
    // http://localhost/writing/{boardCode}/{boardNo}/update
    // 1. location.href = boardNo + "/update";

    const pathname =location.pathname.replace("board","writing")+ "/delete";

    location.href = pathname;

});

