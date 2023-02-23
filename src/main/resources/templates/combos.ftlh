<#import "parts/common.ftlh" as c>

<@c.page>
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Комбо</h1>
        <#--        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">-->
        <#--            <i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>-->
        <a class="btn btn-outline-info btn-circle mr-2" data-toggle="collapse"
           href="#collapseExample" role="button" aria-expanded="false"
           aria-controls="collapseExample">
            <i class="fas fa-plus"></i>
        </a>
    </div>

    <div class="collapse <#if combo??>show </#if>" id="collapseExample">
        <div class="text-info text-right mx-1 mb-2">Добавить комбо</div>
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
                                id="inputName" name="name" value="<#if combo??>${combo.name!''}</#if>"
                                placeholder="Название продукта">
                        <#if nameError??>
                            <div class="invalid-feedback">
                                ${nameError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="meals" class="col-sm-2 col-form-label">Продукты</label>
                    <div class="col-sm-10">
                        <select class="selectpicker form-control <#if mealsError??>is-invalid</#if>"
                                name="meals" id="meals" title="Выберите продукты" multiple
                                data-live-search="true">
                            <#list meals as meal>
                                <option data-subtext="${meal.category.name}" value="${meal.id?c}"
                                        <#if combo??>
                                            <#list combo.meals as combo_meal>
                                                ${(combo_meal.id?c = meal.id?c)?then('selected', '')}
                                            </#list>
                                        </#if> >
                                     ${meal.name}
                                </option>
                            </#list>
                        </select>
                        <#if mealsError??>
                            <div class="invalid-feedback">
                                ${mealsError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="description" class="col-sm-2 col-form-label">Описание</label>
                    <div class="c ol-sm-10">
                        <textarea  type="text" class="form-control ${(descriptionError??)?string('is-invalid', '')}"
                                   id="description" name="description"
                                   placeholder="Описание продукта" rows="5"><#if combo??>${combo.description!''}</#if></textarea>
                        <#if descriptionError??>
                            <div class="invalid-feedback">
                                ${descriptionError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="price" class="col-sm-2 col-form-label">Цена</label>
                    <div class="col-sm-10">
                        <input  type="number" class="form-control ${(priceError??)?string('is-invalid', '')}"
                                id="price" name="price" value="<#if meal??>${meal.price!''}</#if>"
                                placeholder="Цена">
                        <#if priceError??>
                            <div class="invalid-feedback">
                                ${priceError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="imageOfCombo" class="col-sm-2 col-form-label">Фото</label>
                    <div class="col-sm-10">
                        <input type="file" id="imageOfCombo" name="imageOfCombo">
                    </div>
                </div>

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
            <th>Продукты</th>
            <th>Описание</th>
            <th>Цена</th>
            <th>Фото</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <#list combos as combo>
            <tr>
                <th>${combo.id?c}</th>
                <td>${combo.name!''}</td>
                <td>
                    <ul>
                        <#assign actualPrice = 0>
                        <#list combo.meals as meal>
                            <li>
                                ${meal.name!''} (${meal.category.name!''}) - ${meal.price} тг
                                <#assign actualPrice = actualPrice + meal.price>
                            </li>
                        </#list>
                        <hr>
                        Общая цена - ${actualPrice} тг
                    </ul>
                </td>
                <td>${combo.description!''}</td>
                <td>${combo.price!''}</td>
                <td>
                    <img width="100" src="/images/${combo.imageSrc!''}" alt="${combo.name!''}">
                </td>
                <td>
                    <div class="row justify-content-end">
                        <div class="btn-group mr-3" role="group" aria-label="button group">
                            <a href="#" class="btn btn-outline-warning btn-sm" data-toggle="modal" data-target="#edit${combo.id?c}"><i class="fas fa-edit"></i></a>
                            <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="edit${combo.id?c}">
                                <div class="modal-dialog modal-lg modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Изменить</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body justify-content-start">

                                            <form method="post" action="combos/update" enctype="multipart/form-data">
                                                <div class="form-group row">
                                                    <label for="editName" class="col-sm-2 col-form-label">Название</label>
                                                    <div class="col-sm-10">
                                                        <input  type="text" class="form-control " id="editName" name="name"
                                                                value="${combo.name!''}" placeholder="Название категории">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="meals" class="col-sm-2 col-form-label">Продукты</label>
                                                    <div class="col-sm-10">
                                                        <select class="selectpicker form-control <#if mealsError??>is-invalid</#if>"
                                                                name="meals" id="meals" title="Выберите продукты" multiple
                                                                data-live-search="true">
                                                            <#list meals as meal>
                                                                <option data-subtext="${meal.category.name}" value="${meal.id?c}"
                                                                        <#if combo??>
                                                                            <#list combo.meals as combo_meal>
                                                                                ${(combo_meal.id?c = meal.id?c)?then('selected', '')}
                                                                            </#list>
                                                                        </#if> >
                                                                    ${meal.name}
                                                                </option>
                                                            </#list>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="description" class="col-sm-2 col-form-label">Описание</label>
                                                    <div class="col-sm-10">
                                                        <textarea  type="text" class="form-control"
                                                                   id="description" name="description"
                                                                   placeholder="Описание продукта" rows="5">${combo.description!''}</textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="price" class="col-sm-2 col-form-label">Цена</label>
                                                    <div class="col-sm-10">
                                                        <input  type="number" class="form-control"
                                                                id="price" name="price" value="${combo.price?c}"
                                                                placeholder="Цена">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="price" class="col-sm-2 col-form-label">Фото</label>
                                                    <div class="col-sm-10">
                                                        <img width="100" src="/images/${combo.imageSrc!''}" alt="${combo.name!''}">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="imageOfCombo" class="col-sm-2 col-form-label">Новое фото</label>
                                                    <div class="col-sm-10">
                                                        <input type="file" id="imageOfCombo" name="imageOfCombo">
                                                    </div>
                                                </div>
                                                <input type="hidden" name="comboId" value="${combo.id?c}" />
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

                            <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="del${combo.id?c}">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Удаление</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Вы хотите удалить комбо &#8220;${combo.name}&#8221;. Вы точно уверены?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <form class="form-inline" action="combos/del" method="post">
                                                <input type="hidden" name="comboId" value="${combo.id?c}" />
                                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                <button type="submit"  class="btn btn-success btn-sm px-3 mr-1">Да</button>
                                                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Нет</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a href="#"  class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#del${combo.id?c}"><i class="far fa-trash-alt"></i></a>

                            <#--                                <a href="#" class="btn btn-success btn-sm"><i class="fas fa-arrow-right"></i></a>-->
                        </div>
                    </div>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>

</@c.page>