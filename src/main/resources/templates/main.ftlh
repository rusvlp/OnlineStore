<html>
    <head>
        <title>Главная</title>
    </head>
    <body>

        <#if user??>
            Ваш E-Mail: ${user.email}
        <#else>
            Вы не вошли, <a href = "/login">Войти</a>
        </#if>
        <br/>
        <br/>
        Привет, тут будет список товаров:
        <#if products??>
            <#list products as product>
                id: ${product.id}
                назавние: ${product.title}
                описание: ${product.description}
                <br>
            </#list>
        <#else>
            Товаров нет
        </#if>
    </body>
</html>