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
        <input type="submit" value="Войти">
        <input type="hidden" name = "_csrf" value="${_csrf.token}">
    </form>
</body>
</html>