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
// const input = document.getElementById('query');
// const asuka = document.getElementById('asuka');
// let intervalId = null;
// input.addEventListener("input", e => {
//     var query = e.target.value;
//     if (query === "아스카") {
//         asuka.style.display = "inline";
//         startGrowing();
//         const Toast = Swal.mixin({
//             toast: true,
//             position: 'top-end', /* 우측 상단 */
//             showConfirmButton: false, /* 컨펌버튼 없음 */
//             timer: 3000, /* 3초 간 뜨기 */
//             timerProgressBar: true, /* 진행바 */
//             showCloseButton: true, /* 취소 버튼 */
//             didOpen: (toast) => {
//                 toast.addEventListener('mouseenter', Swal.stopTimer)
//                 toast.addEventListener('mouseleave', Swal.resumeTimer)
//             }
//             })
    
//             Toast.fire({
//                 title: `
//                 ⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//                 ⠀⠀⠀⠀메롱⠀⠀⢀⠀⠐⢤⠐⠈⠀⠀⠈⠀⠀⠀⠀⠀⠀
//                 ⠀⠀⠀⠀⡐⠀⠀⠐⠉⠀⠀⠀⠉⠂⢧⠀⠀⠒⠂⠀⠠⠀⠀⠀⠀
//                 ⠀⠀⠀⡐⠀⠀⠀⠀⢠⡆⡞⠦⠙⠛⠁⠿⣤⡐⠶⠤⠀⢀⠶⢄⠀
//                 ⠀⡀⠀⠃⠀⠀⠰⠯⠧⠤⠀⢂⣘⡷⢤⠀⠈⠀⠁⢠⣈⠿⡄⠀⠀
//                 ⡐⠀⠀⠀⠀⠀⠀⠀⠀⠄⣢⠸⠯⢓⣞⣣⠗⠀⠒⠚⠚⠛⠋⠀⠀
//                 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠰⠘⠈⠀⠀⠀⠶⠶⠀⠃⠀⠀⠀
//                 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢁⠀⠀
//                 ⠀⠀⠀⠀⠀⠀⡔⠈⠉⣉⡉⢐⡒⠀⠴⠄⠀⠀⠀⠀⠴⠀⠊⠂⠀
//                 ⡀⠀⠀⠀⠀⠀⡁⠶⠖⠶⠖⠨⡥⠀⠘⣛⣛⣙⣛⠛⠛⣀⠀⠀⠀
//                 ⠘⠒⠤⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠂⠀⠀⠀⠀⠀
//                 ⠀⠀⠈⠀⠂⠹⠀⠀⢾⡿⠻⠶⣿⣿⠟⠖⠂⠀⠀⠀⠀⠀⠀⠀⠀
//                 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣦⡀⠀⠀⠀⠀
//                 ` /* 메시지 담기 */
//             })
//     } else {
//         stopGrowing();
//         asuka.style.display = "none";
//     }
// });
// function startGrowing() {
//     intervalId = setInterval(function() {
//         let width = asuka.clientWidth;
//         let height = asuka.clientHeight;
//         asuka.style.width = `${width + 10}px`;
//         asuka.style.height = `${height + 10}px`;
//         asuka.style.transform = `rotate(${width + height}deg)`;
//     }, 100);
// }
// function stopGrowing() {
//     clearInterval(intervalId);
// }
// function deleteAsuka() {
//     stopGrowing();
//     asuka.style.display = "none";
//     const Toast = Swal.mixin({
//         toast: true,
//         position: 'top-end', /* 우측 상단 */
//         showConfirmButton: false, /* 컨펌버튼 없음 */
//         timer: 3000, /* 3초 간 뜨기 */
//         timerProgressBar: true, /* 진행바 */
//         showCloseButton: true, /* 취소 버튼 */
//         didOpen: (toast) => {
//             toast.addEventListener('mouseenter', Swal.stopTimer)
//             toast.addEventListener('mouseleave', Swal.resumeTimer)
//         }
//         })

//         Toast.fire({
//             title: `
//             ⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//             ⠀⠀속았징?  ⢀⠀⠐⢤⠐⠈⠀⠀⠈⠀⠀⠀⠀⠀⠀
//             ⠀⠀⠀⠀⡐⠀⠀⠐⠉⠀⠀⠀⠉⠂⢧⠀⠀⠒⠂⠀⠠⠀⠀⠀⠀
//             ⠀⠀⠀⡐⠀⠀⠀⠀⢠⡆⡞⠦⠙⠛⠁⠿⣤⡐⠶⠤⠀⢀⠶⢄⠀
//             ⠀⡀⠀⠃⠀⠀⠰⠯⠧⠤⠀⢂⣘⡷⢤⠀⠈⠀⠁⢠⣈⠿⡄⠀⠀
//             ⡐⠀⠀⠀⠀⠀⠀⠀⠀⠄⣢⠸⠯⢓⣞⣣⠗⠀⠒⠚⠚⠛⠋⠀⠀
//             ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠰⠘⠈⠀⠀⠀⠶⠶⠀⠃⠀⠀⠀
//             ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢁⠀⠀
//             ⠀⠀⠀⠀⠀⠀⡔⠈⠉⣉⡉⢐⡒⠀⠴⠄⠀⠀⠀⠀⠴⠀⠊⠂⠀
//             ⡀⠀⠀⠀⠀⠀⡁⠶⠖⠶⠖⠨⡥⠀⠘⣛⣛⣙⣛⠛⠛⣀⠀⠀⠀
//             ⠘⠒⠤⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠂⠀⠀⠀⠀⠀
//             ⠀⠀⠈⠀⠂⠹⠀⠀⢾⡿⠻⠶⣿⣿⠟⠖⠂⠀⠀⠀⠀⠀⠀⠀⠀
//             ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣦⡀⠀⠀⠀⠀
//             ` /* 메시지 담기 */
//     })
// }