
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>得点管理システム</title>
</head>
<c:import url="../common/header.jsp"/>
<body>
<c:import url="../common/navigation.jsp"/>
<h2>メニュー</h2>

<a href="StudentList.action">学生管理</a>
<a href="TestRegist.action">成績登録</a>
<a href="TestList.action">成績参照</a>
<a href="SubjectList.action">科目管理</a>
<a href="../Logout.action">ログアウト</a>

</body>
<c:import url="../common/footer.jsp"/>
</html>
