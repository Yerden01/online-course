<#import "../parts/commonStudent.ftlh" as c>

<@c.page>

<#--    Категории: <#list categories as category>-->
<#--        <a href="?chosenCategory=${category.id?c}" class="btn <#if chosenCategory.id = category.id>btn-secondary<#else>btn-outline-secondary</#if>">-->
<#--            ${category.name} <span class="badge badge-light">${category.courses?size}</span>-->
<#--        </a>-->
<#--    </#list>-->
    <h3>Статьи</h3>

    <div class="row mb-3">
        <#list articles as article>
            <div class="col-md-3 mt-3">
                <div class="container">
                    <div class="card ">
                        <img class="card-img-top" src="/images/${article.imageSrc}" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">${article.name}</h5>
<#--                            <p class="card-text">${course.description}</p>-->
<#--                            <p class="card-text"><small class="text-muted">${course.author}</small></p>-->
                            <a href="/stud-articles/${article.id?c}" class="btn btn-secondary">Читать</a>
                        </div>
                    </div>
                </div>
            </div>

        </#list>
    </div>

</@c.page>