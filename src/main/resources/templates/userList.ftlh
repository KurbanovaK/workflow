<#import "partials/layout.ftlh" as layout>

<@layout.page>
<h2>Список пользователей</h2>
<div class='container'>
<!--    private Long id;-->
<!--    private String username;-->
<!--    private String password;-->
<!--    private boolean active;-->
        <table id="grid-basic" class="table table-condensed table-hover table-striped" data-toggle="bootgrid">
            <thead>
            <tr>
                <th data-column-id="id" data-type="numeric">id</th>
                <th data-column-id="username" data-type="string">Имя пользователя</th>
                <th data-column-id="active" >Признак активности</th>
                <th data-column-id="roles_list" >Роли</th>
                <th data-column-id="commands" data-formatter="commands" data-sortable="false">Действия</th>
            </tr>
            </thead>
            <tbody>
            <#list users as user>
            <tr>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.isActive()?then('Да', 'Нет')}</td>
                <td><#list user.roles as role>${role}<#sep>, </#list></td>
            </tr>
            </#list>
            </tbody>
        </table>
</div>

<script>$("#grid-basic").bootgrid({
formatters: {
        "commands": function(column, row)
        {
            return "<a class=\"btn btn-sm btn-primary command-edit\" data-row-id=\"" + row.id + "\" href=\"/user/edit/" + row.id + "\">Изменить</a> " +
            "<a class=\"btn btn-sm btn-danger command-edit\" data-row-id=\"" + row.id + "\" href=\"/user/delete/" + row.id + "\">Удалить</a> ";
        }
    }
});</script>
</@layout.page>