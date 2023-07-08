//-----------------------------------------------------------------------------------
// 웹소켓 테스트
// 1. SockJS 라이브러리를 추가

// 2. SockJS를 이용해서 클라이언트용 웹소켓 객체 생성
let testSock = new SockJS("/alarmSock");

function sendMessage(memberNo, memberNickname, boardNo, boardTitle){
    
    // 매개변수를 JS객체에 저장
    let obj={}; // 비어있는 객체

    obj.boardNo = boardNo; // 객체에 일치하는 key가 없다면 자동으로 추가
    obj.memberNo = memberNo;
    obj.memberNickname = memberNickname;
    obj.boardTitle = boardTitle;

    console.log(obj);

     // 웹소켓 연결된 곳으로 메시지를 보냄
    testSock.send(JSON.stringify(obj));
                     // JS객체 -> JSON
}


const alarmBox = document.getElementById("alarmBox");
const alarmBtn = document.getElementById("alarmBtn");
const alarm_num = document.getElementById("alarm_num");

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
        div1.innerText = obj.boardTitle + "... 게시글을";
        
        const div2 = document.createElement("div");
        div2.innerText = obj.memberNickname + "님 께서 신고하였습니다.";


        alarmList.append(div1, div2);


        // 편지 이모지 움직이게
        alarmBox.append(alarmList);
        alarmBtn.classList.add("shake");

        setTimeout(function() {
            alarmBtn.classList.remove("shake");
        }, 400);


        // 편지 이모지 옆에 숫자 뜨게
        const alarmNum = document.createElement("span");
        alarmNum.classList.add("increaseNum");
        alarmNum.innerHTML = 0;
        alarm_num.append(alarmNum);

        alarmNum.innerHTML = ++alarmNum.innerHTML; 
        // function alarmCount() {
            
        //     alarmNum.innerHTML = ++alarmNum.innerHTML;
        // }

    

    };



});