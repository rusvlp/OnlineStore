<#import "blocks/user.ftlh" as t>
<@t.template>
    <h1>Информация о товаре: </h1> <br />
    <form action = "/product/${product.id}/edit" method="post" class = ".mainform">
        <div class = "hidden">Режим редактирования</div>
        Id: ${product.id}  <input type = "hidden" value = "${product.id}" required><br />
        Название: ${product.title} <input type = "text" name = "title" class = "hidden" value="${product.title}" required> <br />
        Описание: ${product.description} <input type="text" name = "description" class = "hidden" value="${product.description}" required><br />
        Цена: ${product.price} <input type = "number" name = "price" class = "hidden" value = "${product.price}" required><br />
        Количество на складе: ${product.amount} <input type="number" name = "amount" class = "hidden" value = "${product.amount}" required> <br />
        Производитель: ${product.manufacturer} <input type = "text" name = "manufacturer" class = "hidden" value="${product.manufacturer}" required> <br />
        Страна производства: ${product.countryOfManufactory} <input type="text" class = "hidden" name = "countryOfManufactory" value="${product.countryOfManufactory}" required> <br />
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

        <input type = "hidden" name = "_csrf" value="${_csrf.token}">
    </form>
    Фотографии:
    <#list product.images as image>
        <div class = "image${image.id}">
            <img src = "/images/${image.id}">
            <div class = "hidden">
                <form action = "/images/delete/${image.id}" method="post" class = "deleteImg${image.id}">
                    <input type = "hidden" name = "_csrf" value="${_csrf.token}">
                </form>
                <!--div class = "successDeletedImg${product.id}" style="display: none">Изображение удалено</div>
                <div class = "unsuccessDeletedImg${product.id}" style="display: none">Не удалось удалить изображение</div-->
                <button onclick="deleteImage(${image.id})">Удалить изображение</button>
            </div>
        </div>
    </#list>
    <div class = "hidden">
        Добавьте изображения
        <button onclick="addImage()">Добавить изображение</button>
    </div>

    <div class = "hidden imagesBlock">

    </div>
    <div class = "hidden submitImages" style = "display: none">
        <button onclick = "submitImages()">Загрузить изображения</button>
    </div>
    <button class = "hidden" onclick="finishEdit()">Отменить изменения</button>
    <button class = "hidden" onclick="saveChanges()">Закончить редактирование </button>
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
        let imagesCounter = 0;
        let imagesBlock = document.querySelector(".imagesBlock");

        function addImage(){
            if (imagesCounter == 0){
                document.querySelector(".submitImages").style.display = "block"
            }
            let newImageBlock = '<div class = "addimage"><form method="dialog" name = "form' + imagesCounter+'" enctype="multipart/form-data" class = "imageform' + imagesCounter+ '"><input type = "file" name = "file" class = "image' + imagesCounter +'"/> <input type="hidden" name = "_csrf" value = "${_csrf.token}"> </form></div>'
            imagesBlock.innerHTML +=  newImageBlock;
            imagesCounter++;
        }

        function submitImages(){
            for (let i = 0; i<imagesCounter; i++){
                let formdata = new FormData(document.querySelector(".imageform" + i));
                fetch('/product/${product.id}/addImageToExist', {
                    method: 'POST',
                    body: formdata
                })
            }
            console.log("success added images");
            imagesBlock.innerHTML = "";
            imagesCounter = 0;
            document.querySelector(".submitImages").style.display = "none"
        }


        function deleteImage(id){
            console.log("image deleted =)")
            let formdata = new FormData(document.querySelector(".deleteImg" + id));
            /*let successBlock = document.querySelector(".successDeletedImg" + id)
            let unsucessBlock = document.querySelector(".unsucessDeletedImg" + id) */
            fetch('/images/delete/' + id, {
                method: 'POST',
                body: formdata
            }).then(response => {
                return response.text()
            }).then(response => {
                console.log(response)
                if (response == "true"){
                    document.querySelector(".image" + id).innerHTML = "";
                } else {
                   // unsucessBlock.style.display = "block";

                }
            })
        }

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

            imagesBlock.innerHTML = "";
            imagesCounter = 0;
            document.querySelector(".submitImages").style.display = "none"
        }

        function saveChanges(){
            let form = new FormData(document.querySelector(".mainform"))
            form.submit()

            imagesBlock.innerHTML = "";
            imagesCounter = 0;
            document.querySelector(".submitImages").style.display = "none"
        }
    </script>

</@t.template>