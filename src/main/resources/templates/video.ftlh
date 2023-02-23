<#import "parts/common.ftlh" as c>

<@c.page>
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">
            Все видео курса: <a href="/categories/${course.category.id?c}">${course.name!''}</a>
        </h1>
<#--        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">-->
<#--            <i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>-->
        <a class="btn btn-outline-info btn-circle mr-2" data-toggle="collapse"
           href="#collapseExample" role="button" aria-expanded="false"
           aria-controls="collapseExample">
            <i class="fas fa-plus"></i>
        </a>
    </div>

    <div class="collapse <#if video??>show </#if>" id="collapseExample">
        <div class="text-info text-right mx-1 mb-2">Добавить видео</div>
        <div class="shadow-none p-3 mb-5 bg-white rounded border border-info">
            <#if message??>
                <div class="alert alert-danger" role="alert">
                    ${message?ifExists}
                </div>
            </#if>


            <form method="post" enctype="multipart/form-data">
                <div class="form-group row">
                    <label for="inputName" class="col-sm-2 col-form-label">Название</label>
                    <div class="col-sm-10">
                        <input  type="text" class="form-control ${(nameError??)?string('is-invalid', '')}"
                                id="inputName" name="name" value="<#if video??>${video.name!''}</#if>"
                                placeholder="Название видео">
                        <#if nameError??>
                            <div class="invalid-feedback">
                                ${nameError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="description" class="col-sm-2 col-form-label">Описание</label>
                    <div class="col-sm-10">
                        <textarea  type="text" class="form-control ${(descriptionError??)?string('is-invalid', '')}"
                                   id="description" name="description"
                                   placeholder="Описание продукта" rows="5"><#if video??>${video.description!''}</#if></textarea>
                        <#if descriptionError??>
                            <div class="invalid-feedback">
                                ${descriptionError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputVideoSrc" class="col-sm-2 col-form-label">Видео ссылка</label>
                    <div class="col-sm-10">
                        <input  type="text" class="form-control ${(linkError??)?string('is-invalid', '')}"
                                id="inputVideoSrc" name="videoSrc"
                                value="<#if video??>${video.link!''}</#if>"
                                placeholder="Видео ссылка">
                        <#if linkError??>
                            <div class="invalid-feedback">
                                ${linkError}
                            </div>
                        </#if>
                    </div>
                </div>
<#--                <div class="custom-file">-->
<#--                    <input type="file" class="custom-file-input" id="inputGroupFile02" name="imageOfCategory">-->
<#--                    <label class="custom-file-label" for="inputGroupFile02">Выберите фото</label>-->
<#--                </div>-->

                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <div class="form-group row justify-content-end">
                    <div class="col-sm-10 ">
                        <button type="submit" class="btn btn-info">Добавить</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <table class="table table-striped table-hover">
        <thead>
            <tr>
                <th>#</th>
                <th>Название</th>
                <th>Описание</th>
                <th>Видео</th>
            </tr>
        </thead>
        <tbody>
            <#list videos as video>
                <tr>
                    <th>${video.id?c}</th>
                    <td>${video.name!''}</td>
                    <td>${video.description!''}</td>
                    <td><a target="_blank" href="${video.getLink()!''}">Ссылка</a></td>
                    <td>
                        <div class="row justify-content-end">
                            <div class="btn-group mr-3" role="group" aria-label="button group">
                                <a href="#" class="btn btn-outline-warning btn-sm" data-toggle="modal" data-target="#edit${video.id?c}"><i class="fas fa-edit"></i></a>
                                <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="edit${video.id?c}">
                                    <div class="modal-dialog modal-lg modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Изменить</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body justify-content-start">

                                                <form method="post" action="/course/${course.id?c}/update" enctype="multipart/form-data">
                                                    <div class="form-group row">
                                                        <label for="editName" class="col-sm-2 col-form-label">Название</label>
                                                        <div class="col-sm-10">
                                                            <input  type="text" class="form-control " id="editName" name="name"
                                                                    value="<#if course??>${video.name!''}</#if>" placeholder="Название категории">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="description" class="col-sm-2 col-form-label">Описание</label>
                                                        <div class="col-sm-10">
                                                        <textarea  type="text" class="form-control"
                                                                   id="description" name="description"
                                                                   placeholder="Описание продукта" rows="5">${video.description!''}</textarea>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="editLink" class="col-sm-2 col-form-label">Видео</label>
                                                        <div class="col-sm-10">
                                                            <input  type="text" class="form-control " id="editLink" name="link"
                                                                    value="<#if video??>${video.link!''}</#if>" placeholder="Видео">
                                                        </div>
                                                    </div>
                                                    <input type="hidden" name="videoId" value="${video.id?c}" />
                                                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                                    <div class="form-group row justify-content-end">
                                                        <div class="col-sm-10 ">
                                                            <button type="submit" class="btn btn-success btn-sm  mr-1"><i class="far fa-save fa-lg"></i></button>
                                                            <button type="button" class="btn btn-danger btn-sm mr-5" data-dismiss="modal"><i class="fas fa-undo-alt"></i></button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="del${video.id?c}">
                                    <div class="modal-dialog modal-sm">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Удаление</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <p>Вы хотите удалить видео &#8220;${video.name}&#8221;. Вы точно уверены?</p>
                                            </div>
                                            <div class="modal-footer">
                                                <form class="form-inline" action="/course/${course.id?c}/del" method="post">
                                                    <input type="hidden" name="videoId" value="${video.id?c}" />
                                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                    <button type="submit"  class="btn btn-success btn-sm px-3 mr-1">Да</button>
                                                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Нет</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <a href="#"  class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#del${video.id?c}"><i class="far fa-trash-alt"></i></a>

<#--                                <a href="/categories/${course.id?c}" class="btn btn-success btn-sm"><i class="fas fa-arrow-right"></i></a>-->
                            </div>
                        </div>
                    </td>
                </tr>
            </#list>
        </tbody>
    </table>

</@c.page>