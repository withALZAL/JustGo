/* 환율 계산기 API JSON 연결 */

function handleSelection(selectElement) {

    var krw = document.getElementById("krw").value;
    var selectedName = selectElement.options[selectElement.selectedIndex].getAttribute("name");
    var changeMoney = usd;
    
    if(selectedName == 'usd') changeMoney = usd; 
    if(selectedName == 'jpy') changeMoney = jpy; 
    if(selectedName == 'cny') changeMoney = cny; 
    if(selectedName == 'eur') changeMoney = eur; 
    if(selectedName == 'gbp') changeMoney = gbp; 
    if(selectedName == 'vnd') changeMoney = vnd; 
    if(selectedName == 'thb') changeMoney = thb; 
    if(selectedName == 'twd') changeMoney = twd; 
    if(selectedName == 'hkd') changeMoney = hkd; 
    if(selectedName == 'aud') changeMoney = aud;
    
    console.log(krw);
    console.log(changeMoney);
}

