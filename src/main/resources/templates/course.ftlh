<#import "parts/common.ftlh" as c>

<@c.page>
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Курсы</h1>
<#--        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">-->
<#--            <i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>-->
        <a class="btn btn-outline-info btn-circle mr-2" data-toggle="collapse"
           href="#collapseExample" role="button" aria-expanded="false"
           aria-controls="collapseExample">
            <i class="fas fa-plus"></i>
        </a>
    </div>

    <div class="collapse <#if course??>show </#if>" id="collapseExample">
        <div class="text-info text-right mx-1 mb-2">Добавить курс</div>
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
                                id="inputName" name="name" value="<#if course??>${course.name!''}</#if>"
                                placeholder="Название категории">
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
                                   placeholder="Описание продукта" rows="5"><#if course??>${course.description!''}</#if></textarea>
                        <#if descriptionError??>
                            <div class="invalid-feedback">
                                ${descriptionError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputAuthor" class="col-sm-2 col-form-label">Автор</label>
                    <div class="col-sm-10">
                        <input  type="text" class="form-control ${(nameError??)?string('is-invalid', '')}"
                                id="inputAuthor" name="author" value="<#if course??>${course.author!''}</#if>"
                                placeholder="Имя автора">
                        <#if authorError??>
                            <div class="invalid-feedback">
                                ${authorError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputAuthorJobTitle" class="col-sm-2 col-form-label">Место работы автора</label>
                    <div class="col-sm-10">
                        <input  type="text" class="form-control ${(nameError??)?string('is-invalid', '')}"
                                id="inputAuthorJobTitle" name="authorJobTitle"
                                value="<#if course??>${course.authorJobTitle!''}</#if>"
                                placeholder="Место работы автора">
                        <#if authorJobTitleError??>
                            <div class="invalid-feedback">
                                ${authorJobTitleError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputAuthorUniversity" class="col-sm-2 col-form-label">Университет автора</label>
                    <div class="col-sm-10">
                        <input  type="text" class="form-control ${(nameError??)?string('is-invalid', '')}"
                                id="inputAuthorUniversity" name="authorUniversity"
                                value="<#if course??>${course.authorUniversity!''}</#if>"
                                placeholder="Университет автора">
                        <#if authorUniversityError??>
                            <div class="invalid-feedback">
                                ${authorUniversityError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputDate" class="col-sm-2 col-form-label">Дата</label>
                    <div class="col-sm-10">
                        <input  type="date" class="form-control ${(nameError??)?string('is-invalid', '')}"
                                id="inputDate" name="date" value="<#if course??>${course.date!''}</#if>"
                                placeholder="Дата курса">
                        <#if dateError??>
                            <div class="invalid-feedback">
                                ${dateError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputVideoSrc" class="col-sm-2 col-form-label">Видео ссылка</label>
                    <div class="col-sm-10">
                        <input  type="text" class="form-control ${(nameError??)?string('is-invalid', '')}"
                                id="inputVideoSrc" name="videoSrc"
                                value="<#if course??>${course.videoSrc!''}</#if>"
                                placeholder="Видео ссылка курса">
                        <#if videoSrcError??>
                            <div class="invalid-feedback">
                                ${videoSrcError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="imageOfCourse" class="col-sm-2 col-form-label">Фото</label>
                    <div class="col-sm-10">
                        <input type="file" id="imageOfCourse" name="imageOfCourse">
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
                <th>Автор</th>
                <th>Дата</th>
                <th>Видео</th>
                <th>Фото</th>
            </tr>
        </thead>
        <tbody>
            <#list courses as course>
                <tr>
                    <th>${course.id?c}</th>
                    <td>${course.name!''}</td>
                    <td>${course.description!''}</td>
                    <td>${course.author!''}|${course.authorJobTitle!''}|${course.authorUniversity!''}</td>
                    <td>${course.getDate()!''}</td>
                    <td><a target="_blank" href="${course.getVideoSrc()!''}">Ссылка</a></td>
                    <td><img width="100" src="/images/${course.getImageSrc()!''}" alt="${course.name!''}"></td>
                    <td>
                        <div class="row justify-content-end">
                            <div class="btn-group mr-3" role="group" aria-label="button group">
                                <a href="#" class="btn btn-outline-warning btn-sm" data-toggle="modal" data-target="#edit${course.id?c}"><i class="fas fa-edit"></i></a>
                                <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="edit${course.id?c}">
                                    <div class="modal-dialog modal-lg modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Изменить</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body justify-content-start">

                                                <form method="post" action="/categories/${category.id?c}/update" enctype="multipart/form-data">
                                                    <div class="form-group row">
                                                        <label for="editName" class="col-sm-2 col-form-label">Название</label>
                                                        <div class="col-sm-10">
                                                            <input  type="text" class="form-control " id="editName" name="name"
                                                                    value="<#if course??>${course.name!''}</#if>" placeholder="Название категории">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="description" class="col-sm-2 col-form-label">Описание</label>
                                                        <div class="col-sm-10">
                                                        <textarea  type="text" class="form-control"
                                                                   id="description" name="description"
                                                                   placeholder="Описание продукта" rows="5">${course.description!''}</textarea>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="editDate" class="col-sm-2 col-form-label">Дата</label>
                                                        <div class="col-sm-10">
                                                            <input  type="date" class="form-control " id="editDate" name="date"
                                                                    value="<#if course??>${course.date!''}</#if>">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="editAuthor" class="col-sm-2 col-form-label">Автор</label>
                                                        <div class="col-sm-10">
                                                            <input  type="text" class="form-control " id="editAuthor" name="author"
                                                                    value="<#if course??>${course.author!''}</#if>" placeholder="Автор">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="editAuthorJobTitle" class="col-sm-2 col-form-label">Место работы автора</label>
                                                        <div class="col-sm-10">
                                                            <input  type="text" class="form-control " id="editAuthorJobTitle" name="authorJobTitle"
                                                                    value="<#if course??>${course.authorJobTitle!''}</#if>" placeholder="Место работы автора">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="editAuthorUniversity" class="col-sm-2 col-form-label">Университет автора</label>
                                                        <div class="col-sm-10">
                                                            <input  type="text" class="form-control " id="editAuthorUniversity" name="authorUniversity"
                                                                    value="<#if course??>${course.authorUniversity!''}</#if>" placeholder="Университет автора">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="editVideoSrc" class="col-sm-2 col-form-label">Видео</label>
                                                        <div class="col-sm-10">
                                                            <input  type="text" class="form-control " id="editVideoSrc" name="videoSrc"
                                                                    value="<#if course??>${course.videoSrc!''}</#if>" placeholder="Видео">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="price" class="col-sm-2 col-form-label">Фото</label>
                                                        <div class="col-sm-10">
                                                            <img width="100" src="/images/${course.imageSrc!''}" alt="${course.name!''}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="imageOfCourse" class="col-sm-2 col-form-label">Новое фото</label>
                                                        <div class="col-sm-10">
                                                            <input type="file" id="imageOfCourse" name="imageOfCourse">
                                                        </div>
                                                    </div>
                                                    <input type="hidden" name="courseId" value="${course.id?c}" />
                                                    <input type="hidden" name="imageSrc" value="${course.imageSrc!''}" />
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

                                <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="del${course.id?c}">
                                    <div class="modal-dialog modal-sm">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Удаление</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <p>Вы хотите удалить категорию &#8220;${course.name}&#8221;. Вы точно уверены?</p>
                                            </div>
                                            <div class="modal-footer">
                                                <form class="form-inline" action="/categories/${category.id?c}/del" method="post">
                                                    <input type="hidden" name="courseId" value="${course.id?c}" />
                                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                    <button type="submit"  class="btn btn-success btn-sm px-3 mr-1">Да</button>
                                                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Нет</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <a href="#"  class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#del${course.id?c}"><i class="far fa-trash-alt"></i></a>

                                <a href="/course/${course.id?c}" class="btn btn-success btn-sm"><i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </td>
                </tr>
            </#list>
        </tbody>
    </table>

</@c.page>