
// 댓글 목록 조회
function selectReplyList(){

    fetch("/comment?boardNo="+boardNo)
    .then(resp => resp.json())
    .then(rList => {
        console.log("rList: "+rList);

        // 화면에 출력되어 잇는 댓글 목록을 삭제
        const replyList = document.getElementById("replyList"); // tbody
        replyList.innerHTML="";

        // rList에 저장된 요소 하나씩 접근
        for(let reply of rList){

            // 행
            const replyRow = document.createElement("tr");
            replyRow.classList.add("reply-row");
            
            // 답글일 경우 자식 클래스 추가
            if(reply.parentReplyNo != 0) replyRow.classList.add("child-reply");

            // 답글인 경우
            if(replyRow.classList.contains("child-reply")){
            // 작성자 
            const replyWriter = document.createElement("th");
            replyWriter.classList.add("writing--commentProfileBox");

            // 답글
            const replyChild = document.createElement("span");
            replyChild.classList.add("writing--commentProfileBox__reply");

            // 답글 이미지
            const replyCheck = document.createElement("i");
            replyCheck.classList.add("fa-solid");
            replyCheck.classList.add("fa-reply");
            replyCheck.classList.add("fa-rotate-180");


            // 프로필 이미지 태그
            const profileBox = document.createElement("span");
            profileBox.classList.add("writing--commentProfileBox__profileImage");

            // 프로필 이미지
            const profileImage = document.createElement("img");

            if(reply.profileImage != null){
                profileImage.setAttribute("src",reply.profileImage);
            } else{
                profileImage.setAttribute("src","/resources/images/officialProfile/COMMONPROFILE.png");
            }
            
            // 닉네임
            const replyNickname = document.createElement("span");
            replyNickname.classList.add("writing--commentProfileBox__profileName");
            replyNickname.innerText = reply.memberNickname;
            
            // 작성자 영역에 프로필 관련 추가
            replyChild.append(replyCheck);
            replyWriter.append(replyChild,profileBox,replyNickname);
            profileBox.append(profileImage);

            // 댓글 내용
            const replyContent = document.createElement("td");
            replyContent.classList.add("writing--commentContentBox");
            replyContent.innerHTML = reply.replyContent;

            // 작성일
            const replyDate = document.createElement("td");
            replyDate.classList.add("writing--commentDateBox");
            replyDate.innerHTML = reply.replyDate;

            // 행에 작성자 내용 추가 
            replyRow.append(replyWriter,replyContent,replyDate);

            // 로그인시 답글 버튼
            if(loginMemberNo !=""){
                // 버튼 추가 
                const btnArea = document.createElement("td");
                btnArea.classList.add("writing--commentBtnBox");
            
                // 답글 버튼
                const childReplyBtn = document.createElement("button");
                childReplyBtn.classList.add("btn");
                childReplyBtn.classList.add("btn-primary");
                childReplyBtn.classList.add("btn-sm");
                childReplyBtn.setAttribute("onclick", "showInsertComment("+reply.replyNo+", this)");
                childReplyBtn.innerText= "답글";

                // childReplyBtn.style.marginLeft = "2px"; /* 상준 */
                // childReplyBtn.style.marginRight = "2px"; /* 상준 */
                // childReplyBtn.style.paddingRight = "6px"; /* 상준 */
                // childReplyBtn.style.paddingLeft = "6px"; /* 상준 */
                // childReplyBtn.style.paddingTop = "1px"; /* 상준 */
                // childReplyBtn.style.paddingBottom = "1px"; /* 상준 */
                // childReplyBtn.style.border = "none"; /* 상준 */



                // 버튼 영역에 답글 버튼 추가
                btnArea.append(childReplyBtn);

                if(loginMemberNo == reply.memberNo){
                    // 수정 버튼
                    const updateBtn = document.createElement("button");
                    updateBtn.classList.add("btn");
                    updateBtn.classList.add("btn-primary");
                    updateBtn.classList.add("btn-sm");
                    updateBtn.innerText = "수정";

                    // updateBtn.style.marginLeft = "2px"; /* 상준 */
                    // updateBtn.style.marginRight = "2px"; /* 상준 */
                    // updateBtn.style.paddingRight = "6px"; /* 상준 */
                    // updateBtn.style.paddingLeft = "6px"; /* 상준 */
                    // updateBtn.style.paddingTop = "1px"; /* 상준 */
                    // updateBtn.style.paddingBottom = "1px"; /* 상준 */
                    // updateBtn.style.border = "none"; /* 상준 */

                    // 수정버튼에 이벤트 추가
                    updateBtn.setAttribute("onclick", "showUpdateComment("+reply.replyNo+", this)");
                    
                    // 삭제버튼
                    const deleteBtn = document.createElement("button");
                    deleteBtn.classList.add("btn");
                    deleteBtn.classList.add("btn-danger");
                    deleteBtn.classList.add("btn-sm");
                    deleteBtn.innerText = "삭제";

                    // deleteBtn.style.marginLeft = "2px"; /* 상준 */
                    // deleteBtn.style.marginRight = "2px"; /* 상준 */
                    // deleteBtn.style.paddingRight = "6px"; /* 상준 */
                    // deleteBtn.style.paddingLeft = "6px"; /* 상준 */
                    // deleteBtn.style.paddingTop = "1px"; /* 상준 */
                    // deleteBtn.style.paddingBottom = "1px"; /* 상준 */
                    // deleteBtn.style.border = "none"; /* 상준 */

                    // 삭제 버튼에 onclick 이벤트 속성 추가
                    deleteBtn.setAttribute("onclick", "deleteComment("+reply.replyNo+")");                       

                    // 버튼 영역 마지막 자식으로 수정/삭제 버튼 추가
                    btnArea.append(updateBtn,deleteBtn);

                } // if 
                //  실험
                else if( loginMemberRole==1){

                    // 수정 버튼
                    const updateBtn = document.createElement("button");
                    updateBtn.classList.add("btn");
                    updateBtn.classList.add("btn-primary");
                    updateBtn.classList.add("btn-sm");
                    updateBtn.innerText = "수정";

                    // updateBtn.style.marginLeft = "2px"; /* 상준 */
                    // updateBtn.style.marginRight = "2px"; /* 상준 */
                    // updateBtn.style.paddingRight = "6px"; /* 상준 */
                    // updateBtn.style.paddingLeft = "6px"; /* 상준 */
                    // updateBtn.style.paddingTop = "1px"; /* 상준 */
                    // updateBtn.style.paddingBottom = "1px"; /* 상준 */
                    // updateBtn.style.border = "none"; /* 상준 */

                    // 수정버튼에 이벤트 추가
                    updateBtn.setAttribute("onclick", "showUpdateComment("+reply.replyNo+", this)");
                    
                    // 삭제버튼
                    const deleteBtn = document.createElement("button");
                    deleteBtn.classList.add("btn");
                    deleteBtn.classList.add("btn-danger");
                    deleteBtn.classList.add("btn-sm");
                    deleteBtn.innerText = "삭제";

                    // deleteBtn.style.marginLeft = "2px"; /* 상준 */
                    // deleteBtn.style.marginRight = "2px"; /* 상준 */
                    // deleteBtn.style.paddingRight = "6px"; /* 상준 */
                    // deleteBtn.style.paddingLeft = "6px"; /* 상준 */
                    // deleteBtn.style.paddingTop = "1px"; /* 상준 */
                    // deleteBtn.style.paddingBottom = "1px"; /* 상준 */
                    // deleteBtn.style.border = "none"; /* 상준 */

                    // 삭제 버튼에 onclick 이벤트 속성 추가
                    deleteBtn.setAttribute("onclick", "deleteComment("+reply.replyNo+")");                       

                    // 버튼 영역 마지막 자식으로 수정/삭제 버튼 추가
                    btnArea.append(deleteBtn,updateBtn);
                    updateBtn.style.display="none";
                    
                }


                replyRow.append(btnArea);
            }
            replyList.append(replyRow);
            
            // 답글
            } else{

                // 작성자 
                const replyWriter = document.createElement("th");
                replyWriter.classList.add("writing--commentProfileBox");
    
                // // 답글
                // const replyChild = document.createElement("span");
                // replyChild.classList.add("writing--commentProfileBox__reply");
    
                // // 답글 이미지 
                // const replyCheck = document.createElement("i");
                // replyCheck.classList.add("fa-solid");
                // replyCheck.classList.add("fa-reply");
                // replyCheck.classList.add("fa-rotate-180");
    
    
                // 프로필 이미지 태그
                const profileBox = document.createElement("span");
                profileBox.classList.add("writing--commentProfileBox__profileImage");
    
                // 프로필 이미지
                const profileImage = document.createElement("img");
    
                if(reply.profileImage != null){
                    profileImage.setAttribute("src",reply.profileImage);
                } else{
                    profileImage.setAttribute("src","/resources/images/officialProfile/COMMONPROFILE.png");
    
                }
                
                // 닉네임
                const replyNickname = document.createElement("span");
                replyNickname.classList.add("writing--commentProfileBox__profileName");
                replyNickname.innerText = reply.memberNickname;
                
                // 작성자 영역에 프로필 관련 추가
                
                replyWriter.append(profileBox,replyNickname);
                profileBox.append(profileImage);
    
                // 댓글 내용
                const replyContent = document.createElement("td");
                replyContent.classList.add("writing--commentContentBox");
                replyContent.innerHTML = reply.replyContent;
    
                // 작성일
                const replyDate = document.createElement("td");
                replyDate.classList.add("writing--commentDateBox");
                replyDate.innerHTML = reply.replyDate; 
    
    
                // 행에 작성자 내용 추가 
                replyRow.append(replyWriter,replyContent,replyDate);
    
                // 로그인시 답글 버튼
                if(loginMemberNo !=""){
                    // 버튼 추가 
                    const btnArea = document.createElement("td");
                    btnArea.classList.add("writing--commentBtnBox");
                    
                    // 답글 버튼
                    const childReplyBtn = document.createElement("button");
                    childReplyBtn.classList.add("btn");
                    childReplyBtn.classList.add("btn-primary");
                    childReplyBtn.classList.add("btn-sm");
                    childReplyBtn.setAttribute("onclick", "showInsertComment("+reply.replyNo+", this)");
                    childReplyBtn.innerText= "답글";

                    // childReplyBtn.style.marginLeft = "2px"; /* 상준 */
                    // childReplyBtn.style.marginRight = "2px"; /* 상준 */
                    // childReplyBtn.style.paddingRight = "6px"; /* 상준 */
                    // childReplyBtn.style.paddingLeft = "6px"; /* 상준 */
                    // childReplyBtn.style.paddingTop = "1px"; /* 상준 */
                    // childReplyBtn.style.paddingBottom = "1px"; /* 상준 */
                    // childReplyBtn.style.border = "none"; /* 상준 */
    
                    // 버튼 영역에 답글 버튼 추가
                    btnArea.append(childReplyBtn);
    
                    if(loginMemberNo == reply.memberNo){
                        // 수정 버튼
                        const updateBtn = document.createElement("button");
                        updateBtn.classList.add("btn");
                        updateBtn.classList.add("btn-primary");
                        updateBtn.classList.add("btn-sm");
                        updateBtn.innerText = "수정";
    
                        // updateBtn.style.marginLeft = "2px"; /* 상준 */
                        // updateBtn.style.marginRight = "2px"; /* 상준 */
                        // updateBtn.style.paddingRight = "6px"; /* 상준 */
                        // updateBtn.style.paddingLeft = "6px"; /* 상준 */
                        // updateBtn.style.paddingTop = "1px"; /* 상준 */
                        // updateBtn.style.paddingBottom = "1px"; /* 상준 */
                        // updateBtn.style.border = "none"; /* 상준 */

                        // 수정버튼에 이벤트 추가
                        updateBtn.setAttribute("onclick", "showUpdateComment("+reply.replyNo+", this)");
                        
                        // 삭제버튼
                        const deleteBtn = document.createElement("button");
                        deleteBtn.classList.add("btn");
                        deleteBtn.classList.add("btn-danger");
                        deleteBtn.classList.add("btn-sm");
                        deleteBtn.innerText = "삭제";
    
                        // deleteBtn.style.marginLeft = "2px"; /* 상준 */
                        // deleteBtn.style.marginRight = "2px"; /* 상준 */
                        // deleteBtn.style.paddingRight = "6px"; /* 상준 */
                        // deleteBtn.style.paddingLeft = "6px"; /* 상준 */
                        // deleteBtn.style.paddingTop = "1px"; /* 상준 */
                        // deleteBtn.style.paddingBottom = "1px"; /* 상준 */
                        // deleteBtn.style.border = "none"; /* 상준 */

                        // 삭제 버튼에 onclick 이벤트 속성 추가
                        deleteBtn.setAttribute("onclick", "deleteComment("+reply.replyNo+")");                       
    
                        // 버튼 영역 마지막 자식으로 수정/삭제 버튼 추가
                        btnArea.append(updateBtn,deleteBtn);
    
                    } // if 끝
                    else if( loginMemberRole==1){

                        // 수정 버튼
                        const updateBtn = document.createElement("button");
                        updateBtn.classList.add("btn");
                        updateBtn.classList.add("btn-primary");
                        updateBtn.classList.add("btn-sm");
                        updateBtn.innerText = "수정";
    
                        // updateBtn.style.marginLeft = "2px"; /* 상준 */
                        // updateBtn.style.marginRight = "2px"; /* 상준 */
                        // updateBtn.style.paddingRight = "6px"; /* 상준 */
                        // updateBtn.style.paddingLeft = "6px"; /* 상준 */
                        // updateBtn.style.paddingTop = "1px"; /* 상준 */
                        // updateBtn.style.paddingBottom = "1px"; /* 상준 */
                        // updateBtn.style.border = "none"; /* 상준 */
    
                        // 수정버튼에 이벤트 추가
                        updateBtn.setAttribute("onclick", "showUpdateComment("+reply.replyNo+", this)");
                        
                        // 삭제버튼
                        const deleteBtn = document.createElement("button");
                        deleteBtn.classList.add("btn");
                        deleteBtn.classList.add("btn-danger");
                        deleteBtn.classList.add("btn-sm");
                        deleteBtn.innerText = "삭제";
    
                        // deleteBtn.style.marginLeft = "2px"; /* 상준 */
                        // deleteBtn.style.marginRight = "2px"; /* 상준 */
                        // deleteBtn.style.paddingRight = "6px"; /* 상준 */
                        // deleteBtn.style.paddingLeft = "6px"; /* 상준 */
                        // deleteBtn.style.paddingTop = "1px"; /* 상준 */
                        // deleteBtn.style.paddingBottom = "1px"; /* 상준 */
                        // deleteBtn.style.border = "none"; /* 상준 */
    
                        // 삭제 버튼에 onclick 이벤트 속성 추가
                        deleteBtn.setAttribute("onclick", "deleteComment("+reply.replyNo+")");                       
    
                        // 버튼 영역 마지막 자식으로 수정/삭제 버튼 추가
                        btnArea.append(deleteBtn,updateBtn);
                        updateBtn.style.display="none";
                        
                    }
    
    
                    replyRow.append(btnArea);
                }
                replyList.append(replyRow);
            }
            




        }

    }) 
    .catch(err => console.log(err));
}
//--------------------------------------------------------------------------------------


// 댓글 등록
const addReply = document.getElementById("addReply");
const replyContent = document.getElementById("replyContent");

replyContent.addEventListener('keypress',e=>{
    if(e.keyCode == 13  && !e.shiftKey){ 
        e.preventDefault();
    }
    if(e.keyCode == 13 && !e.shiftKey && e.target.matches(":focus")) {
        e.preventDefault();
        e.target.nextElementSibling.click();
    }



})

addReply.addEventListener("click",e =>{

    // 로그인 여부 전역변수 사용
    if(loginMemberNo == ""){
        // alert("로그인 후 이용해주세요.");
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-end', /* 우측 상단 */
            showConfirmButton: false, /* 컨펌버튼 없음 */
            timer: 3000, /* 3초 간 뜨기 */
            timerProgressBar: true, /* 진행바 */
            showCloseButton: true, /* 취소 버튼 */
            didOpen: (toast) => {
                toast.addEventListener('mouseenter', Swal.stopTimer)
                toast.addEventListener('mouseleave', Swal.resumeTimer)
            }
            })
    
            Toast.fire({
                icon: 'warning', /* 아이디 실패 시 ! 경고 */
                title: '로그인 후 이용해주세요.' /* 메시지 담기 */
        })
        return;
    }

    // 2) 댓글 작성이 되어있나?
    if(replyContent.value.trim().length == 0){
        // alert("댓글을 입력해주세요.");
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-end', /* 우측 상단 */
            showConfirmButton: false, /* 컨펌버튼 없음 */
            timer: 3000, /* 3초 간 뜨기 */
            timerProgressBar: true, /* 진행바 */
            showCloseButton: true, /* 취소 버튼 */
            didOpen: (toast) => {
                toast.addEventListener('mouseenter', Swal.stopTimer)
                toast.addEventListener('mouseleave', Swal.resumeTimer)
            }
            })
    
            Toast.fire({
                icon: 'warning', /* 아이디 실패 시 ! 경고 */
                title: '댓글을 입력해주세요.' /* 메시지 담기 */
        })

        replyContent.value = "";
        replyContent.focus();
        return;

    }

    // 3) AJAX를 이용해서 댓글 내용 DB에 저장
    const data = {"replyContent":replyContent.value,
                    "memberNo" : loginMemberNo,
                    "boardNo" : boardNo};

    fetch("/comment",{
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(data) // JS객체를 JSON 파싱
    })
    .then(resp => resp.text())
    .then(result => {
        if(result > 0){ // 댓글 등록
            // alert("댓글이 등록되었습니다.");
            const Toast = Swal.mixin({
                toast: true,
                position: 'top-end', /* 우측 상단 */
                showConfirmButton: false, /* 컨펌버튼 없음 */
                timer: 3000, /* 3초 간 뜨기 */
                timerProgressBar: true, /* 진행바 */
                showCloseButton: true, /* 취소 버튼 */
                didOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer)
                    toast.addEventListener('mouseleave', Swal.resumeTimer)
                }
                })
        
                Toast.fire({
                    icon: 'success', /* 아이디 성공 시 v 체크 */
                    title: '댓글이 등록되었습니다.' /* 메시지 담기 */
            })

            replyContent.value = "";
            selectReplyList();

        } else { // 실패
            // alert("댓글 등록에 실패했습니다.");
            const Toast = Swal.mixin({
                toast: true,
                position: 'top-end', /* 우측 상단 */
                showConfirmButton: false, /* 컨펌버튼 없음 */
                timer: 3000, /* 3초 간 뜨기 */
                timerProgressBar: true, /* 진행바 */
                showCloseButton: true, /* 취소 버튼 */
                didOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer)
                    toast.addEventListener('mouseleave', Swal.resumeTimer)
                }
                })
        
                Toast.fire({
                    icon: 'warning', /* 아이디 성공 시 v 체크 */
                    title: '댓글 등록에 실패했습니다.' /* 메시지 담기 */
            })

        }
    })
    .catch(err=>console.log(err));

});





//-------------------------------------------------------------
// 댓글 삭제

function deleteComment(replyNo){

    if(confirm("정말 삭제하시겠습니까?")){

        fetch("/comment",{
            method : "DELETE",
            headers : {"Content-Type" : "application/json"},
            body : replyNo 

        })
        .then(resp => resp.text())
        .then(result => {
            if(result > 0 ){
                // alert("댓글이 삭제되었습니다.");
                const Toast = Swal.mixin({
                    toast: true,
                    position: 'top-end', /* 우측 상단 */
                    showConfirmButton: false, /* 컨펌버튼 없음 */
                    timer: 3000, /* 3초 간 뜨기 */
                    timerProgressBar: true, /* 진행바 */
                    showCloseButton: true, /* 취소 버튼 */
                    didOpen: (toast) => {
                        toast.addEventListener('mouseenter', Swal.stopTimer)
                        toast.addEventListener('mouseleave', Swal.resumeTimer)
                    }
                    })
            
                    Toast.fire({
                        icon: 'success', /* 아이디 실패 시 ! 경고 */
                        title: '댓글이 삭제되었습니다.' /* 메시지 담기 */
                })
                selectReplyList();
            }else{
                // alert("댓글 삭제에 실패했습니다.")
                const Toast = Swal.mixin({
                    toast: true,
                    position: 'top-end', /* 우측 상단 */
                    showConfirmButton: false, /* 컨펌버튼 없음 */
                    timer: 3000, /* 3초 간 뜨기 */
                    timerProgressBar: true, /* 진행바 */
                    showCloseButton: true, /* 취소 버튼 */
                    didOpen: (toast) => {
                        toast.addEventListener('mouseenter', Swal.stopTimer)
                        toast.addEventListener('mouseleave', Swal.resumeTimer)
                    }
                    })
            
                    Toast.fire({
                        icon: 'warning', /* 아이디 실패 시 ! 경고 */
                        title: '댓글 삭제에 실패했습니다.' /* 메시지 담기 */
                })
            }

        })
        .catch(err => console.log(err));
    }

}


// -------------------------------------------------------
// 댓글 수정 화면
let beforeReplyRow;

function showUpdateComment(replyNo, btn){

    const temp = document.getElementsByClassName("update-textarea");
    const temp2 = document.getElementsByClassName("commentInsertContent");

    if(temp.length > 0){ // 수정이 한 개 이상 열려 있는 경우

        if(confirm("다른 댓글이 수정 중입니다. 현재 댓글을 수정 하시겠습니까?")){ // 확인

            temp[0].parentElement.innerHTML = beforeReplyRow;
            // comment-row                       // 백업한 댓글
            // 백업 내용으로 덮어 씌워 지면서 textarea 사라짐
        
        }else{ // 취소
            return;
        }
    }

    if(temp2.length > 0){ // 답글이 한 개 이상 열려 있는 경우(상준)

        if(confirm("답글이 작성 중입니다. 현재 댓글을 수정 하시겠습니까?")){ // 확인

            temp2[0].parentElement.parentElement.remove();
        
        }else{ // 취소
            return;
        }
    }
    
    
    // 1. 댓글 수정이 클릭된 행을 선택
    const replyRow = btn.parentElement.parentElement;


    // 2. 행 내용 삭제 전 현재 상태를 저장(백업) (문자열)
    //    (전역변수 이용)
    beforeReplyRow = replyRow.innerHTML;

    // 3. 댓글에 작성되어 있던 내용만 얻어오기 -> 새롭게 생성된 textarea 추가될 예정
    
    let beforeReply = replyRow.children[1].innerHTML;

/* 상준 실험------------------------------------------------------------------------ */
/* 상준 실험------------------------------------------------------------------------ */
/* 상준 실험------------------------------------------------------------------------ */

console.log("beforeReply:"+beforeReplyRow);


let updateReplyNick = replyRow.children[0].querySelector('.writing--commentProfileBox__profileName').innerText;

// console.log(updateReplyNick); // 닉네임 출력됨

/* 상준 실험------------------------------------------------------------------------ */
/* 상준 실험------------------------------------------------------------------------ */
/* 상준 실험------------------------------------------------------------------------ */

    // 4. 댓글 행 내부 내용을 모두 삭제
    replyRow.innerHTML = "";


    // 실험
                // 작성자 
                const replyWriter = document.createElement("th");
                replyWriter.classList.add("writing--commentProfileBox");
                replyWriter.innerHTML = `<i class="fa-solid fa-wrench"></i>`+updateReplyNick; /* 상준 댓글 수정 */
    
    
                // // 프로필 이미지 태그
                // const profileBox = document.createElement("span");
                // profileBox.classList.add("writing--commentProfileBox__profileImage");
    
                // // 프로필 이미지
                // const profileImage = document.createElement("img");
    
                // if(proImage != null){
                //     profileImage.setAttribute("src",proImage);
                // } else{
                //     profileImage.setAttribute("src","/resources/images/officialProfile/COMMONPROFILE.png");
    
                // }
                
                // // 닉네임
                // const replyNickname = document.createElement("span");
                // replyNickname.classList.add("writing--commnetProfileBox__profileName");
                // replyNickname.innerText = memNickname;
                
                            // 작성자 영역에 프로필 관련 추가
                // replyWriter.append(profileBox,replyNickname);
                // profileBox.append(profileImage);
                replyRow.append(replyWriter);

    // 5. textarea 요소 생성 + 클래스 추가  +  **내용 추가**
    const textarea = document.createElement("textarea");
    textarea.classList.add("update-textarea");

    // ******************************************
    // XSS 방지 처리 해제
    beforeReply =  beforeReply.replaceAll("&amp;", "&");
    beforeReply =  beforeReply.replaceAll("&lt;", "<");
    beforeReply =  beforeReply.replaceAll("&gt;", ">");
    beforeReply =  beforeReply.replaceAll("&quot;", "\"");    

    // ******************************************
    textarea.value = beforeReply; // 내용 추가
    replyRow.append(textarea);


    // 7. 버튼 영역 + 수정/취소 버튼 생성
    const replyBtnArea = document.createElement("td");
    replyBtnArea.classList.add("writing--commentBtnBox");
    

    const updateBtn = document.createElement("button");
    updateBtn.classList.add("btn");
    updateBtn.classList.add("btn-primary");
    updateBtn.classList.add("btn-sm");
    updateBtn.setAttribute("onclick", "updateComment("+replyNo+", this)");
    updateBtn.innerText = "수정";

    updateBtn.style.marginLeft = "2px"; /* 상준 */
    updateBtn.style.marginRight = "2px"; /* 상준 */


    const cancelBtn = document.createElement("button");
    cancelBtn.classList.add("btn");
    cancelBtn.classList.add("btn-danger");
    cancelBtn.classList.add("btn-sm");
    cancelBtn.setAttribute("onclick", "updateCancel(this)");
    cancelBtn.innerText = "취소";

    cancelBtn.style.marginLeft = "2px"; /* 상준 */
    cancelBtn.style.marginRight = "2px"; /* 상준 */

    textarea.addEventListener("keyup",e=>{
        if(e.keyCode == 27){
            if(confirm("댓글 수정을 취소하시겠습니까?")){
                cancelBtn.parentElement.parentElement.innerHTML = beforeReplyRow;
            }
        }

    })
    textarea.addEventListener('keypress',e=>{
        if(e.keyCode == 13  && !e.shiftKey){ 
            e.preventDefault();
        }
        if(e.keyCode == 13 && !e.shiftKey && e.target.matches(":focus")) {
            e.preventDefault();
            e.target.nextElementSibling.firstChild.click();
        }
    })

    replyBtnArea.append(updateBtn,cancelBtn);
    replyRow.append(replyBtnArea);

}

// -----------------------------------------------------------------------------------
// 댓글 수정 취소
function updateCancel(btn){
    // 매개변수 btn : 클릭된 취소 버튼
    // 전역변수 beforeCommentRow : 수정 전 원래 행(댓글)을 저장한 변수

    if(confirm("댓글 수정을 취소하시겠습니까?")){
        btn.parentElement.parentElement.innerHTML = beforeReplyRow;
    }
}

// -----------------------------------------------------------------------------------
// 댓글 수정(AJAX)
function updateComment(replyNo, btn){

    // 새로 작성된 댓글 내용 얻어오기
    const replyContent = btn.parentElement.previousElementSibling.value;

    const data = {"replyNo" : replyNo,
                "replyContent" : replyContent
    }
    
    fetch("/comment",{
        method : "PUT",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(data)


    })
    .then(resp=>resp.text())
    .then(result => {
        if(result > 0){
            // alert("댓글이 수정되었습니다.");
            const Toast = Swal.mixin({
                toast: true,
                position: 'top-end', /* 우측 상단 */
                showConfirmButton: false, /* 컨펌버튼 없음 */
                timer: 3000, /* 3초 간 뜨기 */
                timerProgressBar: true, /* 진행바 */
                showCloseButton: true, /* 취소 버튼 */
                didOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer)
                    toast.addEventListener('mouseleave', Swal.resumeTimer)
                }
                })
        
                Toast.fire({
                    icon: 'success', /* 아이디 실패 시 ! 경고 */
                    title: '댓글이 수정되었습니다.' /* 메시지 담기 */
            })
            selectReplyList();
        }else{
            // alert("댓글 수정에 실패했습니다.");
            const Toast = Swal.mixin({
                toast: true,
                position: 'top-end', /* 우측 상단 */
                showConfirmButton: false, /* 컨펌버튼 없음 */
                timer: 3000, /* 3초 간 뜨기 */
                timerProgressBar: true, /* 진행바 */
                showCloseButton: true, /* 취소 버튼 */
                didOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer)
                    toast.addEventListener('mouseleave', Swal.resumeTimer)
                }
                })
        
                Toast.fire({
                    icon: 'warning', /* 아이디 실패 시 ! 경고 */
                    title: '댓글 수정에 실패했습니다.' /* 메시지 담기 */
            })
        }
    })
    .catch(err => console.log(err));

}

// -------------------------------------------------------------------------------
// -------------------------------------------------------------------------------
function showInsertComment(parentReplyNo, btn){

    const temp = document.getElementsByClassName("commentInsertContent");
    const temp2 = document.getElementsByClassName("update-textarea");
    
    if(temp.length>0){
        if(confirm("다른 답글을 작성 중 입니다. 현재 댓글에 답글을 작성하시겠습니까?")){
            temp[0].nextElementSibling.remove();
            temp[0].remove();
        
        }else{
            return;
        }
    }

    if(temp2.length > 0){ // 수정이 한 개 이상 열려 있는 경우

        if(confirm("다른 댓글이 수정 중입니다. 현재 댓글에 답글을 작성하시겠습니까?")){ // 확인

            temp2[0].parentElement.innerHTML = beforeReplyRow;
            // comment-row                       // 백업한 댓글
            // 백업 내용으로 덮어 씌워 지면서 textarea 사라짐
        
        }else{ // 취소
            return;
        }
    }

        
    // 답글 작성 칸 
    const textarea = document.createElement("textarea");
    textarea.classList.add("commentInsertContent");

    // 답글 부모의 뒤쪽에 칸 추가
    // const thTemp = document.createElement("th");
    // thTemp.classList.add("writing--commentProfileBox");
    // const tdElement = document.querySelector(".writing--commentBtnBox");
    // tdElement.insertAdjacentElement("afterend", thTemp);
    // btn.parentElement.nextElementSibling.after(textarea);
    const trTemp = document.createElement("tr");
    trTemp.classList.add("re.reply-row");
    const thTemp = document.createElement("th");
    thTemp.classList.add("writing--commentProfileBox");
    thTemp.innerHTML = `<i class="fa-solid fa-reply fa-rotate-180"></i>답글 등록`; /* 상준 답글 등록 */
    trTemp.appendChild(thTemp);
    btn.parentElement.parentElement.after(trTemp);
    
    const tdTemp = document.createElement("td");
    trTemp.append(tdTemp);
    tdTemp.append(textarea);
    // btn.parentElement.after(textarea); /* 6월 27일 상준 수정 */

    // 7. 버튼 영역 + 수정/취소 버튼 생성 /* 6월 27일 상준 추가 수정 */
    const replyBtnArea = document.createElement("td");
    replyBtnArea.classList.add("writing--commentBtnBox");
    

    const insertBtn = document.createElement("button");
    insertBtn.classList.add("btn");
    insertBtn.classList.add("btn-primary");
    insertBtn.classList.add("btn-sm");
    insertBtn.setAttribute("onclick", "insertChildComment("+parentReplyNo+", this)");
    insertBtn.innerText = "등록";
        insertBtn.style.marginLeft = "2px"; /* 상준 */
        insertBtn.style.marginRight = "2px"; /* 상준 */
    


    const cancelBtn = document.createElement("button");
    cancelBtn.classList.add("btn");
    cancelBtn.classList.add("btn-danger");
    cancelBtn.classList.add("btn-sm");
    cancelBtn.setAttribute("onclick", "insertCancel(this)");
    cancelBtn.innerText = "취소";
        cancelBtn.style.marginLeft = "2px"; /* 상준 */
        cancelBtn.style.marginRight = "2px"; /* 상준 */

    /* 상준 추가 작성 */
    trTemp.append(replyBtnArea);
    replyBtnArea.append(insertBtn);
    replyBtnArea.append(cancelBtn);
    /* 상준 추가 작성 */


    /* esc */
    textarea.addEventListener('keyup',e =>{
        if(e.keyCode == 27){
            // cancelBtn.parentElement.previousElementSibling.previousElementSibling.remove();
            // cancelBtn.parentElement.previousElementSibling.remove();
            // cancelBtn.parentElement.remove();
            cancelBtn.parentElement.parentElement.remove(); /* 상준 */
        }
        
    })
    // 엔터키 입력시 등록
    textarea.addEventListener('keypress',e=>{
        if(e.keyCode == 13  && !e.shiftKey){ 
            e.preventDefault();
        }
        if(e.keyCode == 13 && !e.shiftKey && e.target.matches(":focus")) {
            e.preventDefault();
            e.target.parentElement.nextElementSibling.firstChild.click();
        }
    })

    // replyBtnArea.append(insertBtn,cancelBtn);
    // textarea.after(replyBtnArea);


}

// 답글 취소
function insertCancel(btn){


                    // 취소
    // btn.parentElement.previousElementSibling.previousElementSibling.remove(); // 상준: textarea 전의 아이디 th 제거
    // btn.parentElement.previousElementSibling.remove(); // 취소의 부모의 이전 요소(textarea) 제거
    // btn.parentElement.remove(); // 취소의 부모 요소(comment-btn-area) 제거
    btn.parentElement.parentElement.remove(); /* 상준: 답글 입력창을 담고 있는 tr 제거 */
    // var row = btn.closest("tr");
    // row.remove();

    // btn.parentElement.parentElement.innerHTML = beforeReplyRow;
}

// 답글 등록
function insertChildComment(parentReplyNo, btn){
    // 부모 댓글 번호, 답글 등록 버튼

// 누가?                loginMemberNo(로그인한 회원의 memberNo )(전역변수)
// 어떤 내용?           textarea에 작성된 내용
// 몇번 게시글?         현재 게시글 boardNo (전역변수)
// 부모 댓글은 누구?    parentNo (매개변수)

// 답글 내용
    const replyContent = btn.parentElement.previousElementSibling.firstChild.value;

    // 답글 내용이 작성되지 않은 경우
    if(replyContent.trim().length == 0){
    // alert("답글 작성 후 등록 버튼을 클릭해주세요.");
    const Toast = Swal.mixin({
        toast: true,
        position: 'top-end', /* 우측 상단 */
        showConfirmButton: false, /* 컨펌버튼 없음 */
        timer: 3000, /* 3초 간 뜨기 */
        timerProgressBar: true, /* 진행바 */
        showCloseButton: true, /* 취소 버튼 */
        didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
            toast.addEventListener('mouseleave', Swal.resumeTimer)
        }
        })

        Toast.fire({
            icon: 'warning', /* 아이디 실패 시 ! 경고 */
            title: '답글 작성 후 등록 버튼을 클릭해주세요.' /* 메시지 담기 */
    })

    btn.parentElement.previousElementSibling.value = "";
    btn.parentElement.previousElementSibling.focus();
    return;
    }
    const data = {"replyContent":replyContent,
    "memberNo" : loginMemberNo,
    "boardNo" : boardNo,
    "parentReplyNo" : parentReplyNo}; // JS 객체


    fetch("/comment",{
    method : "POST",
    headers : {"Content-Type" : "application/json"},
    body : JSON.stringify(data) // JS객체 -> JSON 파싱
    })
    .then(resp=>resp.text())
    .then(result => {
    if(result > 0){ // 등록 성공
    // alert("답글이 등록되었습니다.");
    const Toast = Swal.mixin({
        toast: true,
        position: 'top-end', /* 우측 상단 */
        showConfirmButton: false, /* 컨펌버튼 없음 */
        timer: 3000, /* 3초 간 뜨기 */
        timerProgressBar: true, /* 진행바 */
        showCloseButton: true, /* 취소 버튼 */
        didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
            toast.addEventListener('mouseleave', Swal.resumeTimer)
        }
        })

        Toast.fire({
            icon: 'success', /* 아이디 실패 시 ! 경고 */
            title: '답글이 등록되었습니다.' /* 메시지 담기 */
        })
    selectReplyList(); // 비동기 댓글 목록 조회 함수 호출

    } else { // 실패
    // alert("답글 등록에 실패했습니다.");
    const Toast = Swal.mixin({
        toast: true,
        position: 'top-end', /* 우측 상단 */
        showConfirmButton: false, /* 컨펌버튼 없음 */
        timer: 3000, /* 3초 간 뜨기 */
        timerProgressBar: true, /* 진행바 */
        showCloseButton: true, /* 취소 버튼 */
        didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
            toast.addEventListener('mouseleave', Swal.resumeTimer)
        }
        })

        Toast.fire({
            icon: 'warning', /* 아이디 실패 시 ! 경고 */
            title: '답글 등록에 실패했습니다.' /* 메시지 담기 */
        })
    }
    })
    .catch(err => console.log(err));


    }


// 댓글 드롭다운
const dropdownBtn = document.getElementsByClassName('writing--commentProfileBox__profileName');
for (let i = 0; i < dropdownBtn.length; i++) {
    dropdownBtn[i].addEventListener('click', () => {
        const spanElement = dropdownBtn[i];
        
        const dropdownDiv = document.createElement("div");
        dropdownDiv.className = "replyDropdown";
        
        const dropdownLink = document.createElement("a");
        dropdownLink.href = "#";
        dropdownLink.innerText = `${reply.memberNickname}의 작성글 보기`;
        
        dropdownDiv.appendChild(dropdownLink);
        spanElement.parentNode.appendChild(dropdownDiv);
    });
}