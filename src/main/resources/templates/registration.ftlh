<html>
<head>
    <title>Тест</title>
</head>
<body>
Регистрация: <br>
<form action="/registration" method="post">

    Логин:
    <input type="text" name = "email"> <br>
    Пароль:
    <input type="text" name = "password">
    <input type="hidden" name ="_csrf" value="${_csrf.token}">
    <input type="submit" value="Зарегистрироваться">
    <#if userExistError??>
        ${userExistError}
    </#if>
</form>
</body>
</html>