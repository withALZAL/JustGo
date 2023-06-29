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
            // city.innerText = json.name; /* 변경 */
            let ol = document.getElementById("citySelect");
            let cityDisplay = ol.options[ol.selectedIndex].innerText; /* 변경 */
            city.innerText = cityDisplay;
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
// let miniUrl = "https://v6.exchangerate-api.com/v6/9a8b95f93d734ba858de3069/latest/USD";
// fetch(miniUrl)
// .then(response => response.json())
// .then(resultMini => {
//     let calc1 = resultMini.conversion_rates.KRW; // 1296.8883
//     let calc2 = calc1.toFixed(2); // 1296.88
//     document.getElementById("afterMoney").value = calc2;
//     let formattedNumber = calc2.replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 1,296.88

//     after1usd2krw.innerText = formattedNumber;
// });

/* 페이지 첫 로드 */
// $(document).ready(() => {
//     calcRate('USD', 'KRW');
//     calcRateX('KRW', 'USD');

//     calcIcon();
// });

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


/* 항공 API ----------------------------------------------- */

/* 나라 바뀌면 공항도 바뀌는 변수 */

function changeAirport() {

    // 출발지
    var countrySelect = document.getElementById("countrySelect");
    var airportSelect = document.getElementById("airportSelect");

    // 이전에 추가된 옵션 삭제
    while (airportSelect.firstChild) {
        airportSelect.removeChild(airportSelect.firstChild);
    }

    // 선택된 국가에 따라 옵션 추가
    var selectedCountry = countrySelect.options[countrySelect.selectedIndex].id;
    if (selectedCountry === "Korea") {
        addOption(airportSelect, "ICN", "인천", "ICN");
        addOption(airportSelect, "GMP", "김포", "GMP");
        addOption(airportSelect, "CJU", "제주", "CJU");
        addOption(airportSelect, "CJJ", "청주", "CJJ");
        addOption(airportSelect, "TAE", "대구", "TAE");
    } else if (selectedCountry === "Japan") {
        addOption(airportSelect, "HND", "하네다", "HND");
        addOption(airportSelect, "NRT", "나리타", "NRT");
        addOption(airportSelect, "KIX", "간사이", "KIX");
        addOption(airportSelect, "ITM", "이타미", "ITM");
        addOption(airportSelect, "FUK", "후쿠오카", "FUK");
        addOption(airportSelect, "CTS", "신치토세", "CTS");
    } else if (selectedCountry === "China") {
        addOption(airportSelect, "PEK", "서우두", "PEK");
        addOption(airportSelect, "PKX", "다싱", "PKX");
        addOption(airportSelect, "PVG", "푸둥", "PVG");
        addOption(airportSelect, "SHA", "훙차오", "SHA");
        addOption(airportSelect, "CAN", "바이윈", "CAN");
        addOption(airportSelect, "SZX", "바오안", "SZX");
        addOption(airportSelect, "HKG", "홍콩", "HKG");
    } else if (selectedCountry === "Vietnam") {
        addOption(airportSelect, "HAN", "노이바이", "HAN");
        addOption(airportSelect, "SGN", "떤선녓", "SGN");
        addOption(airportSelect, "DAD", "다낭", "DAD");
    } else if (selectedCountry === "Thai") {
        addOption(airportSelect, "BKK", "수안나폼", "BKK");
        addOption(airportSelect, "DMK", "돈므앙", "DMK");
        addOption(airportSelect, "HKT", "푸켓", "HKT");
        addOption(airportSelect, "CNX", "치앙마이", "CNX");
    } else if (selectedCountry === "Australia") {
        addOption(airportSelect, "SYD", "시드니", "SYD");
        addOption(airportSelect, "CBR", "캔버라", "CBR");
        addOption(airportSelect, "MEL", "멜버른", "MEL");
        addOption(airportSelect, "BNE", "브리즈번", "BNE");
        addOption(airportSelect, "PER", "퍼스", "PER");
    }

    var departureAirport = document.getElementById("airportSelect").innerText; // 출발 공항 선택자의 값을 가져옴
    var arrivalAirport = document.getElementById("airportSelect2").innerText; // 도착 공항 선택자의 값을 가져옴
    var loadingMessage = document.getElementById("loadingMessage");
    var noFlightMessage = document.getElementById("noFlightMessage");
    var loadedMessage = document.getElementById("loadedMessage");
    // 검색 중 문구 업데이트
    loadingMessage.innerHTML = '';
    loadingMessage.innerHTML = `
        <br>
        <i class="fa-solid fa-plane-departure fa-beat-fade" style="font-size: 4.0rem;"></i>
        <br><br>
        ${departureAirport}에서 ${arrivalAirport}까지 가는<br>
        가장 싼 항공권을 검색 중입니다.
    `;

    // 검색 결과 없음 문구 업데이트
    noFlightMessage.innerHTML = '';
    noFlightMessage.innerHTML = `
        <br>
        <i class="fa-solid fa-circle-xmark fa-beat-fade" style="font-size: 4.0rem;"></i>
        <br><br>
        죄송합니다.
        ${departureAirport}에서 ${arrivalAirport}까지 가는<br>
        직항 항공권이 없습니다.
    `;

    // 검색 완료 문구 업데이트
    loadedMessage.innerHTML = '';
    loadedMessage.innerHTML = `
        <br>
        <i class="fa-solid fa-circle-check fa-beat-fade" style="font-size: 4.0rem;"></i>
        <br><br>
        ${departureAirport}에서 ${arrivalAirport}까지 가는<br>
        가장 싼 항공권입니다.
    `;
}

/* 나라 바뀌면 공항도 바뀌는 변수 */
function changeAirport2() {

    // 도착지
    var countrySelect2 = document.getElementById("countrySelect2");
    var airportSelect2 = document.getElementById("airportSelect2");

    // 이전에 추가된 옵션 삭제
    while (airportSelect2.firstChild) {
        airportSelect2.removeChild(airportSelect2.firstChild);
    }

    // 선택된 국가에 따라 옵션 추가
    var selectedCountry = countrySelect2.options[countrySelect2.selectedIndex].id;
    if (selectedCountry === "Korea") {
        addOption(airportSelect2, "ICN", "인천", "ICN");
        addOption(airportSelect2, "GMP", "김포", "GMP");
        addOption(airportSelect2, "CJU", "제주", "CJU");
        addOption(airportSelect2, "CJJ", "청주", "CJJ");
        addOption(airportSelect2, "TAE", "대구", "TAE");
    } else if (selectedCountry === "Japan") {
        addOption(airportSelect2, "HND", "하네다", "HND");
        addOption(airportSelect2, "NRT", "나리타", "NRT");
        addOption(airportSelect2, "KIX", "간사이", "KIX");
        addOption(airportSelect2, "ITM", "이타미", "ITM");
        addOption(airportSelect2, "FUK", "후쿠오카", "FUK");
        addOption(airportSelect2, "CTS", "신치토세", "CTS");
    } else if (selectedCountry === "China") {
        addOption(airportSelect2, "PEK", "서우두", "PEK");
        addOption(airportSelect2, "PKX", "다싱", "PKX");
        addOption(airportSelect2, "PVG", "푸둥", "PVG");
        addOption(airportSelect2, "SHA", "훙차오", "SHA");
        addOption(airportSelect2, "CAN", "바이윈", "CAN");
        addOption(airportSelect2, "SZX", "바오안", "SZX");
        addOption(airportSelect2, "HKG", "홍콩", "HKG");
    } else if (selectedCountry === "Vietnam") {
        addOption(airportSelect2, "HAN", "노이바이", "HAN");
        addOption(airportSelect2, "SGN", "떤선녓", "SGN");
        addOption(airportSelect2, "DAD", "다낭", "DAD");
    } else if (selectedCountry === "Thai") {
        addOption(airportSelect2, "BKK", "수안나폼", "BKK");
        addOption(airportSelect2, "DMK", "돈므앙", "DMK");
        addOption(airportSelect2, "HKT", "푸켓", "HKT");
        addOption(airportSelect2, "CNX", "치앙마이", "CNX");
    } else if (selectedCountry === "Australia") {
        addOption(airportSelect2, "SYD", "시드니", "SYD");
        addOption(airportSelect2, "CBR", "캔버라", "CBR");
        addOption(airportSelect2, "MEL", "멜버른", "MEL");
        addOption(airportSelect2, "BNE", "브리즈번", "BNE");
        addOption(airportSelect2, "PER", "퍼스", "PER");
    }

    var departureAirport = document.getElementById("airportSelect").innerText; // 출발 공항 선택자의 값을 가져옴
    var arrivalAirport = document.getElementById("airportSelect2").innerText; // 도착 공항 선택자의 값을 가져옴
    var loadingMessage = document.getElementById("loadingMessage");
    var noFlightMessage = document.getElementById("noFlightMessage");
    var loadedMessage = document.getElementById("loadedMessage");
    // // 검색 중 문구 업데이트
    // loadingMessage.innerHTML = '';
    // loadingMessage.innerHTML = `
    //     <br>
    //     <i class="fa-solid fa-plane-departure fa-beat-fade" style="font-size: 4.0rem;"></i>
    //     <br><br>
    //     ${departureAirport}에서 ${arrivalAirport}까지 가는<br>
    //     가장 싼 항공권을 검색 중입니다.
    // `;

    // // 검색 결과 없음 문구 업데이트
    // noFlightMessage.innerHTML = '';
    // noFlightMessage.innerHTML = `
    //     <br>
    //     <i class="fa-solid fa-circle-xmark fa-beat-fade" style="font-size: 4.0rem;"></i>
    //     <br><br>
    //     죄송합니다.
    //     ${departureAirport}에서 ${arrivalAirport}까지 가는<br>
    //     직항 항공권이 없습니다.
    // `;

    // // 검색 완료 문구 업데이트
    // loadedMessage.innerHTML = '';
    // loadedMessage.innerHTML = `
    //     <br>
    //     <i class="fa-solid fa-circle-check fa-beat-fade" style="font-size: 4.0rem;"></i>
    //     <br><br>
    //     ${departureAirport}에서 ${arrivalAirport}까지 가는<br>
    //     가장 싼 항공권입니다.
    // `;
}

// 새로운 옵션을 select 요소에 추가하는 함수
function addOption(selectElement, id, text, city) {
    var option = document.createElement("option");
    option.value = id;
    option.text = text + '(' + city + ')';
    selectElement.appendChild(option);
}

/* 오늘 날짜 설정 */
const datepicker1 = document.getElementById('datepicker1');
const datepicker2 = document.getElementById('datepicker2');

// 오늘 날짜
const today = new Date();
const year = today.getFullYear();
const month = String(today.getMonth() + 1).padStart(2, '0');
const day = String(today.getDate()).padStart(2, '0');
const formattedDate = `${year}-${month}-${day}`;

// 일주일 뒤 날짜
const nextWeek = new Date(today.getTime() + 7 * 24 * 60 * 60 * 1000);
const year2 = nextWeek.getFullYear();
const month2 = String(nextWeek.getMonth() + 1).padStart(2, '0');
const day2 = String(nextWeek.getDate()).padStart(2, '0');
const formattedDate2 = `${year2}-${month2}-${day2}`;

datepicker1.value = formattedDate;
datepicker2.value = formattedDate2;





// 항공 API

const searchBtn = document.getElementById("searchBtn");

// searchBtn.addEventListener("click", () => {
searchBtn.addEventListener("click", e => {

    /* 상준 보완 필요 */
    const datepicker1 = document.getElementById('datepicker1');
    const datepicker2 = document.getElementById('datepicker2');

    if(datepicker1.value === '') {
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
                title: '가는 날을 선택해주세요.' /* 메시지 담기 */
            })
        e.preventDefault();
        return;
    }
    if(datepicker2.value === '') {
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
                title: '오는 날을 선택해주세요.' /* 메시지 담기 */
            })
        e.preventDefault();
        return;
    }
    /* 상준 보완 필요 */
    







    fetch("https://test.api.amadeus.com/v1/security/oauth2/token", {
    body: `grant_type=client_credentials&client_id=McfTZz5BGGD2CsF6urmoKwnhsGn5GIWF&client_secret=0zFKW2c287K2VK8G`,
    headers: {
    "Content-Type": "application/x-www-form-urlencoded"
    },
    method: "POST"
    }).then(resp => resp.json())
    .then(result => 
    { 
        var accessToken = result["access_token"];
        const selectAirFrom = document.getElementById("airportSelect");
        const from = selectAirFrom.options[selectAirFrom.selectedIndex].value;
        const fromCity = selectAirFrom.options[selectAirFrom.selectedIndex].innerText; /* 상준 */

        console.log(from);
        console.log(from);
        console.log(from);
        console.log(from);
        console.log(from);
        console.log(fromCity);
        console.log(fromCity);
        console.log(fromCity);
        console.log(fromCity);
        console.log(fromCity);
    
        const selectAirTo = document.getElementById("airportSelect2");
        const to = selectAirTo.options[selectAirTo.selectedIndex].value;
        const toCity = selectAirTo.options[selectAirTo.selectedIndex].innerText; /* 상준 */

        console.log(to);
        console.log(to);
        console.log(to);
        console.log(to);
        console.log(to);
        console.log(toCity);
        console.log(toCity);
        console.log(toCity);
        console.log(toCity);
        console.log(toCity);
        
        /* 상준 */
        var loadingMessage = document.getElementById('loadingMessage');
        var noFlightMessage = document.getElementById('noFlightMessage');
        var loadedMessage = document.getElementById('loadedMessage');

        loadingMessage.innerHTML = '';
        loadingMessage.innerHTML = `
            <br>
            <i class="fa-solid fa-circle-check fa-beat-fade" style="font-size: 4.0rem;"></i>
            <br><br>
            ${fromCity}에서 ${toCity}까지 가는<br>
            가장 싼 항공권을 찾고 있습니다.
        `;
        noFlightMessage.innerHTML = '';
        noFlightMessage.innerHTML = `
            <br>
            <i class="fa-solid fa-circle-check fa-beat-fade" style="font-size: 4.0rem;"></i>
            <br><br>
            죄송합니다.<br>
            ${fromCity}에서 ${toCity}까지 가는<br>
            직항 항공권이 없는 것 같습니다.
        `;
        loadedMessage.innerHTML = '';
        loadedMessage.innerHTML = `
            <br>
            <i class="fa-solid fa-circle-check fa-beat-fade" style="font-size: 4.0rem;"></i>
            <br><br>
            ${fromCity}에서 ${toCity}까지 가는<br>
            가장 싼 항공권 리스트입니다.
        `;

        /* 상준 */

    
        const departDate = document.getElementById("datepicker1").value;
        const returnDate = document.getElementById("datepicker2").value;

        /* 로딩 애니메이션 없애기 */
        // const waves = document.getElementsByClassName('wave');
        // while (waves.length > 0) {
        //     waves[0].remove();
        // }
        /* 문구 바꾸기 */
        const loading = document.getElementById('loadingMessage');
        loading.style.display = 'none';
        const loaded = document.getElementById('loadedMessage');
        loaded.style.display = 'block';
    
        fetch(`https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=${from}&destinationLocationCode=${to}&departureDate=${departDate}&returnDate=${returnDate}&adults=1&travelClass=ECONOMY&nonStop=true&currencyCode=KRW&max=10`, {
        headers: {
            Authorization: `Bearer ${accessToken}`
        }
        }).then(res => res.json())
        .then(jsonStr => {
            
            console.log(jsonStr)
            console.log(jsonStr.data[0].price);
            console.log(jsonStr.data[0].itineraries[0].segments[0].departure);
            
            
            // const card = document.querySelectorAll(".airportCard");// 카드생성 
            
            // const departTime = document.querySelectorAll(".departTime"); // 출발지 출발
            // const duration = document.querySelectorAll(".duration"); // 출발지로 부터 도착지까지  시간
            // const arrivalTime = document.querySelectorAll(".arrivalTime");// 도착지에 도착하는 시간
            
            // const departTime1 = document.querySelectorAll(".departTime1"); // 도착지 출발
            // const duration1 = document.querySelectorAll(".duration1"); // 출발지로 부터 도착지까지  시간
            // const arrivalTime1 = document.querySelectorAll(".arrivalTime1");// 출발지에 도착하는 시간
            
            // var totalPrice = document.querySelectorAll(".airPrice"); // 가격 태그
            
            // for(let i =0; i<card.length; i++){
            //     for(let j = 0; j<jsonStr.data.length; j++){
                    
            //         totalPrice[i].innerText = Math.floor(jsonStr.data[j].price.total) + "원"; // 가격
            //         // 출발
            //         departTime[i].innerText = jsonStr.data[j].itineraries[0].segments[0].departure.at; // 출발시간
            //         duration[i].innerText = jsonStr.data[j].itineraries[0].segments[0].duration; // 비행시간
            //         arrivalTime[i].innerText = jsonStr.data[j].itineraries[0].segments[0].arrival.at; // 도착시간
                    
            //         // 도착
            //         departTime1[i].innerText = jsonStr.data[j].itineraries[1].segments[0].departure.at; // 출발시간
            //         duration1[i].innerText = jsonStr.data[j].itineraries[1].segments[0].duration; // 비행시간
            //         arrivalTime1[i].innerText = jsonStr.data[j].itineraries[1].segments[0].arrival.at; // 도착시간
            
            //     }


            // }
            const card = document.querySelectorAll(".airportCard"); // 카드생성 

            for (let i = 0; i < card.length; i++) {
                if (i < jsonStr.data.length) {

                    const currentCard = card[i];
                    const jsonStrData = jsonStr.data[i];

                    const selectAirFrom1 = document.getElementById("airportSelect");
                    const from1 = selectAirFrom1.options[selectAirFrom1.selectedIndex].innerText;
                
                    const selectAirTo1 = document.getElementById("airportSelect2");
                    const to1 = selectAirTo1.options[selectAirTo1.selectedIndex].innerText;

                    // 출발지
                    const departCity = currentCard.querySelector(".departureCity");
                    const departCity1 = currentCard.querySelector(".departureCity1");
                    const airName = currentCard.querySelector(".airName");
                    
                    // 도착지
                    const arrCity = currentCard.querySelector(".arrivalCity");
                    const arrCity1 = currentCard.querySelector(".arrivalCity1");
                    const deName = currentCard.querySelector(".deName");

                    


                    const totalPrice = currentCard.querySelector(".airPrice"); // 가격 태그
                    const departTime = currentCard.querySelector(".departTime"); // 출발지 출발
                    const duration = currentCard.querySelector(".duration"); // 출발지로 부터 도착지까지  시간
                    const arrivalTime = currentCard.querySelector(".arrivalTime"); // 도착지에 도착하는 시간
                    const departTime1 = currentCard.querySelector(".departTime1"); // 도착지 출발
                    const duration1 = currentCard.querySelector(".duration1"); // 출발지로 부터 도착지까지  시간
                    const arrivalTime1 = currentCard.querySelector(".arrivalTime1"); // 출발지에 도착하는 시간
                    
                    totalPrice.innerText = Math.floor(jsonStrData.price.total).toLocaleString() + "원"; // 가격
                    
                    departTime.innerText = jsonStrData.itineraries[0].segments[0].departure.at; // 출발시간

                    // 비행시간 알파벳 한글로 바꾸기
                    const flightDuration = jsonStrData.itineraries[0].segments[0].duration;
                    const translateKor = {
                    'H': '시간',
                    'M': '분',
                    // 다른 알파벳에 대한 매핑을 추가할 수 있습니다.
                    };

                    let translateCheck = '';

                    for (let i = 0; i < flightDuration.length; i++) {
                    const replaceEng = flightDuration.charAt(i);
                    const translatedReplaceEng = translateKor[replaceEng] || replaceEng;

                    translateCheck += translatedReplaceEng;
                    }


                    duration.innerText = translateCheck.substring(2); // 비행시간

                    
                    arrivalTime.innerText = jsonStrData.itineraries[0].segments[0].arrival.at; // 도착시간
                    departCity.innerText = from1;
                    departCity1.innerText = to1;
                    airName.innerText = from1;

                    departTime1.innerText = jsonStrData.itineraries[1].segments[0].departure.at; // 출발시간
                    
                    // 비행시간 알파벳 한글로 바꾸기
                    const flightDuration1 = jsonStrData.itineraries[1].segments[0].duration;
                    const translateKor1 = {
                    'H': '시간',
                    'M': '분',
                    // 다른 알파벳에 대한 매핑을 추가할 수 있습니다.
                    };

                    let translateCheck1 = '';

                    for (let i = 0; i < flightDuration1.length; i++) {
                    const replaceEng1 = flightDuration1.charAt(i);
                    const translatedReplaceEng1 = translateKor1[replaceEng1] || replaceEng1;

                    translateCheck1 += translatedReplaceEng1;
                    }

                    
                    
                    duration1.innerText = translateCheck1.substring(2); // 비행시간
                    
                    
                    arrivalTime1.innerText = jsonStrData.itineraries[1].segments[0].arrival.at; // 도착시간
                    arrCity.innerText = to1;
                    arrCity1.innerText = from1;
                    deName.innerText = to1;
                    
                    


                }else{
                     // jsonStr.data의 길이보다 큰 card 카드는 숨깁니다.
                    card[i].style.display="none";
                }

            }

        });
        
    
    });
})
