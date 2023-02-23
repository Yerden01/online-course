<#import "../parts/commonStudent.ftlh" as c>

<@c.page>

    <h3>Мои курсы</h3>

    <div class="row">
        <#list courses as course>
            <div class="col-md-3">
                <div class="container">
                    <div class="card">
                    <img class="card-img-top" src="/images/${course.imageSrc}" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">${course.name}</h5>
                        <p class="card-text">${course.description}</p>
                        <p class="card-text"><small class="text-muted">${course.author}</small></p>
                        <a href="/my-courses/${course.id?c}" class="btn btn-secondary">Начать обучение</a>
                    </div>
                </div>
                </div>
            </div>
        <#else>
            Вы еще не регистрировались на курсы. <a href="/all-courses">Зарегистрироваться</a>
        </#list>
    </div>

</@c.page>