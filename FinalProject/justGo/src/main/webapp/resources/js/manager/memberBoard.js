const delBtn = document.getElementById("manager--delBtn")

delBtn.addEventListener("click" , () => {

    if(confirm("정말 삭제하시겠습니까?")){
        location.href =  location.href ;
    }

});