<#macro template user>
    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/html">
        <head>
            <title>
                Интернет-магазин
            </title>
            <link rel="stylesheet" href=/static/styles.css>
        </head>
        <body>
            <div class = "header">
                Здесь будет Header
                <#if user?? && user.email??>
                    Ваш E-Mail: ${user.email} |
                    <a href = "/cart">Корзина</a>, в ней ${user.cart.calculateAmountOfProducts()} товаров, на сумму ${user.cart.calculateTotalCost()} рублей
                    <form action="/logout" method="post">
                        <input type="hidden" name = "_csrf" value = "${_csrf.token}">
                        <input type="submit" value="Выйти">
                    </form>
                <#else>
                    Вы не вошли, <a href = "/login">войдите</a>
                </#if>
            </div>



            <div class = "content">
                <#nested />
            </div>
            <div class = "footer"></div>
        </body>
    </html>
</#macro>