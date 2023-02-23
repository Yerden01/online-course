<#import "parts/common.ftlh" as c>
<#import "parts/pager.ftlh" as p>

<@c.page>
    <div class="row align-items-center justify-content-between mb-4 mx-0">
        <h1 class="h3 mb-0 text-gray-800">Заказы</h1>
        <div class="col-9" id="filter-data">
            <form>
                <div class="row">
                    <div class="col-3">
                        <select class="selectpicker form-control <#if mealsError??>is-invalid</#if>"
                                name="orderState" id="orderState" title="Выберите статус">                                                           data-live-search="true">
                            <#list orderStates as orderState>
                                <option value="${orderState.name()}"
                                    ${(selectedOrderState?? && orderState = selectedOrderState)?then('selected', '')}>
                                    ${orderState.getTitle()}
                                </option>
                            </#list>
                        </select>
                    </div>
                    <div class="col">
                        <input type="date" class="form-control" name="startDate"
                               <#if selectedStartDate??>
                                value="${selectedStartDate}"
                               </#if>
                        >
                    </div>
                    <div class="col">
                        <input type="date" class="form-control" name="endDate"
                                <#if selectedEndDate??>
                                    value="${selectedEndDate}"
                                </#if>
                        >
                    </div>
                    <div class="col">
                        <input autofocus type="text" name="filter"
                               class="form-control" placeholder=""
                                <#if filter??>
                                    value="${filter}"
                                </#if>
                        >
                    </div>
                    <div class="col">
                        <button type="submit" class="btn btn-secondary">Поиск</button>
                        <button type="button" class="btn btn-secondary" title="Очистить фильтр" id="clearFilter">
                            <i class="fas fa-filter"></i>
                        </button>
                    </div>
                </div>
            </form>

        </div>

    </div>

    <table class="table table-striped table-hover">
        <thead>
        <tr>
            <th>#</th>
            <th>Продукты</th>
            <th>Статус</th>
            <th>Время заказа</th>
            <th>Цена</th>
            <th>Количество персон</th>
            <th>Комментарий</th>
            <th>Клиент</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <#list orders.content as order>
            <#assign actualPrice = 0>
            <tr>
                <th>${order.id?c}</th>
                <td>
                    <#if order.combos?size gt 0>
                        Комбо:
                        <ul>
                            <#list order.combos as combo>
                                <li>
                                    ${combo.name!''} - ${combo.price} тг
                                    <#assign actualPrice = actualPrice + combo.price>
                                </li>
                            </#list>
                        </ul>
                    </#if>

                    <#if order.combos?size gt 0 && order.meals?size gt 0>
                        <hr>
                    </#if>

                   <#if order.meals?size gt 0>
                       Отдельные продукты:
                       <ul>
                           <#list order.meals as meal>
                               <li>
                                   ${meal.name!''} (${meal.category.name!''}) - ${meal.price} тг
                                   <#assign actualPrice = actualPrice + meal.price>
                               </li>
                           </#list>
                       </ul>
                    </#if>
                </td>
                <td>
                    ${order.orderState.getTitle()!''}
                </td>
                <td>${order.timestamp?datetime.iso}</td>
                <td>${actualPrice!''} тг.</td>
                <td>${order.personCount!''}</td>
                <td>
                    <#if order.features?has_content>
                        ${order.features}
                    <#else>
                        -
                    </#if>
                </td>
                <td>
                    ${order.client.getName()!''} ${order.client.getSurname()!''}
                    <hr>
                    Аккаунт: @${order.client.getUsername()}
                    <hr>
                    Телефон: ${order.client.getPhoneNumber()!'Телефон скрыт'}
                    <hr>
                    Адрес: ${order.getAddress()!''}
                </td>
                <td>
                    <div class="row justify-content-end">
                        <div class="btn-group mr-3" role="group" aria-label="button group">
                            <a href="#" class="btn btn-outline-warning btn-sm" data-toggle="modal" data-target="#edit${order.id?c}"><i class="fas fa-edit"></i></a>
                            <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="edit${order.id?c}">
                                <div class="modal-dialog modal-lg modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Изменить</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body justify-content-start">

                                            <form method="post" action="orders/update">
                                                <div class="form-group row">
                                                    <label for="orderState" class="col-sm-2 col-form-label">Статус</label>
                                                    <div class="col-sm-10">
                                                        <select class="selectpicker form-control <#if mealsError??>is-invalid</#if>"
                                                                name="orderState" id="orderState" title="Выберите статус">                                                           data-live-search="true">
                                                            <#list orderStates as orderState>
                                                                <option value="${orderState.name()}"
                                                                    ${(orderState = order.orderState)?then('selected', '')}>
                                                                    ${orderState.getTitle()}
                                                                </option>
                                                            </#list>
                                                        </select>
                                                    </div>
                                                </div>
                                                <input type="hidden" name="orderId" value="${order.id?c}" />
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

<#--                            <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="del${combo.id?c}">-->
<#--                                <div class="modal-dialog modal-sm">-->
<#--                                    <div class="modal-content">-->
<#--                                        <div class="modal-header">-->
<#--                                            <h5 class="modal-title">Удаление</h5>-->
<#--                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">-->
<#--                                                <span aria-hidden="true">&times;</span>-->
<#--                                            </button>-->
<#--                                        </div>-->
<#--                                        <div class="modal-body">-->
<#--                                            <p>Вы хотите удалить комбо &#8220;${combo.name}&#8221;. Вы точно уверены?</p>-->
<#--                                        </div>-->
<#--                                        <div class="modal-footer">-->
<#--                                            <form class="form-inline" action="combos/del" method="post">-->
<#--                                                <input type="hidden" name="comboId" value="${combo.id?c}" />-->
<#--                                                <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--                                                <button type="submit"  class="btn btn-success btn-sm px-3 mr-1">Да</button>-->
<#--                                                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Нет</button>-->
<#--                                            </form>-->
<#--                                        </div>-->
<#--                                    </div>-->
<#--                                </div>-->
<#--                            </div>-->
<#--                            <a href="#"  class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#del${combo.id?c}"><i class="far fa-trash-alt"></i></a>-->

                            <#--                                <a href="#" class="btn btn-success btn-sm"><i class="fas fa-arrow-right"></i></a>-->
                        </div>
                    </div>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>
    <script>
        window.Notification.requestPermission();
        <#--let nowOrderCount = parseInt("${orders.size?c}")-->
        let currentTime = new Date().toLocaleString().replace(',','');
        setInterval(function() {
            $.ajax({
                type: "GET",
                url: "/orders/new",
                data: {
                    pointOfDate: currentTime
                },
                success: function(data) {
                    // if (data != nowOrderCount)
                    // location.reload();

                    let response = JSON.parse(data);
                    console.log(response.newOrderCount)

                    if (response.newOrderCount > 0) {
                        var notification = new window.Notification("Новый заказ! Чтобы обновить страницу нажмите на меня)");

                        notification.onclick = function() {
                            location.reload();
                        };
                    }

                },
                error: function(xhr, textStatus) {
                    // alert(textStatus);
                    console.log(textStatus);
                }
            });
        }, 10 * 1000); // 10 * 1000 milsec
    </script>
    <@p.pager "" orders filter!''/>
</@c.page>