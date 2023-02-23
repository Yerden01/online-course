<#import "../parts/commonStudent.ftlh" as c>

<@c.page>
    <#if errorMessage??>
        <div class="alert alert-danger">
            ${errorMessage}
        </div>
    </#if>

    Категории: <#list categories as category>
        <a href="?chosenCategory=${category.id?c}" class="btn <#if chosenCategory.id = category.id>btn-secondary<#else>btn-outline-secondary</#if>">
            ${category.name} <span class="badge badge-light">${category.courses?size}</span>
        </a>
    </#list>
    <hr>

    <div class="row">
        <#list courses as course>
            <div class="col-md-3">
                <div class="container">
                    <div class="card ">
                        <img class="card-img-top" src="/images/${course.imageSrc}" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">${course.name}</h5>
                            <p class="card-text">${course.description}</p>
                            <p class="card-text"><small class="text-muted">${course.author}</small></p>
                            <form action="/register-course" method="post">
                                <input type="hidden" name="course" value="${course.id?c}">
                                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                <button type="submit" class="btn btn-secondary">Зарегистрироваться</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </#list>
    </div>

</@c.page>