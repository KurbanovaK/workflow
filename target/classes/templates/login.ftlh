
<#import "partials/layout.ftlh" as layout>

<@layout.page>

<link rel="stylesheet" href="/static/login.css" />
<div class="login-form" action="/login" method="post">
    <form class="form-horizontal" role="form" action="/login" method="post">
        <p class="col-xs-1" align="center">

            <#if message??>
        <h6>
            ${message}
        </h6>
            </#if>

    </p>
        <div class="form-group">
            <label for="username" class="col-sm-2 control-label">Логин</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" placeholder="Логин" name="username">
            </div>

        </div>
        <div class="form-group">
            <label for="password" class="col-sm-2 control-label">Пароль</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" placeholder="Пароль" name="password">
            </div>

        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="remember"> Запомнить меня
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-success btn-sm">Войти</button>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <a class="btn btn-info btn-sm button" href="/registration">Зарегистрироваться</a>
            </div>
        </div>
    </form>
</div>

</@layout.page>

