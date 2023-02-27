<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/board.css">
    <style>
        td {
            text-align: left !important;
        }
    </style>
</head>
<body>
    <div id="wrap">
        <h2>게시글 상세보기</h2>
        
            <table>
                <tr>
                    <th>제목</th>
                    <td>${list.notTitle }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>관리자</td>
                </tr>
                <tr>
                    <th>작성시간</th>
                    <td>${list.notDate }</td>
                </tr>
                
                <tr>
                    <th>내용</th>
                    <td><pre>${list.notContent }</pre></td>
                </tr>
            </table>
            <input class="btn" type="submit" value="새글 작성" onclick="location.href='BoardServlet?command=board_write_form'">
            <input class="btn" type="reset" value="글 수정">
            <input class="btn" type="button" value="글 삭제">
            <input class="btn" type="button" value="목록으로" onclick="location.href='BoardServlet?command=board_list'">
        
    </div>
</body>
</html>