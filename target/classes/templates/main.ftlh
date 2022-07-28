<#import "blocks/user.ftlh" as t>
<@t.template user>
    <br/>
    <br/>
    Привет, тут будет список товаров: <br>
    <#if products??>
        <#list products as product>
            id: ${product.id}
            назавние: ${product.title}
            описание: ${product.description}
            <br>
        </#list>
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
</@t.template>