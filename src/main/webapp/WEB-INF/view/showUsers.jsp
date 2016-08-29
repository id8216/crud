<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

                <c:if test="${pageCount == 0}">
                    <h2 align="center">В списке нет пользователей!</h2>
                </c:if>

                <c:if test="${pageCount > 0}">
                    <c:if test="${!empty page}">
                        <p><h2>Список пользователей</h2></p>
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
                            <c:forEach var="user" items="${page}">
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
                </c:if>

                <br/>

                <c:if test="${!empty page}">
                    <table class="table-pages">
                        <tr>
                            <td><a class="tablelink" href="<c:url value="/showUsers/${0}"/>"><<</a></td>
                            <td></td>
                            <c:forEach items="${refs}" var="count">
                                <td>
                                    <a class="tablelink" href="<c:url value="/showUsers/${count.intValue()}"/>">${count.intValue() + 1}</a>
                                </td>
                            </c:forEach>
                            <td></td>
                            <td><a class="tablelink" href="<c:url value="/showUsers/${pageCount - 1}"/>">>></a></td>
                        </tr>
                    </table>
                </c:if>

            </div>

            <div class="pagelink-center">
                <a class="pagelink link" href="<c:url value="/addUser"/>">Добавить <br> пользователя</a>
                <a class="pagelink link" href="<c:url value="/searchName"/>">Искать <br> по имени</a>
                <a class="pagelink link" href="<c:url value="/searchAdmin"/>">Искать <br> админов</a>
            </div>

        </div>
    </main>
</body>
</html>