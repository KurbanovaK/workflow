<#import "partials/layout.ftlh" as layout>
<@layout.page>
<script src="/static/print.min.js"></script>

<h2>Карточка документа ${document.getName()}</h2>
<form action="/documents/edit" method="post" id="document_edit_form" enctype="multipart/form-data">
    <div class="form-group">
        <label for="note">Примечание</label>
        <input aria-describedby="note" class="form-control"  name="note" placeholder="Ввдеите примечание для документа"
               type="text"
               value="${document.getNote()}"
               disabled
        >
        <small id="note" class="form-text text-muted">Используется для расширенного описания документа </small>
    </div>
    <div class="form-group">
        <label for="sel1">Сменить статус документа (будет переназначен ответственный)</label>
        <select class="form-control" id="sel1" form="document_edit_form" name="newDocumentStatus">
            <#list statuses as st>
                <option value="${st}">${st}</option>
            </#list>
        </select>
    </div>
    <div class="form-group">
        <label for="file">Загрузить новую версию документа</label>
        <input type="file" name="file" id="customFile" />
        <small id="file" class="form-text text-muted">Новая версия документа</small>
    </div>

    <input type="hidden" value="${document.id}" name="documentId" />
    <input type="hidden" value="${_csrf.token}" name="_csrf" />
    <button type="submit" class="btn btn-primary">Сохранить</button>
    <a href="/documents/download/${document.id}" class="btn btn-info">Скачать</a>
</form>

<script>


</script>
</@layout.page>

