<#import "partials/layout.ftlh" as layout>

<@layout.page>

<h2>Редактировать пользователя</h2>
<form action="/user" method="post">
    <div class="form-group">
        <label for="initials">ФИО</label>
        <input aria-describedby="initials" class="form-control" id="initials" placeholder="Введите ФИО пользователя"
               type="text"
               value="${user.getInitials()}"
               name="initials">
        <small id="initials" class="form-text text-muted">ФИО пользователя</small>
    </div>
    <div class="form-group">
        <label for="username">Имя пользователя</label>
        <input aria-describedby="username" class="form-control" id="username" placeholder="Введите имя пользователя"
               type="text"
               value="${user.username}"
               name="username">
        <small id="username" class="form-text text-muted">Имя пользователя используется при входе в систему</small>
    </div>
    <label>Роли пользователя</label>
    <#list roles as role>
    <div class="form-check">
        <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")} />${role}</label>
    </div>
</#list>
<input type="hidden" value="${user.id}" name="userId" />
<input type="hidden" value="${_csrf.token}" name="_csrf" />

    <button type="submit" class="btn btn-primary">Сохранить</button>
</form>

</@layout.page>
