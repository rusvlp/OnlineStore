<#import "blocks/user.ftlh" as t>
<@t.template user>
    <h1>Информация о товаре: </h1> <br />
    <form action = "/product/${product.id}/edit" method="post">
        <div class = "hidden">Режим редактирования</div>
        Id: ${product.id}  <input type = "hidden" value = "${product.id}"><br />
        Название: ${product.title} <input type = "text" name = "title" class = "hidden" value="${product.title}"> <br />
        Описание: ${product.description} <input type="text" name = "description" class = "hidden" value="${product.description}"><br />
        Цена: ${product.price} <input type = "number" name = "price" class = "hidden" value = "${product.price}"><br />
        Количество на складе: ${product.amount} <input type="number" name = "amount" class = "hidden" value = "${product.amount}"> <br />
        Производитель: ${product.manufacturer} <input type = "text" name = "manufacturer" class = "hidden" value="${product.manufacturer}"> <br />
        Страна производства: ${product.countryOfManufactory} <input type="text" class = "hidden" name = "countryOfManufactory" value="${product.countryOfManufactory}"> <br />
        Категория товара: ${product.category.title}
        <select name = "categoryName" class="hidden">
            <#if categories??>
                <#list categories as category>
                    <option
                            <#if product.category.title == category.title> selected </#if>
                            value="${category.title}">${category.title}</option>
                </#list>
            <#else>
                <option value="">Без категории</option>
            </#if>

        </select> <br />
        Фотографии: coming soon =)
        <input type = "hidden" name = "_csrf" value="${_csrf.token}">
        <input class = "hidden" type = "submit" value = "Закончить редактирование">
        <button class = "hidden" onclick="finishEdit()">Отменить изменения</button>
    </form>

    <#if user?? && user.email??>
        <#list user.roles as role>
            <#if role == "ROLE_ADMIN">
                <form action = "/product/${product.id}/delete" method="post">
                    <input type="hidden" name = "_csrf" value = "${_csrf.token}">
                    <input type = "submit" value = "Удалить товар">
                </form> <br />
                <button onclick = "editReveal()">Редактировать товар</button> <br />
                <#break>
            </#if>
        </#list>
    </#if>




    <a href = "/">На главную</a>

    <script>
        function editReveal(){
            let elements = Array.from(document.getElementsByClassName("hidden"))
            elements.forEach((element, i, elements) => {
                element.classList.remove("hidden")
                element.classList.add("unhidden")
            })
        }

        function finishEdit(){
            let elements = Array.from(document.getElementsByClassName("unhidden"))
            elements.forEach((element, i, elements) => {
                element.classList.remove("unhidden")
                element.classList.add("hidden")
            })
        }
    </script>

</@t.template>