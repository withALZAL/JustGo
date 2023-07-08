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
            backgroundColor: ["#1f77b4", "#ff7f0e", "#2ca02c", "#d62728", "#9467bd", "#e377c2", "#7f7f7f", "#bcbd22", "#17becf"]
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
    type: 'pie',
    data: {
        labels: ['일반', '맛집', '꿀팁', '힐링'],
        datasets: [{
            label: '게시글 수',
            data: [countTag1, countTag2, countTag3, countTag4],
            borderWidth: 1,
            backgroundColor: ["#1f77b4", "#ff7f0e", "#2ca02c", "#d62728", "#9467bd", "#e377c2", "#7f7f7f", "#bcbd22", "#17becf"]
        }]
    },
    options: {
        legend: {display: false},
        maintainAspectRatio: true, // 가로 세로 비율 유지
        responsive: false // 부모 요소에 맞게 자동으로 크기 조절 안함
    }
});


/* 라인 차트(4번) */
var chartLine = document.getElementById('chartLine');
new Chart(chartLine, {
    type: 'line',
    data: {
        labels: ['6달 전', '3달 전', '2달 전', '1달 전', '2주일 전', '1주일 전', '현재'],
        datasets: [{
            data: [member6m, member3m, member2m, member1m, member2w, member1w, memberNow],
            label: "일반회원 수",
            borderColor: "red",
            fill: false
        }, {
            data: [post6m, post3m, post2m, post1m, post2w, post1w, postNow],
            label: "게시글 수",
            borderColor: "orange",
            fill: false
        }, {
            data: [out6m, out3m, out2m, out1m, out2w, out1w, outNow],
            label: "탈퇴회원 수",
            borderColor: "grey",
            fill: false
        }, {
            data: [report6m, report3m, report2m, report1m, report2w, report1w, reportNow],
            label: "신고 수",
            borderColor: "black",
            fill: false
        }
        ]
    },
    options: {
        title: {
            display: true
        }
    }
});

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
                backgroundColor: ["#1f77b4", "#ff7f0e", "#2ca02c", "#d62728", "#9467bd", "#e377c2", "#7f7f7f", "#bcbd22", "#17becf"],
            }
        ]
    },
    options: {
        indexAxis: 'y',
        plugins: {
        legend: { display: false },
        },
        title: { display: false }
    }
});

/* 디테일 차트(6번) */
function chartDetail() {
    var url = "/manager/chartDetail";
    var name = "디테일 차트";
    var option = "width = 720, height = 720, top = 100, left = 200, location = no"
    window.open(url, name, option);
}

// /* 디테일 차트(6번) */
// var chartDetail = document.getElementById('chartDetail').getContext('2d');
// new Chart(chartDetail, {
//     type: 'radar',
//     data: {
//         labels: ['일반', '맛집', '꿀팁', '힐링'],
//         datasets: [
//             {
//                 label: '중국게시판',
//                 data: [10, 22, 33, 42],
//                 backgroundColor: 'rgba(255, 99, 132, 0.5)',
//                 borderColor: 'rgba(255, 99, 132, 1)',
//                 borderWidth: 1,
//             },
//             {
//                 label: '일본게시판',
//                 data: [10, 32, 20, 18],
//                 backgroundColor: 'rgba(54, 162, 235, 0.5)',
//                 borderColor: 'rgba(54, 162, 235, 1)',
//                 borderWidth: 1,
//             },
//             {
//                 label: '베트남게시판',
//                 data: [33, 20, 20, 48],
//                 backgroundColor: 'rgba(255, 205, 86, 0.5)',
//                 borderColor: 'rgba(255, 205, 86, 1)',
//                 borderWidth: 1,
//             },
//             {
//                 label: '태국게시판',
//                 data: [39, 66, 30, 41],
//                 backgroundColor: 'rgba(75, 192, 192, 0.5)',
//                 borderColor: 'rgba(75, 192, 192, 1)',
//                 borderWidth: 1,
//             },
//             {
//                 label: '호주게시판',
//                 data: [33, 45, 22, 11],
//                 backgroundColor: 'rgba(153, 102, 255, 0.5)',
//                 borderColor: 'rgba(153, 102, 255, 1)',
//                 borderWidth: 1,
//             },
//         ],
//     },
//     options: {
//         responsive: false, // 반응형 크기 조정 비활성화
//         maintainAspectRatio: false, // 종횡비 유지 비활성화
//         width: 400, // 가로 크기 (픽셀)
//         height: 300, // 세로 크기 (픽셀)
//         scale: {
//             ticks: {
//                 beginAtZero: true,
//                 max: 100,
//                 stepSize: 20,
//             },
//         },
//     },
// });
