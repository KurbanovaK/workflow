
<#import "partials/layout.ftlh" as layout>
<@layout.page>

<div class="col-xs-1" align="center"><h2 class="">Регистрация нового пользователя</h2></div>

<div class="login-form" action="/registration" method="post">
    <form class="form-horizontal" role="form" action="/registration" method="post">
        <p class="col-xs-1" align="center">

                <#if message??>
        <h6 class="invalid-feedback">
            ${message}
        </h6>
                 </#if>

        </p>

            <div class="form-group">
                <label for="initials" class="col-sm-2 control-label">ФИО</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" placeholder="ФИО" name="initials">
                </div>
            </div>
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
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-success btn-sm">Зарегистрироваться</button>
                </div>
            </div>
    </form>
</div>
</@layout.page>
