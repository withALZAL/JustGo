const insertBtn = document.querySelector("#insertBtn");

if (insertBtn != null) {

    insertBtn.addEventListener("click", () => {

        // JS BOM중 location
        //location.htrf = "주소"

        // 해당주소 요청 (GET 방식)

        location.href = `/board2/${location.pathname.split("/")[2]}/insert`;
        //   /board2/1/insert
    })

}

function basic(tagNo) { 

    fetch("/board/boardList/tag?tagNo=" + tagNo + "&boardCode="+boardCode)
        .then(resp => resp.json())
        .then(result => {
            console.log(result)
            const boardtaglist = document.getElementById("tagList")

            boardtaglist.innerHTML="";

            for(let f of result){
                const tr1 = document.createElement("tr");
                const td1 = document.createElement("td");
                td1.innerHTML = f.boardNo;
                const td2 = document.createElement("td");
                td2.innerHTML = f.tagContent;
                const td3 = document.createElement("td");
                    const a1 = document.createElement("a")
                    a1.innerHTML = f.boardTitle;   
                const td4 = document.createElement("td");
                td4.innerHTML = f.memberNickname;
                const td5 = document.createElement("td");
                td5.innerHTML = f.createDate;
                const td6 = document.createElement("td");
                td6.innerHTML = f.readCount;
                const td7 = document.createElement("td");
                td7.innerHTML = f.likeCount;

                tr1.append(td1,td2,td3,td4,td5,td6,td7);

                td3.append(a1);

                boardtaglist.append(tr1);

            }
        })
        .catch(err => console.log(err));
}