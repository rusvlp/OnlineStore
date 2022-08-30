<#import "blocks/user.ftlh" as t>
<@t.template user>
    <br/>
    <br/>
    <!-- Для Ивана: разделить основную форму и навигацию по страницам, последнюю переместить вниз страницы -->
    <form action = "/" method="get" onsubmit = "onSubmitActions()">
        <label for = "searchQuery">Поиск: </label>
        <div class = "searchQueryBlock" style="display: inline">
             <input type = "text" name = "searchQuery" id = "searchQuery">
        </div>
        <input type="submit" value="Искать"> <br/> <br/>
        Сортировать по цене:
        <input type = "radio" name = "priceSort" value="increasing" id = "increasingChoice" <#if filters.priceSort ?? && filters.priceSort == "increasing"> checked = "checked" </#if>>
        <label for = "increasingChoice">Цена: по возрастанию</label>
        <input type = "radio" name = "priceSort" value = "decreasing" id = "decreasingChoice" <#if filters.priceSort ?? && filters.priceSort == "decreasing"> checked = "checked"</#if>>
        <label for = "decreasingChoice">Цена: по убыванию</label>
        <input type = "radio" name = "priceSort" value = "" id = "noneChoice">
        <label for = "noneChoice">Цена: без сортировки</label> <br/>
        Задать диапазон цены:
        <label for = "from">От: </label>
        <input type="number" name = "priceFrom" id = "from">
        <label for = "to">До: </label>
        <input type = "number" name = "priceTo" id = "to"> <br/>
        <input type = "submit" value = "Применить"> <br/>
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
        function onSubmitActions(){
            let searchQueryBlock = document.querySelector(".searchQueryBlock");
            let searchQuery = document.querySelector("#searchQuery");
            if (searchQuery.value == ""){
                searchQueryBlock.innerHTML = "";
            }
        }
        function clearCurrentPage(){
            let currentPageBlock = document.querySelector(".currentPageBlock");
            currentPageBlock.innerHTML = "";
        }
    </script>

</@t.template>