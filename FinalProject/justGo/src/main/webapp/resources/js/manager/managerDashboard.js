/* 도넛 차트(2번) */
var chartDoughnut = document.getElementById('chartDoughnut').getContext('2d');
new Chart(chartDoughnut, {
    type: 'doughnut',
    data: {
        labels: ['자유게시판', '질문게시판', '중국게시판', '일본게시판', '베트남게시판', '태국게시판', '호주게시판'],
        datasets: [{
            label: '게시글 수',
            data: [countFree, countQuestion, countChina, countJapan, countVietnam, countThai, countAustralia],
            borderWidth: 1,
            backgroundColor: ["#5CD1E5", "#36B8CF", "#24A6BD", "#1294AB", "#008299", "#007087", "#004C63"]
        }]
    },
    options: {
        legend: {display: false},
        maintainAspectRatio: true, // 가로 세로 비율 유지
        responsive: false, // 부모 요소에 맞게 자동으로 크기 조절 안함
        legend: {
            display: false,
        },
        maintainAspectRatio: false, // 가로 세로 비율 유지하지 않음
        responsive: true ,// 부모 요소에 맞게 자동으로 크기 조절
    }
});

/* 태그 차트(3번) */
var chartTag = document.getElementById('chartTag');
new Chart(chartTag, {
    type: 'doughnut',
    data: {
        labels: ['일반', '맛집', '꿀팁', '힐링'],
        datasets: [{
            label: '게시글 수',
            data: [countTag1, countTag2, countTag3, countTag4],
            borderWidth: 1,
            backgroundColor: ["#5CD1E5", "#36B8CF", "#1294AB", "#004C63"]
        }]
    },
    options: {
        legend: {display: false},
        maintainAspectRatio: true, // 가로 세로 비율 유지
        responsive: false // 부모 요소에 맞게 자동으로 크기 조절 안함
    }
});


/* 라인 차트(4번) */
// var chartLine = document.getElementById('chartLine');
// new Chart(chartLine, {
//     type: 'line',
//     data: {
//         labels: ['6달 전', '3달 전', '2달 전', '1달 전', '2주일 전', '1주일 전', '현재'],
//         datasets: [{
//             data: [g1m0, g1m1, g1m2, g1m3, g1m4, g1m5, g1m6],
//             label: "일반회원 수",
//             borderColor: "red",
//             fill: false
//         }, {
//             data: [g2m0, g2m1, g2m2, g2m3, g2m4, g2m5, g2m6],
//             label: "게시글 수",
//             borderColor: "orange",
//             fill: false
//         }, {
//             data: [g2m0, g2m1, g2m2, g2m3, g2m4, g2m5, g2m6],
//             label: "탈퇴회원 수",
//             borderColor: "grey",
//             fill: false
//         }, {
//             data: [g3m0, g3m1, g3m2, g3m3, g3m4, g3m5, g3m6],
//             label: "신고 수",
//             borderColor: "black",
//             fill: false
//         }
//         ]
//     },
//     options: {
//         title: {
//             display: true
//         }
//     }
// });

/* 바 차트(5번)*/
var chartBar = document.getElementById('chartBar').getContext('2d');
new Chart(chartBar, {
    type: 'bar',
    data: {
        
        labels: ["욕설", "차별적 표현", "사칭", "광고성, 도배글", "선정성", "불법정보포함", "개인정보노출", "기타"],
        datasets: [
            {
                data: [report1, report2, report3, report4, report5, report6, report7, report8], /* 여기에 데이터를 넣습니다. */
                label: "신고 수",
                backgroundColor: ["#5CD1E5", "#4ABFD3", "#36B8CF", "#24A6BD", "#1294AB", "#008299", "#007087", "#004C63"],
            }
        ]
    },
    options: {
        indexAxis: 'y',
        legend: { display: false },
        title: { display: false }
    }
});
