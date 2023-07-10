/* 채팅 스크롤 맨 아래 고정 */
var chattingList = document.querySelector('.chattingList');
chattingList.scrollTop = chattingList.scrollHeight;

// 메세지 리스트를 불러옴 

function selectMsg(){

    fetch("/chatting/selectMessage?chattingNo=1")
    .then(resp=>resp.json())
    .then(msgList => {
        console.log(msgList);

        const div = document.querySelector(".chattingList");

        div.innerHTML = "";
        
        for(let msg of msgList){

            // 채팅 처음 감싸는 칸
            const card = document.createElement("div");

            // 채팅 칸
            const temp = document.createElement("div");
            temp.classList.add("myChattingContent_temp");


            // 메세지 내용
            const content = document.createElement("div");
            content.innerText = msg.msgContent;
            
            // 시간
            const sendTime = document.createElement("div")
            sendTime.classList.add("timeLog");
            sendTime.innerText = msg.sendTime;
            
            if(loginMemberNo == msg.senderNo){
                content.classList.add("myChattingContent");
                card.classList.add("myChattingCard")
                temp.append(content);    
                card.append(temp,sendTime);
                
            }else{
                content.classList.add("yourChattingContent");
                card.classList.add("yourChattingCard")
                

                const profile = document.createElement("div");
                profile.classList.add("chatProfile");

                const imgBox = document.createElement("div");
                imgBox.classList.add("chatProflieImageBox");

                const img = document.createElement("img");
                img.setAttribute("src",msg.profileImg);

                const nick = document.createElement("span");
                nick.classList.add("nick");
                nick.innerText = msg.memberNickname;

                imgBox.append(img);
                profile.append(imgBox,nick);
                card.append(profile,content,sendTime);

            }         
            div.append(card);
            

        }

    })
    .catch(e=> console.log(e));




}


// 웹소켓 

let chattingSock;

if(loginMemberNo != ""){
    chattingSock = new SockJS("/chattingSock");
    
}

// 채팅 입력


const sendMessage = () =>{
    const inputChatting = document.getElementById("inputChatting");

    if(inputChatting.value.trim().length ==0){
        // alert("채팅을 입력해주세요")
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
                title: '채팅을 입력해주세요.' /* 메시지 담기 */
        })
        inputChatting.value= "";
        inputChatting.focus();

    } else{
        var obj = {
            "senderNo" : loginMemberNo,
            "msgContent" : inputChatting.value,
        };
        console.log(obj);
        
        chattingSock.send(JSON.stringify(obj));
        inputChatting.value = "";
    }

}
const inputChatting = document.getElementById("inputChatting")
inputChatting.addEventListener("keyup", e => {
	if(e.key == "Enter"){ 
		if (!e.shiftKey) {
			sendMessage();
		}
	}
})



const send = document.getElementById("send");

send.addEventListener("click", sendMessage);


chattingSock.onmessage = function(e){

    const msg = JSON.parse(e.data);
    console.log(msg);

    if(msg.senderNo == -2){ // 나감
        
    }

    if(chattingRoomNo == 1){
        const div = document.querySelector(".chattingList");
        const card = document.createElement("div");

        // 채팅 칸
        const temp = document.createElement("div");
        temp.classList.add("myChattingContent_temp");


        // 메세지 내용
        const content = document.createElement("div");
        content.innerText = msg.msgContent;
        
        // 시간
        const sendTime = document.createElement("div")
        sendTime.classList.add("timeLog");
        sendTime.innerText = msg.sendTime;
        
        if(loginMemberNo == msg.senderNo){
            content.classList.add("myChattingContent");
            card.classList.add("myChattingCard")
            temp.append(content);    
            card.append(temp,sendTime);
            
        }else{
            content.classList.add("yourChattingContent");
            card.classList.add("yourChattingCard")
            

            const profile = document.createElement("div");
            profile.classList.add("chatProfile");

            const imgBox = document.createElement("div");
            imgBox.classList.add("chatProflieImageBox");

            const img = document.createElement("img");
            img.setAttribute("src", profileImage);

            const nick = document.createElement("span");
            nick.classList.add("nick");
            nick.innerText = nickName;

            imgBox.append(img);
            profile.append(imgBox,nick);
            card.append(profile,content,sendTime);

        }         
        div.append(card);

    }


} 


// 멤버

let memberListSock;

if(loginMemberNo != ""){
    memberListSock = new SockJS("/memberListSock");
}

memberListSock.onmessage = function(e){

    const members = JSON.parse(e.data);
    console.log(members);

    
    const box = document.querySelector(".memberList");
    box.innerHTML = "";

    members.forEach(member => {
        const memberCard = document.createElement("div");
        memberCard.classList.add("memberCard");

        const listImgBox = document.createElement("div");
        listImgBox.classList.add("memberProflieImageBox");


        const listImg = document.createElement("img");
        listImg.setAttribute("src", member.profileImg);

        const listNick = document.createElement("div");
        listNick.classList.add("memberNickname");
        listNick.innerText = member.memberNickname;


        listImgBox.append(listImg);
        memberCard.append(listImgBox,listNick);
        box.append(memberCard);
    });





}
