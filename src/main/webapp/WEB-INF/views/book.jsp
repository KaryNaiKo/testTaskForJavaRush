<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Book Page</title>
    <style type="text/css">
        .tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
        .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
        .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
        .tg .tg-4eph{background-color:#f9f9f9}
    </style>
</head>
<body>

<c:url value="/toAddBook" var="url">
    <c:param name="page" value="${page}"/>
</c:url>

<form:form action="${url}" >
    <input type="submit"
           value="<spring:message text="Add Book"/>"/>
</form:form>

<c:url value="/find" var="find">
    <c:param name="page" value="1"/>
    <%--<c:param name="findParam" value="${findParam}"/>--%>
    <%--<c:param name="findParam" value="${findParam}" />--%>
</c:url>
<form:form action="${find}" >
<table>
    <tr>
        <td>
            <input type="submit" value="<spring:message text="Find"/>"/>
        </td>
        <td>
            <%--<form:input path="find"/>--%>
                <input type="text" name="findParam"/>
        </td>
    </tr>
</table>
</form:form>

<%--<form action="main.jsp" method="GET">--%>
    <%--First string <input type="text" name="name">--%>
    <%--<br />--%>
    <%--Second string <input type="text" name="url" />--%>
    <%--<input type="submit" value="ok" />--%>
<%--</form>--%>

<c:if test="${!empty listBooks}">
    <table class="tg">
        <tr>
            <th width="60">ID</th>
            <th width="120">Title</th>
            <th width="120">Description</th>
            <th width="120">Author</th>
            <th width="120">Isbn</th>
            <th width="80">PrintYear</th>
            <th width="80">ReadAlready</th>
            <th width="80">Read</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${listBooks}" var="book">
            <tr>
                <td>${book.id}</td>
                <td>${book.title}</td>
                <td>${book.description}</td>
                <td>${book.author}</td>
                <td>${book.isbn}</td>
                <td>${book.printYear}</td>
                <td>${book.readAlready}</td>

                <td><a href="<c:url value='/read/${book.id}'> <c:param name="page" value="${page}"/> </c:url>">
                    Read
                </a>
                </td>
                <td><a href="<c:url value='/edit/${book.id}'> <c:param name="page" value="${page}"/> </c:url>">
                        Edit
                    </a>
                </td>
                <td><a href="<c:url value='/remove/${book.id}'> <c:param name="page" value="${page}"/> </c:url>" >
                        Delete
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<div align="center" class="panel-footer" style="background-color:#786455" id="pagination">
    <c:url var="addAction" value="/book/add" ></c:url>

    <c:url value="/books/${page-1}" var="prev"></c:url>
    <c:if test="${page > 1}">
        <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
    </c:if>

    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
        <c:choose>
            <c:when test="${page == i.index}">
                <span>${i.index}</span>
            </c:when>
            <c:otherwise>
                <c:url value="/books/${i.index}" var="url"></c:url>
                <a href='<c:out value="${url}" />'>${i.index}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:url value="/books/${page+1}" var="next"></c:url>
    <c:if test="${page + 1 <= maxPages}">
        <a href='<c:out value="${next}" />' class="pn next">Next</a>
    </c:if>
</div>


</body>
</html>
