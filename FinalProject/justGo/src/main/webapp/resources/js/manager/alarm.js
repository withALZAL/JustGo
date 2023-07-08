//-----------------------------------------------------------------------------------
// 웹소켓 테스트
// 1. SockJS 라이브러리를 추가

// 2. SockJS를 이용해서 클라이언트용 웹소켓 객체 생성
let testSock = new SockJS("/alarmSock");

function sendMessage(alarmNo, memberNickname, boardTitle){
    
    // 매개변수를 JS객체에 저장
    let obj={}; // 비어있는 객체

    obj.boardTitle = boardTitle; // 객체에 일치하는 key가 없다면 자동으로 추가
    obj.memberNickname = memberNickname;
    obj.alarmNo = alarmNo;

    console.log(obj);

     // 웹소켓 연결된 곳으로 메시지를 보냄
    testSock.send(JSON.stringify(obj));
                     // JS객체 -> JSON
}


const alarmBox = document.getElementById("alarmBox");
const alarmBtn = document.getElementById("alarmBtn");

// 웹소켓 객체(testSock)가 서버로 부터 전달 받은 메시지가 있을경우
document.addEventListener("DOMContentLoaded", function() {

    // 웹소켓 객체(testSock)가 서버로 부터 전달 받은 메시지가 있을 경우
    testSock.onmessage = e => {
        // e : 이벤트 객체
        // e.data : 전달받은 메시지(JSON)

        let obj= JSON.parse(e.data); // JSON -> js객체
        console.log(obj);
        // console.log(`보낸 사람 : ${obj.CP} / ${obj.reportNo} / ${obj.memberNo}`);

        const alarmList = document.createElement("li");
        
        const div1 = document.createElement("div");
        div1.innerText = obj.boardTitle.substr(0,10) + "... 게시글을";
        
        const div2 = document.createElement("div");
        div2.innerText = obj.memberNickname + "님 께서 신고하였습니다.";


        alarmList.append(div1, div2);

        alarmBox.append(alarmList);
        alarmBtn.classList.add("shake");

        setTimeout(function() {
            alarmBtn.classList.remove("shake");
        }, 400);

    };



});