<#import "partials/layout.ftlh" as layout>

<@layout.page>
<div class='container'>
    <h2> Журнал событий </h1>
        <table id="grid-basic" class="table table-condensed table-hover table-striped" data-toggle="bootgrid">
            <thead>
            <tr>
                <th data-column-id="id" data-type="numeric">ID</th>
                <th data-column-id="message" data-type="text" data-header-css-class="fat">Сообщение</th>
                <th data-column-id="user" data-type="text">Пользователь</th>
                <th data-column-id="date" data-type="text" >Дата</th>
            </tr>
            </thead>
            <tbody>
            <#list logs as log>
            <tr>
                <td>${log.getId()}</td>
                <td >${log.getMessage()}</td>
                <td>${log.getAuthorName()}</td>
                <td>${log.getDateStr()}</td>
            </tr>
            </#list>
            </tbody>
        </table>
</div>

<script>
$("#grid-basic").bootgrid();
</script>

<style>
    .fat{
        width:500px
    }
</style>
</@layout.page>
