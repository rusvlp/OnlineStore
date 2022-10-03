<#import "blocks/user.ftlh" as t>
<@t.template>
    <#list user.cart.products as cartproduct>
        <div id = "product${cartproduct.id}">
            ${cartproduct.product.title} |
            <form id = "increase${cartproduct.product.id}" method="dialog" style="display: inline">
                <input type="hidden" name = "productId" value = "${cartproduct.product.id}">
                <input type = "hidden" name = "_csrf" value="${_csrf.token}">
            </form>
            <button onclick="productAction(${cartproduct.product.id},'increase')">+</button>
            <div style = "display: inline" id = "quantity${cartproduct.id}">${cartproduct.quantity} штук </div>
            <form id = "decrease${cartproduct.product.id}" method="dialog" style="display: inline">
                <input type="hidden" name = "productId" value = "${cartproduct.product.id}">
                <input type = "hidden" name = "_csrf" value="${_csrf.token}">
            </form>
            <button onclick="productAction(${cartproduct.product.id}, 'decrease')">-</button>
            |<div style="display: inline" id = "sum${cartproduct.id}"> ${cartproduct.calculateSum()} руб. </div>|
            <form id = "remove${cartproduct.product.id}" method="dialog" style="display: inline">
                <input type="hidden" name = "productId" value = "${cartproduct.product.id}">
                <input type = "hidden" name = "_csrf" value="${_csrf.token}">
            </form>
            <button onclick = "productAction(${cartproduct.product.id}, 'remove') "> Удалить товар </button><br>
        </div>
        <#else>
        В вашей корзине нет товаров <br>
    </#list>
    В вашей корзине ${cart.calculateAmountOfProducts()} товаров на сумму ${cart.calculateTotalCost()};
    <#if user.cart.products?size != 0>
         <form id = "cleanCart" method="post">
             <input type = "hidden" name = "_csrf" value = "${_csrf.token}">
         </form>
        <button onclick="cleanCart()">Очистить корзину</button>

    </#if>
    user_id: ${user.id} <br />
    cart_id: ${cart.id}
    <script>
        // ajax cart actions test
        function productAction(id, action){
            switch (action){
                case "increase":
                    crease(action, id)
                    break;
                case "decrease":
                    crease(action, id)
                    break;
                case "remove":
                    remove(id)
                    break;
            }

            let formData = new FormData(document.getElementById(action+""+id));
            fetch('/cart/'+action, {
                method: 'POST',
                body: formData
            }).then(response => {
                return response.text()
            }).then(response => {
                console.log(response)
            })
            document.location.reload()

        }

        function crease(action, id){
            let quantityBlock = document.getElementById("quantity" + id);
            let quantity = quantityBlock.innerHTML;
            if (action == "increase"){
                quantity++;
                quantityBlock.innerHTML = quantity;
                return;
            }
            if (action == "decrease"){
                if (quantity == 1){
                    remove(id)
                } else {
                    quantity--;
                    quantityBlock.innerHTML = quantity;
                }
                return;
            }
        }

        function remove(id){
            let productBlock = document.getElementById("product"+id);
            productBlock.remove();
        }

        function cleanCart(){
            let formData = new FormData(document.getElementById("cleanCart"));
            fetch('/cart/clean', {
                method: 'POST',
                body: formData
            })
            document.location.reload();
        }

    </script>
</@t.template>