<b>Внимание!</b>
${message}
<div>
    <form action = "delete/confirm" method = "post" style="display: inline">
        <input type = "hidden" name = "_csrf" value="${_csrf.token}">
        <input type="submit" value = "Да">
    </form>

    <form action="/product/${productId}" method="get" style="display: inline">
        <input type = "submit" value = "Нет">
    </form>

</div>