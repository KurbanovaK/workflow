<#import "partials/layout.ftlh" as layout>
<@layout.page>
<h2>Добавление нового документа</h2>
<form action="/documents/add" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label for="note">Примечание</label>
        <input aria-describedby="note" class="form-control"  name="note" placeholder="Ввдеите примечание для документа"
               type="text"
               value="">
        <small id="note" class="form-text text-muted">Используется для расширенного описания документа </small>
    </div>
    <div class="form-group">
        <label for="file">Файл</label>
        <input type="file" name="file" id="customFile" />
        <small id="file" class="form-text text-muted">Документ</small>
    </div>
<input type="hidden" value="${_csrf.token}" name="_csrf" />
<button type="submit" class="btn btn-primary">Создать</button>
</form>
</@layout.page>

