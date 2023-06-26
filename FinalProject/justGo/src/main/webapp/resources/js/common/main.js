/* 날씨 API ----------------------------------------------- */

/* 날씨 가져오기 함수 */
function getWeather(cityName) {
    let WeatherUrl = "https://api.openweathermap.org/data/2.5/weather?q="+cityName+"&appid=b690d0fd2f1b2fe624fa0586e5e0d458&units=metric&lang=kr";

    fetch(WeatherUrl)
        .then((response) => { return response.json(); })
        .then((json) => {
            console.log(json);

            let currentTemp = document.getElementById("currentTemp"); /* 온도 */
            let humidity = document.getElementById("humidity"); /* 습도 */
            let wind = document.getElementById("wind"); /* 바람 */
            let city = document.getElementById("city"); /* 도시 */
            let weather = document.getElementById("weather"); /* 날씨 */

            let icon = json.weather[0].icon; /* 아이콘 */
            let iconUrl = document.getElementById('icon'); // img id를 iconUrl이라는 이름으로 받아옴
            // console.log(icon); /* 아이콘 넘버 확인 */

            /* https://openweathermap.org/weather-conditions */
            /* 맑음 */
            if(icon == '01d') weatherIcon = '<i class="fa-solid fa-sun fa-spin" style="color: orange; font-size: 4.5rem;"></i>';
            if(icon == '01n') weatherIcon = '<i class="fa-solid fa-moon fa-beat" style="color: yellow; font-size: 4.5rem;"></i>';
                /* 구름 약간 */
            if(icon == '02d') weatherIcon = '<i class="fa-solid fa-cloud-sun fa-beat" style="color: grey; font-size: 4.5rem;"></i>';
            if(icon == '02n') weatherIcon = '<i class="fa-solid fa-cloud-moon fa-beat" style="color: grey; font-size: 4.5rem;"></i>';
                /* 구름 많음 */
            if(icon == '03d') weatherIcon = '<i class="fa-solid fa-cloud fa-beat" style="color: grey; font-size: 4.5rem;"></i>';
            if(icon == '03n') weatherIcon = '<i class="fa-solid fa-cloud fa-beat" style="color: grey; font-size: 4.5rem;"></i>';
                /* 흐림 */
            if(icon == '04d') weatherIcon = '<i class="fa-solid fa-cloud fa-beat" style="color: grey; font-size: 4.5rem;"></i>';
            if(icon == '04n') weatherIcon = '<i class="fa-solid fa-cloud fa-beat" style="color: grey; font-size: 4.5rem;"></i>';
                /* 비 */
            if(icon == '09d') weatherIcon = '<i class="fa-solid fa-cloud-sun-rain fa-beat-fade" style="color: lightgrey; font-size: 4.5rem;"></i>';
            if(icon == '19n') weatherIcon = '<i class="fa-solid fa-cloud-moon-rain fa-beat-fade" style="color: lightgrey; font-size: 4.5rem;"></i>';
                /* 강한 비 */
            if(icon == '10d') weatherIcon = '<i class="fa-solid fa-cloud-showers-heavy fa-beat-fade" style="color: lightgrey; font-size: 4.5rem;"></i>';
            if(icon == '10n') weatherIcon = '<i class="fa-solid fa-cloud-showers-heavy fa-beat-fade" style="color: lightgrey; font-size: 4.5rem;"></i>';
                /* 강한 비 */
            if(icon == '11d') weatherIcon = '<i class="fa-solid fa-cloud-bolt fa-beat-fade" style="color: lightgrey; font-size: 4.5rem;"></i>';
            if(icon == '11n') weatherIcon = '<i class="fa-solid fa-cloud-bolt fa-beat-fade" style="color: lightgrey; font-size: 4.5rem;"></i>';
                /* 눈 */
            if(icon == '13d') weatherIcon = '<i class="fa-solid fa-snowflake fa-spin" style="font-size: 4.5rem;"></i>';
            if(icon == '13n') weatherIcon = '<i class="fa-solid fa-snowflake fa-spin" style="font-size: 4.5rem;"></i>';
                /* 안개 */
            if(icon == '50d') weatherIcon = '<i class="fa-solid fa-smog fa-fade" style="color: lightgrey; font-size: 4.5rem;"></i>';
            if(icon == '50n') weatherIcon = '<i class="fa-solid fa-smog fa-fade" style="color: lightgrey; font-size: 4.5rem;"></i>';

            iconUrl.innerHTML = '';
            iconUrl.innerHTML = weatherIcon;

            currentTemp.innerText = Math.floor(json.main.temp);
            humidity.innerText = json.main.humidity;
            wind.innerText = json.wind.speed;
            city.innerText = json.name;
            weather.innerText = json.weather[0].description;

            // iconUrl.src = "http://openweathermap.org/img/wn/" + icon + ".png"; //iconurl로 src를 설정해줌
        });
}

function change(){
    let selectElement = document.getElementById("citySelect");
    let cityName = selectElement.options[selectElement.selectedIndex].id;
    getWeather(cityName);
}
getWeather("Seoul"); // 초기값 서울

/* 환율 API ----------------------------------------------- */

/* 고정 1달러 환율(왼쪽) */
let miniUrl = "https://v6.exchangerate-api.com/v6/9a8b95f93d734ba858de3069/latest/USD";
fetch(miniUrl)
.then(response => response.json())
.then(resultMini => {
    let calc1 = resultMini.conversion_rates.KRW; // 1296.8883
    let calc2 = calc1.toFixed(2); // 1296.88
    document.getElementById("afterMoney").value = calc2;
    let formattedNumber = calc2.replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 1,296.88

    after1usd2krw.innerText = formattedNumber;
});

/* 페이지 첫 로드 */
$(document).ready(() => {
    calcRate('USD', 'KRW');
    calcRateX('KRW', 'USD');

    calcIcon();
});

/* before 통화 셀렉터하면 기본 단위 바뀌는 함수 */
function beforeMoneyChange() {
    let beforeMoney = document.getElementById("beforeMoney"); /* 기준 숫자 */
    let beforeCurrSelect = document.getElementById("beforeCurrSelect");
    let beforeCurr = beforeCurrSelect.options[beforeCurrSelect.selectedIndex].id; /* 기준 통화 */

    if(beforeCurr == 'USD') { beforeMoney.value = ''; beforeMoney.value = (1).toFixed(2); }
    if(beforeCurr == 'JPY') { beforeMoney.value = ''; beforeMoney.value = (100).toFixed(2); }
    if(beforeCurr == 'KRW') { beforeMoney.value = ''; beforeMoney.value = (1000).toFixed(2); }
    if(beforeCurr == 'CNY') { beforeMoney.value = ''; beforeMoney.value = (1).toFixed(2); }
    if(beforeCurr == 'THB') { beforeMoney.value = ''; beforeMoney.value = (1).toFixed(2); }
    if(beforeCurr == 'VND') { beforeMoney.value = ''; beforeMoney.value = (100).toFixed(2); }
    if(beforeCurr == 'AUD') { beforeMoney.value = ''; beforeMoney.value = (1).toFixed(2); }
}

let beforeCurrSelect = document.getElementById('beforeCurrSelect');
let afterCurrSelect = document.getElementById('afterCurrSelect');

/* beforeCurrSelect 변경 발생 시 환율비/역환율비 계산 */
beforeCurrSelect.addEventListener('change', () => {
    let beforeCurr = beforeCurrSelect.options[beforeCurrSelect.selectedIndex].id;
    let afterCurr = afterCurrSelect.options[afterCurrSelect.selectedIndex].id;

    calcRate(beforeCurr, afterCurr);
    calcRateX(afterCurr, beforeCurr);
});

/* afterCurrSelect 변경 발생 시 환율비/역환율비 계산 */
afterCurrSelect.addEventListener('change', () => {
    let beforeCurr = beforeCurrSelect.options[beforeCurrSelect.selectedIndex].id;
    let afterCurr = afterCurrSelect.options[afterCurrSelect.selectedIndex].id;

    calcRate(beforeCurr, afterCurr);
    calcRateX(afterCurr, beforeCurr);
});

/* 환율비 계산기 */
function calcRate(beforeCurr, afterCurr) {
    let moneyUrl = "https://v6.exchangerate-api.com/v6/9a8b95f93d734ba858de3069/latest/" + beforeCurr;

    fetch(moneyUrl)
    .then(response => {return response.json();})
    .then(result => {
        let exchangeRate = result.conversion_rates[afterCurr]; /* 대괄호 안에 써야 함! */
        let resultRate = document.getElementById("resultRate");
        resultRate.innerText = exchangeRate;

        resultMoney(exchangeRate);
        calcIcon();
    });
}

/* 역환율비 계산기 */
function calcRateX(afterCurr, beforeCurr) {
    let moneyUrl = "https://v6.exchangerate-api.com/v6/9a8b95f93d734ba858de3069/latest/" + afterCurr;

    fetch(moneyUrl)
    .then(response => {return response.json();})
    .then(result => {
        let exchangeRateX = result.conversion_rates[beforeCurr]; /* 대괄호 안에 써야 함! */
        let resultRateX = document.getElementById("resultRateX");
        resultRateX.innerText = exchangeRateX;

        resultMoney(exchangeRate);
        calcIcon();
    });
}

/* beforeMoney * 환율비 = 최종값 출력 */
function resultMoney(exchangeRate) {
    let beforeMoney = document.getElementById("beforeMoney").value; /* 기준 숫자 */

    let result = beforeMoney * exchangeRate;
    let afterMoney = document.getElementById("afterMoney");
    afterMoney.value = "";
    afterMoney.value = result.toFixed(2);   
} 

/* beforeMoney 값 변경 시 결과 계산 */
document.getElementById('beforeMoney').addEventListener('input', () => {
    let beforeMoney = parseFloat(document.getElementById('beforeMoney').value);
    let exchangeRate = parseFloat(resultRate.innerText);
    let resultMoney = beforeMoney * exchangeRate;
    let afterMoney = document.getElementById("afterMoney");
    afterMoney.value = '';
    afterMoney.value = resultMoney.toFixed(2);
});

/* afterMoney 값 변경 시 결과 계산 */
document.getElementById('afterMoney').addEventListener('input', () => {
    let afterMoney = parseFloat(document.getElementById('afterMoney').value);
    let exchangeRateX = parseFloat(resultRateX.innerText);
    let resultMoneyX = afterMoney * exchangeRateX;
    let beforeMoney = document.getElementById("beforeMoney");
    beforeMoney.value = '';
    beforeMoney.value = resultMoneyX.toFixed(2);
});

/* 애니메이션 효과 적용 함수 */
function calcIcon() {
    let calcIcon = document.querySelector('.fa-calculator');
    let equalsIcon = document.querySelector('.fa-equals');

    calcIcon.style.display = 'inline-block';
    equalsIcon.style.display = 'none';

    setTimeout(() => {
        calcIcon.style.display = 'none';
        equalsIcon.style.display = 'inline-block';
    }, 1500);
}