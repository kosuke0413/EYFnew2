<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
        text-align: center;
        max-width: 500px;
        width: 100%;
    }
    h2 {
        color: #444;
        border-bottom: 2px solid #ddd;
        padding-bottom: 10px;
    }
    p {
        font-size: 18px;
        margin: 20px 0;
    }
    a {
        display: inline-block;
        margin: 10px 0;
        padding: 10px 20px;
        background-color: #444;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s;
    }
    a:hover {
        background-color: #555;
    }
    .image-upload {
        margin: 20px 0;
    }
    .image-upload input[type="file"] {
        display: none;
    }
    .image-upload label {
        display: inline-block;
        padding: 10px 20px;
        background-color: #444;
        color: #fff;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    .image-upload label:hover {
        background-color: #555;
    }
    .image-upload button {
        display: inline-block;
        margin-top: 10px;
        padding: 10px 20px;
        background-color: #444;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    .image-upload button:hover {
        background-color: #555;
    }
</style>
</head>
<body>
<div class="container">
    <h2>成績管理</h2>
    <p>登録が完了しました</p>
    <a href="TestRegist.action">戻る</a>
    <a href="TestList.action">成績参照</a>
    <div class="image-upload">
        <form action="UploadImage.action" method="post" enctype="multipart/form-data">
            <input type="file" name="file" id="file">
            <label for="file">画像をアップロード</label>
            <button type="submit">アップロード</button>
        </form>
    </div>
</div>
</body>
</html>
