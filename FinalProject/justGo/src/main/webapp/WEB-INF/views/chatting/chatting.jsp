<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<%-- css --%>
    <link rel="stylesheet" href="/resources/css/chatting/chatting.css">

    <title>JustGo-chatting</title>

<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/resources/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<!-- fontAwesome -->
    <script src="https://kit.fontawesome.com/ae1a88d4e2.js" crossorigin="anonymous"></script>

</head>
<body>
    <section class="chatting--container">
        <div class="chatting--box">
            <section class="chatting--top">
                <section class="chatting--chatBox">1</section>
                <section class="chatting--memberBox">2</section>
            </section>
            <section class="chatting--inputBox">
                <div class="inputBox--temp">
                    <textarea class="inputMessage" max="500" placeholder="채팅 내용을 입력해주세요.(최대 500자)"></textarea>
                    <div class="btnBox">
                        <button type="button" class="btn btn-primary btn-sm">전송</button>
                        <button type="button" class="btn btn-primary btn-sm">취소</button>
                    </div>
                </div>
            </section>
        </div>
    </section>

<!-- bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>