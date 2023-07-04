/* 도넛 차트 */
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

/* 바 차트 */
var chartBar = document.getElementById('chartBar').getContext('2d');
new Chart(chartBar, {
    type: 'horizontalBar',
    data: {
        labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
        datasets: [
            {
                label: "Population (millions)",
                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850"],
                data: [2478, 5267, 734, 784, 433]
            }
        ]
    },
    options: {
        legend: { display: false },
        title: {
            display: true,
            text: 'Predicted world population (millions) in 2050'
        }
    }
});