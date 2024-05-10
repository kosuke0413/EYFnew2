<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>成績登録</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background: linear-gradient(to right, #6a11cb 0%, #2575fc 100%);
        color: #fff;
        margin: 0;
        padding: 20px;
    }
    .container {
        background: white;
        color: #333;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin: auto;
        width: 80%;
        transition: transform 0.3s ease-in-out;
    }
    .container:hover {
        transform: scale(1.03);
    }
    h2 {
        text-align: center;
        color: #333;
    }
    .form-group {
        margin-bottom: 15px;
    }
    label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }
    select, .input {
        width: 100%;
        padding: 8px;
        border-radius: 4px;
        border: 2px solid #ddd;
        transition: all 0.3s;
    }
    select:hover, .input:hover {
        border-color: #6a11cb;
    }
    button {
        width: 100%;
        padding: 10px;
        border-radius: 4px;
        border: none;
        background-color: #2575fc;
        color: white;
        cursor: pointer;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        transition: background-color 0.3s, transform 0.2s;
    }
    button:hover {
        background-color: #6a11cb;
        transform: translateY(-2px);
    }
    .table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    .table, .table th, .table td {
        border: 1px solid #ddd;
        background: #f8f8f8;
        transition: background-color 0.3s;
    }
    .table th, .table td {
        padding: 10px;
        text-align: left;
    }
    .table tr:hover {
        background-color: #f1f1f1;
    }
    .error {
        color: red;
        font-weight: bold;
        text-align: center;
        margin-top: 20px;
    }
    @media (max-width: 768px) {
        .container {
            width: 95%;
            padding: 10px;
        }
        select, .input, button {
            font-size: 14px;
        }
        .form-group {
            margin-bottom: 10px;
        }
    }
</style>
</head>
<body>
<div class="container">
    <h2>成績登録</h2>
    <form method="get" class="form">
        <div class="form-group">
            <label>入学年度</label>
            <select name="f1" class="select">
                <option value="0">--------</option>
                <c:forEach var="year" items="${ent_year_set}">
                    <option value="${year}" ${year == f1 ? 'selected' : ''}>${year}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>クラス</label>
            <select name="f2" class="select">
                <option value="0">--------</option>
                <c:forEach var="num" items="${class_num_set}">
                    <option value="${num}" ${num == f2 ? 'selected' : ''}>${num}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>科目</label>
            <select name="f3" class="select">
                <option value="0">--------</option>
                <c:forEach var="subject" items="${subject_set}">
                    <option value="${subject.cd}" ${subject.cd == f3 ? 'selected' : ''}>${subject.name}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>回数</label>
            <select name="f4" class="select">
                <option value="0">--------</option>
                <c:forEach var="num" items="${no_set}">
                    <option value="${num}" ${num == f4 ? 'selected' : ''}>${num}</option>
                </c:forEach>
            </select>
        </div>

        <button type="submit">検索</button>
    </form>

    <c:choose>
        <c:when test="${tests.size() > 0}">
            <h2>科目：${subject.getName()}（${num}回）</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th>入学年度</th>
                        <th>クラス</th>
                        <th>学生番号</th>
                        <th>氏名</th>
                        <th>点数</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="test" items="${tests}">
                        <tr>
                            <td>${test.getStudent().getEntYear()}</td>
                            <td>${test.class_num}</td>
                            <td>${test.student_no}</td>
                            <td>${test.getStudent().getName()}</td>
                            <td><input type="text" name="point_${test.student_no}" value="${test.point}" class="input"></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <button type="submit">登録して終了</button>
        </c:when>
        <c:otherwise>
            <div class="error"><c:if test="${tests == null}">検索してください</c:if></div>
            <div class="error"><c:if test="${tests.size() == 0}">成績情報が存在しませんでした</c:if></div>
        </c:otherwise>
    </c:choose>
    <a href="Menu.action">戻る</a>
</div>
</body>
</html>
