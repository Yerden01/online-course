<#import "/spring.ftl" as spring/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Please sign in</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css" rel="stylesheet"
          crossorigin="anonymous" />
</head>

<body>
<div class="container">
    <form class="form-signin" method="post" action="/registration">
        <h2 class="form-signin-heading">Зарегистрироваться</h2>
        <#if errorMessage??>
            <div class="alert alert-danger" role="alert">${errorMessage}</div>
        </#if>
        <p>
            <label for="username" class="sr-only">Логин</label>
            <input type="text" id="username" name="username" autocomplete="off" class="form-control" placeholder="Логин" required autofocus>
        </p>
        <p>
            <label for="password" class="sr-only">Пароль</label>
            <input type="password" id="password" name="password" autocomplete="new-password" class="form-control" placeholder="Пароль" required>
        </p>
        <p>
            <label for="password" class="sr-only">Повторите пароль</label>
            <input type="password" id="password" name="checkPassword" class="form-control" placeholder="Повторите пароль" required>
        </p>
        <input name="_csrf" type="hidden" value="${_csrf.token}" />
        <button class="btn btn-lg btn-primary btn-block" type="submit">Регистрация</button>
    </form>
</div>
</body>
<#--<body id="page-top">-->
<#--<div class="container mt-5">-->
<#--    <form method="post" action="/registration">-->
<#--        <div class="form-group mb-3">-->
<#--&lt;#&ndash;            <label for="exampleInputEmail1">Логин</label>&ndash;&gt;-->
<#--            <input type="text" class="form-control" autocomplete="off" name="login" placeholder="Введите логин">-->
<#--        </div>-->
<#--        <div class="form-group mb-3">-->
<#--&lt;#&ndash;            <label for="exampleInputPassword1">Пароль</label>&ndash;&gt;-->
<#--            <input type="password" class="form-control" autocomplete="new-password" name="password" placeholder="Введите пароль">-->
<#--        </div>-->
<#--        <div class="form-group mb-3">-->
<#--&lt;#&ndash;            <label for="exampleInputPassword1">Повторите пароль</label>&ndash;&gt;-->
<#--            <input type="password" class="form-control" autocomplete="off" name="checkPassword" placeholder="Введите пароль еще раз">-->
<#--        </div>-->
<#--        <a class="btn btn-secondary" href="/">Назад</a>-->
<#--        <button type="submit" class="btn btn-secondary">Регистрация</button>-->
<#--    </form>-->
<#--</div>-->

<#--</body>-->
</html>
