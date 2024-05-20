<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成績管理</title>
<style>
    body {
        font-family: 'Georgia', serif;
        background-color: #f5f5f5;
        color: #333;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .container {
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        max-width: 800px;
        width: 100%;
    }
    h2 {
        color: #444;
        border-bottom: 2px solid #ddd;
        padding-bottom: 10px;
        margin-bottom: 20px;
    }
    form {
        margin: 20px 0;
    }
    label {
        display: block;
        margin: 10px 0 5px;
        color: #555;
        font-weight: bold;
    }
    select, input[type="text"], input[type="number"], button {
        display: block;
        margin-bottom: 20px;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ddd;
        border-radius: 5px;
        width: 100%;
        box-sizing: border-box;
    }
    button {
        background-color: #444;
        color: #fff;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    button:hover {
        background-color: #555;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: left;
    }
    th {
        background-color: #444;
        color: #fff;
    }
    td {
        background-color: #f9f9f9;
    }
    .table-hover tr:hover td {
        background-color: #e3e3e3;
    }
    .error {
        color: red;
        font-size: 14px;
    }
</style>
</head>
<body>
<div class="container">
    <h2>成績管理</h2>
    <form method="get" action="TestRegist.action">
        <label>入学年度</label>
        <select name="f1">
            <option value="0">--------</option>
            <c:forEach var="year" items="${ent_year_set}">
                <option value="${year}" <c:if test="${year == f1}">selected</c:if>>${year}</option>
            </c:forEach>
        </select>
        <label>クラス</label>
        <select name="f2">
            <option value="0">--------</option>
            <c:forEach var="num" items="${class_num_set}">
                <option value="${num}" <c:if test="${num == f2}">selected</c:if>>${num}</option>
            </c:forEach>
        </select>
        <label>科目</label>
        <select name="f3">
            <option value="0">--------</option>
            <c:forEach var="subject" items="${subject_set}">
                <option value="${subject.cd}" <c:if test="${subject.cd == f3}">selected</c:if>>${subject.name}</option>
            </c:forEach>
        </select>
        <label>回数</label>
        <select name="f4">
            <option value="0">--------</option>
            <c:forEach var="num" items="${no_set}">
                <option value="${num}" <c:if test="${num == f4}">selected</c:if>>${num}</option>
            </c:forEach>
        </select>
        <button>検索</button>
        <div class="error">${errors.get("f1")}</div>
    </form>
    <c:choose>
        <c:when test="${tests.size() > 0}">
            <h2>科目：${f3}（${f4}回）</h2>
            <form method="post" action="TestRegistExecute.action">
                <table class="table table-hover">
                    <tr>
                        <th>入学年度</th>
                        <th>クラス</th>
                        <th>学生番号</th>
                        <th>氏名</th>
                        <th>点数</th>
                    </tr>
                    <c:forEach var="test" items="${tests}">
                    <tr>
                        <td>${test.student.entYear}</td>
                        <td>${test.classNum}</td>
                        <td>${test.student.no}</td>
                        <td>${test.student.name}</td>
                        <td>
                            <input type="number" name="point_${test.student.no}" value="${test.point}" min="0" max="100"/>
                            <div class="error">${errors.get("test_error")}</div>
                        </td>
                    </tr>
                    </c:forEach>
                </table>
                <input type="hidden" name="f1" value="${f1}"/>
                <input type="hidden" name="f2" value="${f2}"/>
                <input type="hidden" name="f3" value="${f3}"/>
                <input type="hidden" name="f4" value="${f4}"/>
                <button type="submit">登録して終了</button>
            </form>
        </c:when>
    </c:choose>
</div>
</body>
</html>
