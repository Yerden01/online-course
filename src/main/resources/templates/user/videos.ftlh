<#import "../parts/commonStudent.ftlh" as c>

<@c.page>

    <h4>Вы смотрите курс: ${course.name}</h4>
    <hr>

    <div class="row">
        <div class="col-md-3">
            <span class="text-muted">Список видео:</span>
            <ul class="list-group mt-3">
                <#list course.videos as video>
                    <a class="list-group-item list-group-item-action <#if chosenVideo??><#if video.id = chosenVideo.id>active</#if></#if>" href="?video=${video.id?c}">${video.name}</a>
                </#list>
            </ul>
        </div>
        <div class="col-md-9">
            <div class="embed-responsive embed-responsive-16by9">
                <iframe class="embed-responsive-item" src="${chosenVideo.link}" allowfullscreen></iframe>
            </div>
            <div class="mt-3">
                ${chosenVideo.description}
            </div>
        </div>
    </div>

    <br>
    <br>
    <br>

</@c.page>