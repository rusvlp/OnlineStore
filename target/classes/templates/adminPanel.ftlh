<html>
    <head>
        <title>Админ панель</title>
    </head>
    <body>
    <h1>Добавьте товар</h1>
    <form action="#" method="dialog" id = "addProductForm">
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
        <input type = "hidden" name = "numberOfImagesBlock">
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
        <div class="numberOfImagesBlock">
            <input type ="hidden" name = "noi" value = "0" id = "noi">
        </div>
        <input type="hidden" name = "_csrf" value="${_csrf.token}">
    </form>
    <button onclick = "addImage()">Добавить изображение</button> <br />
    <div class = "imagesContainer"></div> <br />

    <button onclick = "addProduct()">Добавить товар</button>
    <br /> <br />
    <h1>Добавьте категорию</h1>
    <form action="/category/add" method="post">
        <label for = "title">Название категории</label>
        <input type="text" name = "title">
        <input type = "submit" value="Добавить категорию">
        <input type="hidden" name = "_csrf" value="${_csrf.token}">
    </form>
    </body>
    <script>
        let imagesContainer = document.querySelector(".imagesContainer");
        let imagesCounter = 0;
        let numberOfImagesBlock = document.querySelector(".numberOfImagesBlock");

        function addProduct(){
            console.log("Product added")
            let mainFormData = new FormData(document.querySelector("#addProductForm"));

            fetch('/product/add', {
                method: 'POST',
                body: mainFormData
            }).then(data => {
                return data.text()
            }).then(id => {
                for (let i = 0; i<imagesCounter; i++){
                    let formData = new FormData(document.querySelector(".imageForm" + i));
                    fetch('/product/' + id + '/addImage/', {
                        method: 'POST',
                        body: formData
                    });
                }
            })

        }

        function addImage(){

            let newImageBlock = '<div class = "addimage"><form method="dialog" name = "form' + imagesCounter+'" enctype="multipart/form-data" class = "imageform' + imagesCounter+ '"><input type = "file" name = "file" class = "image' + imagesCounter +'"/> <input type="hidden" name = "_csrf" value = "${_csrf.token}"> </form></div>'
            imagesContainer.innerHTML += newImageBlock;
            imagesCounter++;
            numberOfImagesBlock.innerHTML = '<input type ="hidden" name = "noi" value = "'+imagesCounter+'" id = "noi">';
        }

    </script>
</html>