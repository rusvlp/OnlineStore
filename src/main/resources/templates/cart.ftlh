<#import "blocks/user.ftlh" as t>
<@t.template user>
    <#list user.cart.products as cartproduct>
        ${cartproduct.product.title} |
        <form action = "/cart/increase" method="post" style="display: inline">
            <input type="hidden" name = "productId" value = "${cartproduct.product.id}">
            <input type = "hidden" name = "_csrf" value="${_csrf.token}">
            <input type="submit" value = "+">
        </form> ${cartproduct.quantity} штук
        <form action = "/cart/decrease" method="post" style="display: inline">
            <input type="hidden" name = "productId" value = "${cartproduct.product.id}">
            <input type = "hidden" name = "_csrf" value="${_csrf.token}">
            <input type="submit" value = "-">
        </form> | ${cartproduct.calculateSum()} руб.|
        <form id = "remove${cartproduct.product.id}" action = "/cart/remove" method="dialog" style="display: inline">
            <input type="hidden" name = "productId" value = "${cartproduct.product.id}">
            <input type = "hidden" name = "_csrf" value="${_csrf.token}">

        </form><br>
        <button onclick = "remove(${cartproduct.product.id})"> Удалить ajax </button>
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
        function remove(id){
            let formData = new FormData(document.getElementById("remove"+id));
            fetch ('/cart/remove', {
                method: 'POST',
                body: formData
            })
        }
    </script>
</@t.template>