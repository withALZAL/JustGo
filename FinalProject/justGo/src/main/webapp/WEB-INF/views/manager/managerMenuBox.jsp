<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>manager--statisticsBox</title>

    <link rel="stylesheet" href="/resources/css/manager/managerMenuBox.css">
</head>
<body>
    
    <div class="manager--sidebar">
        <div class="manager--menu">
            <a href="/manager/managerDashboard"><i class="fa-solid fa-paper-plane"></i>대시보드</a>
            <a href="/manager/memberManager"><i class="fa-solid fa-address-book"></i>회원관리</a>
            <a href="/manager/manager"><i class="fa-solid fa-crown"></i></i>운영관리</a>
            <a href="/manager/askManager"><i class="fa-solid fa-comments"></i>1:1문의</a>
            <a href="/manager/reportManager"><i class="fa-solid fa-clipboard"></i>신고관리</a>
        </div>
        <div class="manager-logoutBtn">
            <form>
                <a href="/account/logout" id="logoutBtn">
                    <%-- <button type="button" class="btn btn-secondary btn-sm">로그아웃</button> --%>
                    <i class="fa-solid fa-right-to-bracket fa-xl"></i>
                </a>
            </form>
        </div>
    </div>

</body>
</html>