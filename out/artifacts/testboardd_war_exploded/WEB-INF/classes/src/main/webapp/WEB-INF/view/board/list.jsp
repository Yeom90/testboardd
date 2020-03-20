<%--
  Created by IntelliJ IDEA.
  User: kbsjob
  Date: 2020-03-13
  Time: 오후 4:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
  <head>
    <title>게시물</title>
  </head>
  <body>

    <!-- 게시판 레이아웃 -->
    <section>
          <div>
                <table>
                  <tr>
                      <th>제목</th>
                      <th>작성자</th>
                      <th>작성시간</th>
                      <th>조회수</th>
                  </tr>
                  <c:forEach items="${board}" var="board">
                      <tr>
                          <td>${board.bno}</td>
                          <td><a href="/board/read?boardNo=${board.bno}">${board.title}</a></td>
                          <td><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd a HH:mm"/> </td>
                          <td>${board.hit}</td>
                      </tr>
                  </c:forEach>
                </table>
          </div>
          <div>
              <a href="${path}/board/write">
                  <button type="button" id="writeBtn">글쓰기</button>
              </a>
          </div>
    </section>
  <%@include file="../include/plugIn.jsp"%>
  </body>
    <script>

    </script>
</html>
