<#import "partials/layout.ftlh" as layout>

<@layout.page>
<div class='container'>
<h2> Список документов </h1>
<table id="grid-basic" class="table table-condensed table-hover table-striped" data-toggle="bootgrid">
    <thead>
        <tr>
            <th data-column-id="id" data-type="numeric" data-header-css-class="none">ID</th>
            <th data-column-id="sender" data-type="text" data-header-css-class="fat">Название</th>
            <th data-column-id="note" data-type="text">Примечание</th>
            <th data-column-id="status" data-type="text">Статус</th>
            <th data-column-id="assignee" data-type="text">Исполнитель</th>
            <th data-column-id="commands" data-formatter="commands" data-sortable="false">Действия</th>
        </tr>
    </thead>
    <tbody>
    <#list documents as document>
    <tr>
        <td>${document.getId()}</td>
        <td>${document.getName()}</td>
        <td>${document.getNote()}</td>
        <td>${document.getStringStatus()}</td>
        <td>${document.getAssignee().getInitials()}</td>
    </tr>
    </#list>

    </tbody>
</table>
</div>

<script>
$("#grid-basic").bootgrid({
formatters: {
        "commands": function(column, row)
        {
            return "<a class=\"btn btn-sm btn-primary command-edit\" data-row-id=\"" + row.id + "\" href=\"/documents/edit/" + row.id + "\">Карточка</a> ";
        }
    }
});

<#if user.getRoles()?seq_contains("Clerk")>
$('.actionBar').append("<a class='btn btn-outline-secondary ml-1' href='/documents/add'>Добавить</a>")
</#if>
<#if onlyMy == true>
$('.actionBar').append("<a class='btn btn-outline-success ml-1' href='/documents/all'>Все</a>")
<#else>
$('.actionBar').append("<a class='btn btn-outline-success ml-1' href='/documents/my'>Только мои</a>")
</#if>
</script>
<style>
    .fat{
        width:350px
    }
    .none{
        width:0px
    }
</style>
</@layout.page>
