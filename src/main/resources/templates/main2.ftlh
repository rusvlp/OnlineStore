<#import "blocks/user.ftlh" as t>
<@t.template>
    <br/>
    <br/>
    <!-- Для Ивана: разделить основную форму и навигацию по страницам, последнюю переместить вниз страницы -->
    <form action = "/" method="get" onsubmit = "searchSubmitActions()">
        Сортировать по цене:
        <input type = "radio" name = "priceSort" value="increasing" id = "increasingChoice" <#if  filters.priceSort ?? && filters.priceSort == "increasing"> checked = "checked" </#if>>
        <label for = "increasingChoice">Цена: по возрастанию</label>
        <input type = "radio" name = "priceSort" value = "decreasing" id = "decreasingChoice" <#if  filters.priceSort ?? && filters.priceSort == "decreasing"> checked = "checked"</#if>>
        <label for = "decreasingChoice">Цена: по убыванию</label>
        <input type = "radio" name = "priceSort" value = "" id = "noneChoice">
        <label for = "noneChoice">Цена: без сортировки</label> <br/>
        Задать диапазон цены:
        <label for = "from">От: </label>
        <div class = "blockFrom" style = "display: inline">
            <input type="number" name = "priceFrom" id = "from" <#if filters.priceFrom ??> value="${filters.priceFrom}" </#if>>
        </div>
        <label for = "to">До: </label>
        <div class = "blockTo" style="display: inline">
            <input type = "number" name = "priceTo" id = "to" <#if  filters.priceTo ??> value="${filters.priceTo}" </#if>> <br/>
        </div>
        Выберите категории товаров: <br />
        <#list categories as category>
            <input type="checkbox" name = "category" value="${category.getCat().title}" id = "${category.getCat().title}Category" path = "category" <#if category.isChecked() == true>checked = "checked"<#else></#if>>
            <label for = "${category.getCat().title}Category">${category.getCat().title}</label>
        </#list>


        <br />
        <input type = "submit" value = "Применить"> <br/>
        <input type = "reset" value = "Сбросить"> <br />
        Навигация по страницам:
        <#assign nop = numberOfPages>
        <#list 1..nop as i>
            <button name = "page" onclick="clearCurrentPage()" value = "${i}">${i}</button>
        </#list>
        <div class = "currentPageBlock">
            <input type = "hidden" name = "page" value="${currentPage}">
        </div>
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

    <script>

    </script>

</@t.template>