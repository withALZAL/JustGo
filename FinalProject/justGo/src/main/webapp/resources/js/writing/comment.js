// 댓글 목록 조회

function selectReplyList(){

    fetch("/comment?boardNo="+boardNo)
    .then(resp => resp.json())
    .then(rList => {
        console.log(rList);

        // 화면에 출력되어 잇는 댓글 목록을 삭제
        const replyList = document.getElementById("replyList"); // tbody
        replyList.innerHTML="";

        // rList에 저장된 요소 하나씩 접근

        for(let reply of rList){

            // 행
            const replyRow = document.createElement("tr");
            replyRow.classList.add("reply-row")
            
            // 답글일 경우 자식 클래스 추가
            if(reply.parentReplyNo != 0) replyRow.classList.add("child-reply");

            // 작성자 
            const replyWriter = document.createElement("th");
            replyWriter.classList.add("writing--commentProfileBox");


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
            replyNickname.classList.add("writing--commnetProfileBox__profileName");
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
                childReplyBtn.classList.add("btn btn-primary btn-sm");
                childReplyBtn.setAttribute("onclick", "showInsertComment("+reply.replyNo+", this)");
                childReplyBtn.innerText= "답글";

                // 버튼 영역에 답글 버튼 추가
                btnArea.append(childReplyBtn);

                if(loginMemberNo == reply.memberNo){
                    // 수정 버튼
                    const updateBtn = document.createElement("button");
                    updateBtn.classList.add("btn btn-primary btn-sm");
                    updateBtn.innerText = "수정";

                    // 수정버튼에 이벤트 추가
                    updateBtn.setAttribute("onclick", "showUpdateComment("+reply.replyNo+", this)");
                    
                    // 삭제버튼
                    const deleteBtn = document.createElement("button");
                    deleteBtn.classList.add("btn btn-primary btn-sm");
                    deleteBtn.innerText = "삭제";

                    // 삭제 버튼에 onclick 이벤트 속성 추가
                    deleteBtn.setAttribute("onclick", "deleteComment("+reply.replyNo+")");                       

                    // 버튼 영역 마지막 자식으로 수정/삭제 버튼 추가
                    btnArea.append(updateBtn,deleteBtn);

                } // if 끝


                replyRow.append(btnArea);
            }
            replyList.append(replyRow);


        }

    }) 
    .catch(err => console.log(err));
}
//--------------------------------------------------------------------------------------


// 댓글 등록
const addReply = document.getElementById("addReply");
const replyContent = document.getElementById("replyContent");

addReply.addEventListener("click",e =>{

    // 로그인 여부 전역변수 사용
    if(loginMemberNo == ""){
        alert("로그인 후 이용해주세요!!!");
        return;
    }

    // 2) 댓글 작성이 되어있나?
    if(replyContent.value.trim().length == 0){
        alert("댓글을 입력해주세요!!!");

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
            alert("댓글이 등록되었습니다!!!");

            replyContent.value = "";
            selectReplyList();

        } else { // 실패
            alert("댓글 등록에 실패했습니다...왜죠...?");

        }
    })
    .catch(err=>console.log(err));

});

//-------------------------------------------------------------
// 댓글 삭제

function deleteComment(replyNo){

    if(confirm("정말 삭제 하시겠습니까?????")){

        fetch("/comment",{
            method : "DELETE",
            headers : {"Content-Type" : "application/json"},
            body : replyNo 

        })
        .then(resp => resp.text())
        .then(result => {
            if(result > 0 ){
                alert("삭제되었습니다!!");
                selectReplyList();
            }else{
                alert("삭제 실패인데요..?")
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

    if(temp.length > 0){ // 수정이 한 개 이상 열려 있는 경우

        if(confirm("다른 댓글이 수정 중입니다. 현재 댓글을 수정 하시겠습니까?")){ // 확인

            temp[0].parentElement.innerHTML = beforeReplyRow;
            // comment-row                       // 백업한 댓글
            // 백업 내용으로 덮어 씌워 지면서 textarea 사라짐
        
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

    // 4. 댓글 행 내부 내용을 모두 삭제
    replyRow.innerHTML = "";


    // 실험
                // 작성자 
                const replyWriter = document.createElement("th");
                replyWriter.classList.add("writing--commentProfileBox");
    
    
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
    // updateBtn.classList.add("btn btn-primary btn-sm");
    updateBtn.setAttribute("onclick", "updateComment("+replyNo+", this)");
    updateBtn.innerText = "수정";


    const cancelBtn = document.createElement("button");
    // cancelBtn.classList.add("btn btn-primary btn-sm");
    cancelBtn.setAttribute("onclick", "updateCancel(this)");
    cancelBtn.innerText = "취소";


    replyBtnArea.append(updateBtn,cancelBtn);
    replyRow.append(replyBtnArea);

}

// -----------------------------------------------------------------------------------
// 댓글 수정 취소
function updateCancel(btn){
    // 매개변수 btn : 클릭된 취소 버튼
    // 전역변수 beforeCommentRow : 수정 전 원래 행(댓글)을 저장한 변수

    if(confirm("댓글 수정을 취소하시겠습니까?")){
        btn.parentElement.parentElement.parentElement.innerHTML = beforeReplyRow;
    }
}

// -----------------------------------------------------------------------------------
// 댓글 수정(AJAX)
function updateComment(replyNo, btn){

    // 새로 작성된 댓글 내용 얻어오기
    const replyContent = btn.parentElement.previousElementSibling.previousElementSibling.value;

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
            alert("댓글이 수정되었습니다.");
            selectReplyList();
        }else{
            alert("댓글 수정 실패");
        }
    })
    .catch(err => console.log(err));

}

// -------------------------------------------------------------------------------
// -------------------------------------------------------------------------------


