<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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


    <title>JustGo-writingBoard</title>

<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<!-- fontAwesome -->
    <script src="https://kit.fontawesome.com/ae1a88d4e2.js" crossorigin="anonymous"></script>
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
        <img src="/resources/images/officialPageTitle/PAGETITLE_WRITING.png" alt="글쓰기">
        <div class="template--overlayedTitle">글쓰기</div>
    </div>
</div>
<!-- 페이지 제목 끝 -->



<!-- 콘텐츠 시작 -->
<form action="/board/write" method="post" enctype="multipart/form-data">
    <div class="writing--contentContainer">
        <div class="writing--contentBox">
            <div class="writing--inputTitle">
                <div>제목</div>
                <div><input type="text" name="boardTitle" placeholder="제목을 입력해주세요." maxlength="40"></div>
                <div class="writing--selectorBox">
                    <select class="writing--boardSelector" name="boardCode" id="boardSelect" onchange="changeSecondSelect()" required>
                        <option value="2" class="b">자유게시판</option>
                        <option value="3" class="b">질문게시판</option>
                        <option value="2">일본게시판</option>
                        <option value="1">중국게시판</option>
                        <option value="3">베트남게시판</option>
                        <option value="4">태국게시판</option>
                        <option value="5">호주게시판</option>
                    </select>
                    <select class="writing--tagSelector" name="tagNo" id="tagSelector" required>
                        <option value="1">일반</option>
                        <option value="3">꿀팁</option>
                        <option value="2">맛집</option>
                        <option value="4">힐링</option>
                    </select>
                </div>
            </div>
        <div class="writing--inputContentBox">
            <textarea class="writing--summernoteBox" id="summernote" name="boardText"></textarea>
                
            </textarea>
        <div class="writing--ButtonBox">
            <a href="/resources/html/common/main.html">
                <button type="submit" class="btn btn-secondary btn-lg" style="background-color: blueviolet;">게시</button>
            </a>
            <a>
                <button type="button" class="btn btn-secondary btn-lg" onclick="history.back()">취소</button>
            </a>
        </div>
    </div>
</div>
</div>
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

<%-- summernote --%>
    <script>
        $(document).ready(function() {
            $('#summernote').summernote();
        });
    </script>
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
            ["font", ["bold", "italic", "underline", "fontname"]],
            ["color", ["color"]],
            ["insert", ["link", "picture"]],
            ["view", ["codeview", 'help']]
            ]
        });
    </script>

    <script> 
                $(document).ready(function(){ 
                    $('#summernote').summernote({ 
                        height : 300, 
                        width : 700, 
                        lang : "ko-KR", 
                        callbacks:{ 
                            onImageUpload : function(files){ 
                            uploadSummernoteImageFile(files[0],this); 
                            } 
                        } 
                    }); 
                    function uploadSummernoteImageFile(file,editor){ 
                        data = new FormData(); 
                        data.append("file",file); 
                        $.ajax({ 
                            data:data, 
                            type:"POST", 
                            url:"/uploadSummernoteImageFile", 
                            dataType:"JSON", 
                            contentType:false, 
                            processData:false, 

                            success:function(data){ 
                                $(editor).summernote("insertImage",data.url); 
                                $("#thumbnailPath").append("<option value="+data.url+">"+data.originName+"</option>"); 
                            } 
                        }); 
                    } 
                }); 
 </script> 
            
</body>
</html>