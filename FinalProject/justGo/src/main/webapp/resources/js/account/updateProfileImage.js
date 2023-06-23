/* 파일 업로드 */
const uploadImage = document.getElementById("uploadImage");
const previewImageBox = document.getElementById("previewImageBox");
const previewImage = previewImageBox.querySelector("img");
const updateImageBtn = document.getElementById("updateImageBtn");
const deleteImageBtn = document.getElementById("deleteImageBtn");

/* 숨겨진 파일 업로드 자동 눌리기 */
function triggerFileInput() {
    uploadImage.click();
}

/* 업로드된 이미지 미리보기 */
uploadImage.addEventListener("change", function (event) {
    const file = event.target.files[0];
    const reader = new FileReader();

    reader.onload = function (e) {
        previewImage.src = e.target.result;
        updateImageBtn.style.display = "inline-block";
        deleteImageBtn.style.display = "inline-block";
    };

    reader.readAsDataURL(file);
});

/* 취소 버튼 클릭 시 이미지 초기화 */
function cancelImage() {
    // 이전 이미지로 변경
    previewImage.src = profileImageSrc;

    // 업로드된 이미지 초기화
    uploadImage.value = "";

    // 버튼 숨김 처리
    updateImageBtn.style.display = "none";
    deleteImageBtn.style.display = "none";
}