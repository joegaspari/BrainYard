<!-- List all questions for a selected category -->
<%@ page import="java.sql.*,java.net.URLEncoder" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>BrainYard: Questions by Category</title>
    
        <link rel="stylesheet" href="./standard.css">
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        
        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
            crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>
    </head>
    
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
    
        <a href="index.jsp" class="navbar-left"><img src="./Resources/Brain_Yard_logo.png" width="150 px"></a>
    
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
    
                <li class="nav-item active">
                    <a class="nav-link" href="./index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
    
                <li class="nav-item">
                    <a class="nav-link" href="./loaddata.jsp">Load Data</a>
                </li>
    
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">
                        Queries
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <!-- <a class="dropdown-item" href="./testQuery.jsp">Database Connection Test</a> -->
                        <a class="dropdown-item" href="./listAllQuestions.jsp">Browse Questions</a>
                        <a class="dropdown-item" href="./listAllQuestionsByCategory.jsp">Browse Questions by Category</a>
                        <a class="dropdown-item" href="./addQuestion.jsp">Submit A Question</a>
                        <a class="dropdown-item" href="./correctAnswers.jsp">Correct Answers</a>
                    </div>
                </li>
            </ul>
    
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
    
            <!-- Trigger the modal with a button -->
            <button type="button" class="btn btn-info btn-md little-margin-left" data-toggle="modal"
                data-target="#LogButton">Login
                to the site</button>
    
        </div>
    </nav>



<body>
<div class='container pt-3'>
<% 
String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
String uid = "SA";
String pw = "YourStrong@Passw0rd";

int userId=Integer.parseInt(request.getParameter("BrainID"));

try 
{	// Load driver class
	Class.forName("com.mysql.jdbc.Driver");
}
catch (java.lang.ClassNotFoundException e) {
	System.err.println("ClassNotFoundException: " +e);	
}

String sql="SELECT * FROM CorAnswers WHERE userId=?";

try ( Connection con = DriverManager.getConnection(url, uid, pw); PreparedStatement ps=con.prepareStatement(sql);) 
{	
   
    
    ps.setInt(1,userId);

	ResultSet rst=ps.executeQuery();

	out.println("<table class='table'><thead><tr><th>Question ID</th><th>BrainID</th><th>Description</th><th>Average Rating</th></tr></thead><tbody>");
        while (rst.next())
        {	out.println("<tr><td>"+rst.getInt(1)+"</td>"+"<td>"+rst.getInt(2)+"</td>"+"<td>"+rst.getString(3)+"</td>"+"<td>"+rst.getDouble(4)+"</td></tr>");
        }
        out.println("</tbody></table>");
    }
catch (SQLException ex) 
{ 	out.println(ex); 
}
%>
</div>
</body>
</html>