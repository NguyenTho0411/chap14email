<%-- 
    Document   : thanks.jsp
    Created on : Nov 5, 2024, 7:50:09 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>22110237_Nguyen Huu Duc Tho</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>    
</head>

<body>
    <h1>Thanks for joining our email list</h1>

    <p>Here is the information that you entered:</p>

    <label>Email:</label>
    <span>${user.email}</span><br>
    <label>First Name:</label>
    <span>${user.firstName}</span><br>
    <label>Last Name:</label>
    <span>${user.lastName}</span><br>

    <p>To enter another email address, click on the Back 
    button in your browser or the Return button shown 
    below.</p>

    <form action="" method="post">
        <input type="hidden" name="action" value="join">
        <input type="submit" value="Return">
    </form>

    <p><i>${errorMessage}</i></p>
    
</body>
</html>