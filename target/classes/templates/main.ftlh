<#import "blocks/user.ftlh" as t>
<@t.template user>
    <br/>
    <br/>
    <!-- Для Ивана: разделить основную форму и навигацию по страницам, последнюю переместить вниз страницы -->
    <form action = "/" method="get">
        <label for = "searchQuery">Поиск: </label>
        <input type = "text" name = "searchQuery" id = "searchQuery">
        <input type="submit" value="Искать"> <br/> <br/>
        Сортировать по:
        <input type = "radio" name = "priceSort" value="increasing" id = "increasingChoice" <#if filters.priceSort ?? && filters.priceSort == "increasing"> checked = "checked" </#if>>
        <label for = "increasingChoice">Цена: по возрастанию</label>
        <input type = "radio" name = "priceSort" value = "decreasing" id = "decreasingChoice" <#if filters.priceSort ?? && filters.priceSort == "decreasing"> checked = "checked"</#if>>
        <label for = "decreasingChoice">Цена: по убыванию</label>
        <input type = "submit" value = "Применить">
        <button name = "page" value="1">1</button>
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