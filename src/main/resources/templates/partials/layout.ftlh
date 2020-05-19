<#include "security.ftlh">
<#macro page>
<!DOCTYPE HTML>
<html lang="ru" xml:lang="ru">
<head>
    <title>Документооборот дошкольного учреждения</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="/static/style.css" />
    <link rel="stylesheet" href="/static/jumbotron.css" />
   <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
 <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <script src="/static/fontawesome.js"></script>
    <script src="/static/jquery.bootgrid.min.js"></script>
    <link href="/static/jquery.bootgrid.css" rel="stylesheet">

</head>
<body>

<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
      <a class="navbar-brand" href="/main">Документооборот</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="/main">Главная <span class="sr-only">(current)</span></a>
          </li>

            <#if  user??>
                <li class="nav-item">
                    <a class="nav-link" href="/documents/all">Документы</a>
                </li>
            </#if>
            <#if  user??>
                <#if user.getRoles()?seq_contains("Admin")>
                    <li class="nav-item">
                        <a class="nav-link" href="/logs/all">Журнал</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/users/list">Пользователи</a>
                    </li>
                <#elseif user.getRoles()?seq_contains("Supervisor")>
                      <li class="nav-item">
                          <a class="nav-link" href="/logs/all">Журнал</a>
                      </li>
                </#if>

            </#if>

        </ul>
        <form class="form-inline my-2 my-lg-0">
            <#if  user??>
                 <span style="color:white; margin-right:10px">${user.getInitials()}</span>
                 <a href="/logout" class="btn btn-outline-success my-2 my-sm-0" type="submit">Выйти</a>
            <#else>
            <a href="/login" class="btn btn-outline-success my-2 my-sm-0">Войти</a>
            </#if>
        </form>
      </div>
    </nav>


    <main role="main">
    <div class="container">
     <#nested>
    </div>
    </main>

</body>
</html>
</#macro>