<!doctype html>
<html lang="en">

<head>
    <title>Dynamic AJAX Pull Test</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="../standard.css">

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>

    <script>
        function showFields(string1) {
            var xRequest1;
            if (string1 == "") {
                document.getElementById("Show_update").innerHTML = "";
                return;
            }
            if (window.XMLHttpRequest) {
                xRequest1 = new XMLHttpRequest();
            }
            else {
                xRequest1 = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xRequest1.onreadystatechange = function () {
                if ((xRequest1.readyState == 4) && (xRequest1.status == 200)) {
                    document.getElementById("Show_update").innerHTML
                        = xRequest1.responseText;
                }
            }
            // xRequest1.open("get", "empdetails.jsp?q=" + string1, "true");
            xRequest1.open("get", "../testQuery.jsp" , "true");
            xRequest1.send();
        }
    </script>
</head>

<nav class="navbar navbar-expand-lg navbar-light bg-light">

    <a href="HelloWorld.jsp" class="navbar-left"><img src="../Resources/Brain_Yard_logo.png" width="150 px"></a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">

            <li class="nav-item active">
                <a class="nav-link" href="../index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="../loaddata.jsp">Load Data</a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                    Dropdown
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="./ajaxtest.jsp">Ajax Test</a>
                    <a class="dropdown-item" href="../testQuery.jsp">testQuery.jsp</a>
                    <a class="dropdown-item" href="../listAllQuestions.jsp">listAllQuestions.jsp</a>
                    <a class="dropdown-item" href="../addQuestion.jsp">addQuestion.jsp</a>
                    <a class="dropdown-item" href="../addQuestionHandler.jsp">addQuestionHandler.jsp</a>
                    <a class="dropdown-item" href="../correctAnswers.jsp">correctAnswers.jsp</a>

                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="#">Disabled</a>
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
    <form>
        <select name="user_name" onchange="getempdetails(this.value)" >
        <option value="">Employee Designations</option>
        <option value="Officer">Officer </option>
        <option value="Supervisor">Supervisor </option>
        <option value="Manager">Manager </option>
        </select>
        </form>
        <br />
        <div id="Show_update">To Update the designation...</div>  
</body>

</html>