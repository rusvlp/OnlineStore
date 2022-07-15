<html>
<head>
    <title>Тест</title>
</head>
<body>
    Форма для входа: <br>
    <form action="/login" method="post">
        Логин:
        <input type="text" name = "username"> <br>
        Пароль:
        <input type="password" name = "password">
        <input type="hidden" name ="_csrf" value="${_csrf.token}">
        <input type="submit" value="Войти">
    </form>
</body>
</html>