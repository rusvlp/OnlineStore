<#import "blocks/user.ftlh" as t>
<@t.template user>
    <#list user.cart.products as cartproduct>
        ${cartproduct.product.title} | ${cartproduct.quantity} штук <br>
        <#else>
        В вашей корзине нет товаров <br>
    </#list>
    <#if user.cart.products?size != 0>
         <form action="/cart/clean" method="post">
             <input type = "hidden" name = "_csrf" value = "${_csrf.token}">
             <input type="submit" value="Очистить коризну">
         </form>
    </#if>
    user_id: ${user.id} <br />
    cart_id: ${cart.id}
</@t.template>