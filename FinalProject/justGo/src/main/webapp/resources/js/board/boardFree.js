const insertBtn = document.querySelector("#insertBtn");

if (insertBtn != null) {

    insertBtn.addEventListener("click", () => {

        // JS BOM중 location
        //location.htrf = "주소"

        // 해당주소 요청 (GET 방식)

        location.href = `/board2/${location.pathname.split("/")[2]}/insert`;
        //   /board2/1/insert
    })

}