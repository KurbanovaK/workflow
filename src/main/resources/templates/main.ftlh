<#import "partials/layout.ftlh" as layout>
<@layout.page>
<!-- Main jumbotron for a primary marketing message or call to action -->
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">Документооборот дошкольного учреждения</h1>
        <p>Система электронного документооборота (СЭД) – автоматизированная (построенная на основе программы или
            сервиса) многопользовательская система, поддерживающая процесс управления организацией. При этом
            предполагается, что процесс управления сопровождается человеко-читаемыми документами, являющиеся, по сути,
            инструкциями для сотрудников организации, необходимыми к исполнению.</p>
        <p><a class="btn btn-primary btn-lg" href="/documents/all" role="button">Перейти к документам &raquo;</a></p>
    </div>
</div>

<div class="container">
    <!-- Example row of columns -->
    <div class="row">
        <div class="col-md-4">
            <h2>Документация</h2>
            <p>Раздел, в котором предусмотрено исполнение базовых процессов в системе - оформление документа, назначение
                на ответственного сотрудника и просмотр документов, непосредственно назначенных на текущем пользователе
                ("Мои документы")</p>
            <#if user??>
                <p><a class="btn btn-secondary" href="/documents/all" role="button">Перейти &raquo;</a></p>
            </#if>

        </div>
        <div class="col-md-4">
            <h2>Пользователи</h2>
            <p>Раздел предназначен для пользователей - администраторов, в зону ответственности которого входит
                распределение ролей между пользователями, назначение ролей вновь зарегистрированным пользователям</p>
            <#if user??>
              <#if user.getRoles()?seq_contains("Admin")>
                <p><a class="btn btn-secondary" href="/users/list" role="button">Перейти &raquo;</a></p>
              </#if>
            </#if>


</div>
<div class="col-md-4">
    <h2>Журнал</h2>
    <p>В данном разделе отображаются события, которые происходят с документами - изменнеие статуса, загрузка новой версии документа, смена ответственного пользователя и др. Раздел доступен администраторам и руководителям</p>

  <#if user??>
  <#if user.getRoles()?seq_contains("Admin")>
  <p><a class="btn btn-secondary" href="/logs/all" role="button">Перейти &raquo;</a></p>
  <#elseif user.getRoles()?seq_contains("Supervisor")>
  <p><a class="btn btn-secondary" href="/logs/all" role="button">Перейти &raquo;</a></p>
  </#if>
</#if>

</div>
</div>

<hr>
</div>
</@layout.page>

