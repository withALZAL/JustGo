const askDeleteBtn = document.getElementById("askDeleteBtn");

askDeleteBtn.addEventListener("click", () => {

    if(confirm("정말 삭제하시겠습니까?")){
        location.href = `ask/boardAsk/${loginMemberNo}`;
    }

});
