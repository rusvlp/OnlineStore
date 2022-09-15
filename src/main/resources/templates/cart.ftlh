<#import "blocks/user.ftlh" as t>
<@t.template user>
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
        <button onclick = "productAction(${cartproduct.product.id}, 'remove') "> Удалить ajax </button><br>
        <#else>
        В вашей корзине нет товаров <br>
    </#list>
    В вашей корзине ${cart.calculateAmountOfProducts()} товаров на сумму ${cart.calculateTotalCost()};
    <#if user.cart.products?size != 0>
         <form action="/cart/clean" method="post">
             <input type = "hidden" name = "_csrf" value = "${_csrf.token}">
             <input type="submit" value="Очистить коризну">
         </form>

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
            })
        }

        function increase(id){
            let formData = new FormData()
        }

        function decrease(id){
            let formData = new FormData(document.getElementById("decrease"+id));
            fetch('/cart/decrease', {
                method: 'POST',
                body: formData
            })
        }

        function remove(id){
            let formData = new FormData(document.getElementById("remove"+id));
            fetch ('/cart/remove', {
                method: 'POST',
                body: formData
            })
        }
    </script>
</@t.template>