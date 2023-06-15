/* 파일 업로드 */
const imageUpload = document.getElementById("imageUpload");
const previewImage = document.getElementById("previewImage");
const uploadedImage = previewImage.querySelector("img");
const updateImageBtn = document.getElementById("updateImgBtn");

/* 숨겨진 파일 업로드 자동 눌리기 */
function triggerFileInput() {
    var fileInput = document.getElementById("imageUpload");
    fileInput.click();
    imageUpload.click();
}

/* 업로드된 이미지 미리보기 */
imageUpload.addEventListener("change", function (event) {
    const file = event.target.files[0];
    const reader = new FileReader();
    reader.onload = function (e) {
        uploadedImage.src = e.target.result;
        updateImgBtn.style.display = "inline"; // 이미지 변경 버튼 표시
    };
    reader.readAsDataURL(file);
});
