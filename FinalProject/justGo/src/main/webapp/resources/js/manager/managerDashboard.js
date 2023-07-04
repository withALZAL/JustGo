/* 도넛 차트(2번) */
var chartDoughnut = document.getElementById('chartDoughnut').getContext('2d');
new Chart(chartDoughnut, {
    type: 'doughnut',
    data: {
        labels: ['자유게시판', '질문게시판', '중국게시판', '일본게시판', '베트남게시판', '태국게시판', '호주게시판'],
        datasets: [{
            label: '게시글 수',
            data: [12, 19, 3, 5, 2, 3, 10],
            borderWidth: 1
        }]
    },
    options: {
        legend: {
            display: false
        },
        maintainAspectRatio: false, // 가로 세로 비율 유지하지 않음
        responsive: true // 부모 요소에 맞게 자동으로 크기 조절
    }
});

/* 태그 차트(3번) */
var chartTag = document.getElementById('chartTag');

/* 라인 차트(4번) */
var chartLine = document.getElementById('chartLine');
new Chart(chartLine, {
    type: 'line',
    data: {
        labels: [1500, 1600, 1700, 1750, 1800, 1850, 1900, 1950, 1999, 2050],
        datasets: [{
            data: [86, 114, 106, 106, 107, 111, 133, 221, 783, 2478],
            label: "Africa",
            borderColor: "#3e95cd",
            fill: false
        }, {
            data: [282, 350, 411, 502, 635, 809, 947, 1402, 3700, 5267],
            label: "Asia",
            borderColor: "#8e5ea2",
            fill: false
        }, {
            data: [168, 170, 178, 190, 203, 276, 408, 547, 675, 734],
            label: "Europe",
            borderColor: "#3cba9f",
            fill: false
        }, {
            data: [40, 20, 10, 16, 24, 38, 74, 167, 508, 784],
            label: "Latin America",
            borderColor: "#e8c3b9",
            fill: false
        }, {
            data: [6, 3, 2, 2, 7, 26, 82, 172, 312, 433],
            label: "North America",
            borderColor: "#c45850",
            fill: false
        }
        ]
    },
    options: {
        title: {
            display: true,
            text: 'World population per region (in millions)'
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
                label: "Population (millions)",
                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9"],
                data: [2478, 5267, 734, 784, 2478, 5267, 734, 784] /* 여기에 데이터를 넣습니다. */
            }
        ]
    },
    options: {
        legend: { display: false },
        title: {
            display: true,
            // text: 'Predicted world population (millions) in 2050'
        }
    }
});
