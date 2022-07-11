<html>
    <head>
        <title>Главная</title>
    </head>
    <body>
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