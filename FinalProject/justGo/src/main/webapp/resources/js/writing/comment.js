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
