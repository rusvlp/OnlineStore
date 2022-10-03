<#import "blocks/user.ftlh" as t>
<@t.template>
    <#list user.cart.products as cartproduct>
        ${cartproduct.product.title} |
        <form id = "increase${cartproduct.product.id}" method="dialog" style="display: inline">
            <input type="hidden" name = "productId" value = "${cartproduct.product.id}">
            <input type = "hidden" name = "_csrf" value="${_csrf.token}">
        </form>
        <button onclick="productAction(${cartproduct.product.id},'increase')">+</button>
        ${cartproduct.quantity} штук
        <form id = "decrease${cartproduct.product.id}" method="dialog" style="display: inline">
            <input type="hidden" name = "productId" value = "${cartproduct.product.id}">
            <input type = "hidden" name = "_csrf" value="${_csrf.token}">
        </form>
        <button onclick="productAction(${cartproduct.product.id}, 'decrease')">-</button>
        | ${cartproduct.calculateSum()} руб.|
        <form id = "remove${cartproduct.product.id}" method="dialog" style="display: inline">
            <input type="hidden" name = "productId" value = "${cartproduct.product.id}">
            <input type = "hidden" name = "_csrf" value="${_csrf.token}">
        </form>
        <button onclick = "productAction(${cartproduct.product.id}, 'remove') "> Удалить товар </button><br>
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
            let formData = new FormData(document.getElementById(action+""+id));
            fetch('/cart/'+action, {
                method: 'POST',
                body: formData
            }).then(response => {
                return response.text()
            }).then(response => {
                console.log(response)
            })
            setTimeout(() => document.location.reload(), 5000)

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