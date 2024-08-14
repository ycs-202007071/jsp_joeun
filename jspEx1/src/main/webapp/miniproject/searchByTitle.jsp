<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        .container {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        header, footer {
            background-color: #f1f1f1;
            padding: 10px;
            text-align: center;
        }

        .button {
            background-color: #00A79D; /* Green background */
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin: 10px 0;
            cursor: pointer;
            border-radius: 4px; /* Rounded corners */
            transition: background-color 0.3s; /* Smooth transition */
        }

        .button:hover {
            background-color: #007f75; /* Darker green on hover */
        }

        form {
            background-color: white;
            padding: 20px;
            margin: 20px auto;
            width: 90%;
            max-width: 500px; /* Maximum width for the form */
            border-radius: 8px; /* Rounded corners */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-size: 16px;
            color: #333;
        }

        input[type="text"] {
            width: calc(100% - 22px); /* Full width minus padding and border */
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .content {
            flex: 1;
            overflow-y: auto;
            padding: 20px;
        }

        table {
            table-layout: auto;
            width: 100%;
            border-spacing: 20px;
            border: 1px solid #ddd;
            background-color: #fff;
        }

        td {
            text-align: center;
            border: 1px solid #ddd;
            padding: 10px;
        }

        span {
            font-size: 14px;
            background-color: white;
            color: black;
        }

        caption {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
            text-align: center;
        }

        @media (max-width: 600px) {
            form {
                width: 95%;
            }

            input[type="text"] {
                width: calc(100% - 20px); /* Adjust width for small screens */
            }
        }
    </style>
</style>
</head>
<body>
<jsp:include page = "header.jsp" flush ="false" />
<form action ="search_result.jsp" method = "get">

	<div>
		<label>책 제목 : <input type ="text" name="bookName"></label>
	</div>
	<input type = "submit" class = "button" value="책 검색">
</form>
<jsp:include page = "bottom.jsp" flush ="false" />
</body>
</html>