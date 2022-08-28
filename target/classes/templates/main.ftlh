<#import "blocks/user.ftlh" as t>
<@t.template user>
    <br/>
    <br/>

    <form action = "/" method="get">
        <label for = "searchQuery">Поиск: </label>
        <input type = "text" name = "searchQuery" id = "searchQuery">
        <input type="submit" value="Искать"> <br/> <br/>
        Сортировать по:
        <input type = "radio" name = "priceSort" value="increasing" id = "increasingChoice">
        <label for = "increasingChoice">Цена: по возрастанию</label>
        <input type = "radio" name = "priceSort" value = "decreasing" id = "decreasingChoice">
        <label for = "decreasingChoice">Цена: по убыванию</label>
        <input type = "submit" value = "Применить">
    </form>

    Привет, тут будет список товаров: <br>
    <#if products??>
        <#list products as product>
            id: ${product.id}
            цена: ${product.price}
            назавние: ${product.title}
            описание: ${product.description} |
            <a href = "/product/${product.id}">Подробнее...</a>
            <br>
        </#list>
        <#assign nop = numberOfPages>
        <#list 1..nop as i>
            <a href = "/?page=${i}">${i}</a>
        </#list>
        <br />
    <#else>
        Товаров нет
    </#if>

    <#if user?? && user.email??>

        <#list user.roles as role>
            <#if role == "ROLE_ADMIN">
                Вы - администратор
                <a href = "/adminPanel">Войти в админ-панель</a>
                <#break>
            </#if>
        </#list>
    </#if>
</@t.template>