<html>
    <head>
        <title>Админ панель</title>
    </head>
    <body>
    <h1>Добавьте товар</h1>
    <form action="/product/add" method="post">
        <label for = "title">Название</label>
        <input type="text" name = "title"> <br/>
        <label for = "title">Описание</label>
        <input type="text" name = "description"> <br/>
        <label for = "price">Цена</label>
        <input type = "number" name = "price"> <br/>
        <label for = "manufacturer">Производитель</label>
        <input type = "text" name = "manufacturer"> <br/>
        <label for = "countryOfManufactory">Страна производства</label>
        <input type="text" name = "countryOfManufactory"> <br/>
        <label for = "amount">Количество товара на складе</label>
        <input type = "number" name = "amount"> <br/>
        <label for = "categoryName">Выберете категорию:</label>
        <select name = "categoryName">
            <#if categories??>
                <#list categories as category>
                    <option value="${category.title}">${category.title}</option>
                </#list>
                <#else>
                    <option value="">Без категории</option>
            </#if>

        </select> <br />
        <input type="hidden" name = "_csrf" value="${_csrf.token}">
        <input type="submit" value="Добавить товар">
    </form>
    <br /> <br />
    <h1>Добавьте категорию</h1>
    <form action="/category/add" method="post">
        <label for = "title">Название категории</label>
        <input type="text" name = "title">
        <input type = "submit" value="Добавить категорию">
        <input type="hidden" name = "_csrf" value="${_csrf.token}">
    </form>
    </body>
</html>