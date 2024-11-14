<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>22110237_Nguyen Huu Duc Tho</title>
    <style>
        /* Body styles */
        body { 
            font-family: Arial, Helvetica, sans-serif;
            font-size: 85%;
            margin: 2em auto;
            width: 400px;
            background-color: #f9f9f9;
            padding: 20px;
            border: 1px solid #ddd;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* Heading styles */
        h1 {     
            font-size: 140%;
            color: #008080;
            margin-bottom: 1em;
            text-align: center;
        }

        /* Label and span styles */
        label {
            float: left;
            width: 8em;
            margin-bottom: 0.5em;
            font-weight: bold;
            color: #333;
        }

        span {
            display: inline-block;
            margin-left: 0.5em;
            margin-bottom: 0.5em;
            color: #555;
        }

        /* Box for user information */
        .user-info {
            padding: 1em;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
            margin-bottom: 1em;
        }

        /* Submit button styles */
        input[type="submit"] {
            background-color: #008080;
            color: #fff;
            padding: 0.5em 1em;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 90%;
            display: block;
            width: 100%;
            margin-top: 1em;
        }

        input[type="submit"]:hover {
            background-color: #006666;
        }

        br {
            clear: both;
        }
    </style>   
</head>

<body>
    <h1>Thanks for joining our email list</h1>
    <p>Here is the information that you entered:</p>

    <!-- Box for displaying user information -->
    <div class="user-info">
        <label>Email:</label>
        <span>${user.email}</span><br>
        <label>First Name:</label>
        <span>${user.firstName}</span><br>
        <label>Last Name:</label>
        <span>${user.lastName}</span><br>
    </div>

    <p>To enter another email address, click on the Back button in your browser or the Return button shown below.</p>

    <form action="" method="post">
        <input type="hidden" name="action" value="join">
        <input type="submit" value="Return">
    </form>

    <p><i>${errorMessage}</i></p>
</body>
</html>
