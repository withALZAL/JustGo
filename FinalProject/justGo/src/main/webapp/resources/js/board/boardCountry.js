
function basic2(tagNo,cp) { 

    let url = "/board/boardList/tag2?tagNo=" + tagNo + "&countryNo="+countryNo;

    if(cp != undefined){
        url += "&cp="+cp;
    }

    fetch(url)
        .then(resp => resp.json())
        .then(result => {
            console.log(result)
            console.log(result.tagBoardCountryList)
            
            
            const boardtaglist = document.getElementById("tagList2");
            const page = document.getElementById("page2");

            boardtaglist.innerHTML="";
            page.innerHTML="";

            const li1 = document.createElement("li");
            li1.classList.add("page-item");
            const ap1 = document.createElement("a");
            ap1.classList.add("page-link");
            ap1.innerHTML="맨처음";
            ap1.setAttribute("onclick",`basic2(${tagNo},1)`);
            ap1.href=`#`;
            const li2 = document.createElement("li");
            li2.classList.add("page-item");
            const ap2 = document.createElement("a");
            ap2.classList.add("page-link");
            ap2.setAttribute("onclick",`basic2(${tagNo},${result.pagination.prevPage})`);
            ap2.href=`#`;
            ap2.innerHTML="이전";
            
            
            li1.append(ap1);
            li2.append(ap2);
            page.append(li1,li2);
            
            for(let f of result.tagBoardCountryList){
                const tr1 = document.createElement("tr");
                const td1 = document.createElement("td");
                td1.innerHTML = f.boardNo;
                const td2 = document.createElement("td");
                td2.innerHTML = f.tagContent;
                const td3 = document.createElement("td");
                const a1 = document.createElement("a");
                a1.innerHTML = f.boardTitle + "["+f.commentCount+"]";   
                a1.href =  `/board/1/${f.countryNo}/${f.boardNo}`;
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
            
            for(let p = result.pagination.startPage; p <= result.pagination.endPage; p++){
                
                if(p == result.pagination.currentPage){
                    const li3 = document.createElement("li");
                    li3.classList.add("page-item");
                    li3.classList.add("active");
                    const ap3 = document.createElement("a");
                    ap3.classList.add("page-link");
                    ap3.innerHTML=p;
                    li3.append(ap3);
                    page.append(li3);
                    
                }else{
                    const li4 = document.createElement("li");
                    li4.classList.add("page-item");
                    const ap4 = document.createElement("a");
                    ap4.classList.add("page-link");
                    ap4.innerHTML=p;
                    ap4.setAttribute("onclick",`basic2(${tagNo},${p})`);
                    ap4.href=`#`;
                    li4.append(ap4);
                    page.append(li4);
                }
                
            }
            const li5 = document.createElement("li");
            li5.classList.add("page-item");
            const ap5 = document.createElement("a");
            ap5.classList.add("page-link");
            ap5.innerHTML="다음";
            ap5.setAttribute("onclick",`basic2(${tagNo},${result.pagination.nextPage})`);
            ap5.href=`#`;
            const li6 = document.createElement("li");
            li6.classList.add("page-item");
            const ap6 = document.createElement("a"); 
            ap6.classList.add("page-link");
            ap6.innerHTML="마지막";
            ap6.setAttribute("onclick",`basic2(${tagNo},${result.pagination.maxPage})`);
            ap6.href=`#`;

            li5.append(ap5);
            li6.append(ap6);
            page.append(li5,li6);
        })
        .catch(err => console.log(err));
}