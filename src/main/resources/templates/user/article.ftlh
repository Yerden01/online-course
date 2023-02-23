<#import "../parts/commonStudent.ftlh" as c>

<@c.page>

<#--    Категории: <#list categories as category>-->
<#--        <a href="?chosenCategory=${category.id?c}" class="btn <#if chosenCategory.id = category.id>btn-secondary<#else>btn-outline-secondary</#if>">-->
<#--            ${category.name} <span class="badge badge-light">${category.courses?size}</span>-->
<#--        </a>-->
<#--    </#list>-->
    <h3>${article.name}</h3>
    <hr>
    <div class="row justify-content-center">
        <img width="500" src="/images/${article.imageSrc}" alt="">
    </div>
    <hr>
    <div class="text-muted">${article.description}</div>

</@c.page>