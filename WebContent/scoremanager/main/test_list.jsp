<%-- 科目一覧JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成績参照システム</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h1>成績参照</h1>

    <h3>科目情報</h3>
    <form action="TestListSubjectExecute.action" method="post">
        <label>入学年度</label>
        <select name="ent_year" required>
            <option value="0">--------</option>
            <c:forEach var="year" items="${ent_year_set}">
                <option value="${year}" <c:if test="${year==f1}">selected</c:if>>${year}</option>
            </c:forEach>
        </select>

        <label>クラス</label>
        <select name="class_num" required>
            <option value="0">--------</option>
            <c:forEach var="num" items="${class_num_set}">
                <option value="${num}" <c:if test="${num==f2}">selected</c:if>>${num}</option>
            </c:forEach>
        </select>

        <label>科目</label>
        <select name="subject_num" required>
            <option value="0">--------</option>
            <c:forEach var="sub" items="${subject_list_set}">
                <option value="${sub.getCd()}" <c:if test="${sub.getCd()==f3}">selected</c:if>>${sub.getName()}</option>
            </c:forEach>
        </select>
        <div class="btn-wrap">
            <input type="submit" value="検索" class="btn btn-c">
        </div>
    </form>

    <h3>学生情報</h3>
    <form action="TestListStudentExecute.action" method="post">
        <label>学生番号</label>
        <input type="text" name="no"
            placeholder="学生番号を入力してください" maxlength="10" value="${no}" required />
        <div>${errors.get("no")}</div>
        <div class="btn-wrap">
            <input type="submit" value="検索" class="btn btn-c">
        </div>
    </form>

    <c:if test="${not empty test_students}">
        <p>${stu_name}</p>
        <c:choose>
            <c:when test="${test_students.size()>0}">
                <div>検索結果：${test_students.size()}件</div>

                <table class="table table-hover">
                    <tr>
                        <th>科目名</th>
                        <th>科目コード</th>
                        <th>回数</th>
                        <th>点数</th>
                        <th></th>
                        <th></th>
                    </tr>
                    <c:forEach var="student" items="${test_students}">
                        <tr>
                            <td>${student.subjectName}</td>
                            <td>${student.subjectCd}</td>
                            <td>${student.num}</td>
                            <td>${student.point}</td>
                            <td class="text-center"></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <div>学生情報が存在しませんでした</div>
            </c:otherwise>
        </c:choose>
    </c:if>
    <div>${errors.get("nullpo")}</div>
    <div>${errors.get("nullpo2")}</div>

    <c:if test="${not empty test_subjects}">
        <p>${sub_name}</p>
        <c:choose>
            <c:when test="${not empty test_subjects[0].studentNo}">
                <div>検索結果：${test_subjects.size()}件</div>

                <table class="table table-hover">
                    <tr>
                        <th>入学年度</th>
                        <th>クラス</th>
                        <th>学生番号</th>
                        <th>氏名</th>
                        <th>1回</th>
                        <th>2回</th>
                    </tr>
                    <c:forEach var="subject" items="${test_subjects}">
                        <tr>
                            <td>${subject.entYear}</td>
                            <td>${subject.classNum}</td>
                            <td>${subject.studentNo}</td>
                            <td>${subject.studentName}</td>
                            <td>${subject.getPoint(1)}</td>
                            <td>${subject.getPoint(2)}</td>
                            <td class="text-center"></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <div>学生情報が存在しませんでした</div>
            </c:otherwise>
        </c:choose>
    </c:if>

    <div class="btn-wrap">
        <a href="Menu.action" class="btn btn-c"><i class="fas fa-arrow-left"></i> 戻る</a>
    </div>
</body>
</html>