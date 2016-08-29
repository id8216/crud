<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <title>Ivan Dibrova - CRUD Application</title>
    <link type="text/css" rel="stylesheet" href="<c:url value="/css/main.css" />" />
</head>
<body>
    <main>
        <div class="container">
            <div class="container-header">
                CRUD Application
            </div>
            <div class="inner">
                <h2>Автор - Иван Диброва</h2>
                <p>
                    <h3>Тестовое задание </h3> <br>
                    Необходимо реализовать стандартное  <br>
                    crud приложение, которое отображает  <br>
                    список всех юзеров в базе (с пейджингом).  <br>
                    С возможностью их удаления, редактирования,  <br>
                    добавления новых и поиском по уже существующим. <br>
                </p>
                <a class="mainlink link" href="<c:url value="/showUsers" />">Запуск</a>
            </div>
        </div>
    </main>
</body>
</html>