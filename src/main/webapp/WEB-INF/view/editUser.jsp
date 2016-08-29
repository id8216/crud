<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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

                <c:url var="editAction" value="/showUsers/edit"/>

                <form:form action="${editAction}" commandName="user">

                    <h2>Редактирование пользователя</h2>

                    <div class="addedit">
                        <div class="addname">
                            <form:label path="id">
                                <spring:message text="ID"/>
                            </form:label>
                        </div>
                        <div class="addinput">
                            <form:input path="id" readonly="true" size="8" disabled="true"/>
                            <form:hidden path="id"/>
                        </div>
                    </div>


                    <div class="addedit">
                        <div class="addname">
                            <form:label path="name">
                                <spring:message text="Имя пользователя"/>
                            </form:label>
                        </div>
                        <div class="addinput">
                            <form:input path="name" type="text" id="name"/>
                        </div>
                        <div class="addinput">
                            <form:errors path="name"/>
                        </div>
                    </div>

                    <div class="addedit">
                        <div class="addname">
                            <form:label path="age">
                                <spring:message text="Возраст"/>
                            </form:label>
                        </div>
                        <div class="addinput">
                            <form:input path="age" />
                        </div>
                        <div class="addinput">
                            <form:errors path="age"/>
                        </div>
                    </div>

                    <div class="addedit">
                        <div class="addname">
                            <form:label path="admin">
                                <spring:message text="Администратор"/>
                            </form:label>
                        </div>
                        <div>
                            <form:checkbox path="admin"/>
                        </div>
                    </div>

                    <div class="addedit">
                        <input type="submit"  class="editbutton" value="<spring:message text="Редактировать пользователя"/>"/>
                    </div>

                </form:form>

            </div>

            <div class="pagelink-center">
                <a class="pagelink link" href="<c:url value="/showUsers"/>">Список <br> пользователей</a>
                <a class="pagelink link" href="<c:url value="/searchName"/>">Искать <br> по имени</a>
                <a class="pagelink link" href="<c:url value="/searchAdmin"/>">Искать <br> админов</a>
            </div>

        </div>
    </main>
</body>
</html>
