<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${boardTypeList}" var="boardType">
    <c:if test="${boardType.BOARD_CODE == boardCode}" >
        <c:set var="boardName" value="${boardType.BOARD_NAME}"/>
    </c:if>
</c:forEach>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- css -->
    <link rel="stylesheet" href="/resources/css/template/template.css"> <!-- 문서 기본 화면 배치/기본 폰트 등 기본 설정 -->
    <link rel="stylesheet" href="/resources/css/common/header.css">
    <link rel="stylesheet" href="/resources/css/common/main.css">
    <link rel="stylesheet" href="/resources/css/common/footer.css">
    <link rel="stylesheet" href="/resources/css/writing/writingBoard.css">

    <!-- summerNote css 추가  -->
    <link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">


    <title>${boardName}</title>

<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<!-- fontAwesome -->
    <script src="https://kit.fontawesome.com/ae1a88d4e2.js" crossorigin="anonymous"></script>
<%-- sweetAlert2 --%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body class="template--body">

<!-- ----------------------------------------------- -->
<!-- Template-header 시작 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- Template-header 끝 -->
<!-- ----------------------------------------------- -->


<!-- Template-main 시작 -->
<main class="template--main">
<aside class="template--leftAside"></aside>
<section class="template--Section">



<!-- 페이지 제목 시작 -->
<div class="template--pageTitleContainer">
    <div class="template--pageTitleBox">
        <img src="/resources/images/officialPageTitle/PAGETITLE_WRITING.png" alt="글수정">
        <div class="template--overlayedTitle">글수정</div>
    </div>
</div>
<!-- 페이지 제목 끝 -->



<!-- 콘텐츠 시작 -->
<form action="update" method="post" id="wirteUpdateFrm" enctype="multipart/form-data">
    <div class="writing--contentContainer">
        <div class="writing--contentBox">
            <div class="writing--inputTitle">
                <div>제목</div>
                <div><input type="text" name="boardTitle" placeholder="제목을 입력해주세요." maxlength="40" value="${board.boardTitle}" autocomplete="off"></div>
                <div class="writing--selectorBox">
                    <select class="writing--boardSelector" name="boardCode" id="boardSelect"  required>
                        <c:forEach items="${typeList}" var="board2">
                            <option class="b" value="${board2.boardCode}">${board2.boardName}</option>
                       <!-- <option value="2" class="b" >자유게시판</option>
                        <option value="3" class="b">질문게시판</option> -->
                        </c:forEach>
                        <c:forEach items="${typeList2}" var="board1">
                            <option value="${board1.countryNo}">${board1.countryName}게시판</option>
                           <!-- <option value="1">중국게시판</option>
                            <option value="3">베트남게시판</option>
                            <option value="4">태국게시판</option>
                            <option value="5">호주게시판</option> -->
                        </c:forEach>
                    </select>
                    <select class="writing--tagSelector" name="tagNo" id="tagSelector" required>
                        <c:forEach items="${typeList3}" var="tag">
                            <option value="${tag.tagNo}">${tag.tagContent}</option>
                        </c:forEach>
                        <!-- <option value="1">일반</option>
                        <option value="3">꿀팁</option>
                        <option value="2">맛집</option>
                        <option value="4">힐링</option> -->
                    </select>
                </div>
            </div>
        <div class="writing--inputContentBox">
                                                                                        <%-- 빈틈없이 pre태그 처럼 띄어쓰기도 같이 들어감 --%>
            <textarea class="writing--summernoteBox" id="summernote" name="boardText">${board.boardText}</textarea>
                    
                <div class="writing--ButtonBox">
                
                    <button type="submit" id="updateBtn" class="btn btn-primary btn-lg" style="border: none;">수정</button>
                    <button type="button" class="btn btn-secondary btn-lg" style="border: none;" onclick="history.back()">취소</button>
                </div>
        </div>
    </div>
</div>


<input type="hidden" name="thumbnail" id="thumbnail">
</form>
<!-- 콘텐츠 끝 -->


</section>
<aside class="template--rightAside"></aside>
</main>
<!-- Template-main 끝 -->


<!-- ----------------------------------------------- -->
<!-- Template-footer 시작 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<!-- Template-footer 끝 -->
<!-- ----------------------------------------------- -->
<script>
    const boardCode = '${boardCode}';

    const countryNo = '${countryNo}';

    const tagContent = '${board.tagContent}';



</script>

<!-- bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- summerNote script 추가 -->
    <script src="/resources/js/summernote/summernote-lite.js"></script>
    <!-- summerNote script 추가 -->
    <script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>

<!-- js -->
    <script src="/resources/js/template/template.js"></script>
    <script src="/resources/js/common/header.js"></script>
    <script src="/resources/js/common/main.js"></script>
    <script src="/resources/js/common/footer.js"></script>
    <script src="/resources/js/writing/writingBoard.js"></script>
    <script src="/resources/js/writing/writingUpdate.js"></script>

<%-- summernote --%>
    <script>
        $('#summernote').summernote({
        placeholder: '여기에 내용을 작성해주세요.',
        tabsize: 2,
        height: 500,
        width : 1100,
        focus: true, /* 화면 auto-focus on */
        disableResizeEditor: true, /* resize off */
        toolbar: [ /* 썸머노트 상단 툴바 설정 */
            ["style", ["style"]],
            ["font", ["bold", "italic", "underline", "fontname","fontsize"]],
            ["color", ["color"]],
            ["insert", ["link", "picture"]],
            ["view", ["codeview", 'help']]
            ],
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
            fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50'],
                callbacks: { // callback : 일을 받으면 그 일(함수)을 처리해서 답변 하겠다.
                onImageUpload : function(files, editor, welEditable){ // 이미지가 업로드 되었을때 
                    console.log(files); // 업로드한 이미지 파일
                    console.log(editor); //  내용,스타일,포커스를 제어하는 사용 
                    console.log(welEditable); // 이미지 파일과 내용을 가져오거나 수정할 수 있는 코드
                    console.log(this);
                    
                   // 파일 업로드(다중업로드를 위해 반복문 사용)
                    for (var i = files.length - 1; i >= 0; i--) {
                        uploadSummernoteImageFile(files[i],this); // 함수 (호출) 선언된 함수을 쓴다 /선언/ 정의 /호출   
                    }
                }
            } 
        });
    </script>


    <%-- summernote 이미지 ajax 전송 처리 --%>
    <script>
        function uploadSummernoteImageFile(file, el) { // file(업로드할 이미지파일 객체)과 el(summernote 에디터 객체)의 매개변수를 받아온다
        // 함수 선언                                    { 중괄호 안쪽이 정의}            

            var data = new FormData();	//form 태그가 데이터를 제출할 때의 모양을 그대로 따르는 객체
            data.append("file",file);  // FormData 객체에 'file' 변수에 저장된 이미지 파일을 추가

            $.ajax({
                url: '/writing/uploadImage',
                type: "POST",
                enctype: 'multipart/form-data', 
                data: data, // FormData 객체
                cache: false,
                contentType : false,
                processData : false,
                success : function(result) { // 요청이 성공적으로 실행되고 응답왔을 때 
                    console.log(result); // 저장된 이미지의 웹 접근 경로
                    $(el).summernote('editor.insertImage',result);
                },
                error : function(e) { // 함수 요청이 실패한 경우 호출,'e' 매개변수로 에러 정보를 받음
                    console.log(e);
                }
            });
        }
            
    </script>

            
</body>
</html>