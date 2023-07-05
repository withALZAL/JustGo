/* 인사말 */
const greetingWord = [
    'HELLO!',
    '안녕하세요!',
    '你好!',
    'こんにちは!',
    'สวัสดี!',
    'Xin chào!',
    'Bonjour!',
    'привет!',
    'Hallo!',
    '¡Hola!',
    'مرحبًا!',
    'नमस्ते!',
    'Ciao!',
    'Halo!'
];
const greetingElement = document.getElementById('greeting');
const randomIndex = Math.floor(Math.random() * greetingWord.length);

/* 랜덤 인사말 출력 */
window.addEventListener('load', () => {
    greetingElement.innerText = greetingWord[randomIndex];
});

/* 이스터에그 */
const input = document.getElementById('query');
const asuka = document.getElementById('asuka');
input.addEventListener("input", e => {
    var query = e.target.value;
    if (query === "아스카") {
        asuka.style.display = "inline";
        alert(`
        ⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀메롱⠀⠀⢀⠀⠐⢤⠐⠈⠀⠀⠈⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⡐⠀⠀⠐⠉⠀⠀⠀⠉⠂⢧⠀⠀⠒⠂⠀⠠⠀⠀⠀⠀
        ⠀⠀⠀⡐⠀⠀⠀⠀⢠⡆⡞⠦⠙⠛⠁⠿⣤⡐⠶⠤⠀⢀⠶⢄⠀
        ⠀⡀⠀⠃⠀⠀⠰⠯⠧⠤⠀⢂⣘⡷⢤⠀⠈⠀⠁⢠⣈⠿⡄⠀⠀
        ⡐⠀⠀⠀⠀⠀⠀⠀⠀⠄⣢⠸⠯⢓⣞⣣⠗⠀⠒⠚⠚⠛⠋⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠰⠘⠈⠀⠀⠀⠶⠶⠀⠃⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢁⠀⠀
        ⠀⠀⠀⠀⠀⠀⡔⠈⠉⣉⡉⢐⡒⠀⠴⠄⠀⠀⠀⠀⠴⠀⠊⠂⠀
        ⡀⠀⠀⠀⠀⠀⡁⠶⠖⠶⠖⠨⡥⠀⠘⣛⣛⣙⣛⠛⠛⣀⠀⠀⠀
        ⠘⠒⠤⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠂⠀⠀⠀⠀⠀
        ⠀⠀⠈⠀⠂⠹⠀⠀⢾⡿⠻⠶⣿⣿⠟⠖⠂⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣦⡀⠀⠀⠀⠀
        `);
    } else {
        asuka.style.display = "none";
    }
});

function deleteAsuka() {
    asuka.style.display = "none";
}