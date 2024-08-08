<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/sample"
    user="root" password="test1234"/>