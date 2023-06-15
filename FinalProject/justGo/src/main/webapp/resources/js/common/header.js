/* 인사말 */
const greetings = [
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
const randomIndex = Math.floor(Math.random() * greetings.length);

// 랜덤 인사말
window.addEventListener('load', () => {
    greetingElement.innerText = greetings[randomIndex];
});