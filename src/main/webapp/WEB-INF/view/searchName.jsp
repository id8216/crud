<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="false" %>
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

                <h2>Поиск пользователя</h2>

                <c:url var="search" value="searchName"/>

                <form:form action="${search}" commandName="searchUserName">
                    <div>
                        <jsp:text>Введите имя: </jsp:text>
                        <form:input path="searchName"/>
                    </div>
                    <div>
                        <input type="submit"  class="searchbutton" value="<spring:message text="Найти по имени"/>"/>
                    </div>
                </form:form>

                <c:if test="${!empty foundUsers}">
                    <table class="table-users">
                        <tr>
                            <th>ID</th>
                            <th>Имя </th>
                            <th>Возраст</th>
                            <th>Админ</th>
                            <th>Дата</th>
                            <th>Редакт.</th>
                            <th>Удаление</th>
                        </tr>
                        <c:forEach items="${foundUsers}" var="user">
                            <tr>
                                <td>${user.id}</td>
                                <td>${user.name}</td>
                                <td>${user.age}</td>
                                <td>${user.admin}</td>
                                <td align="center"><fmt:formatDate type="both" value="${user.createdDate}"/></td>
                                <td align="center"><a class="tablelink" href="<c:url value="/editUser/${user.id}"/>">Edit</a></td>
                                <td align="center"><a class="tablelink" href="<c:url value="/remove/${user.id}"/>">Delete</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>
            </div>

            <div class="pagelink-center">
                <a class="pagelink link" href="<c:url value="/addUser"/>">Добавить <br> пользователя</a>
                <a class="pagelink link" href="<c:url value="/showUsers"/>">Список <br> пользователей</a>
                <a class="pagelink link" href="<c:url value="/searchAdmin"/>">Искать <br> админов</a>
            </div>

        </div>
    </main>
</body>
</html>
