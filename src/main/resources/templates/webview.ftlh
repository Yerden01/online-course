<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>DurgerKingBot</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no, viewport-fit=cover" />
    <meta name="format-detection" content="telephone=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="MobileOptimized" content="176" />
    <meta name="HandheldFriendly" content="True" />
    <meta name="robots" content="noindex, nofollow" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous" />
<#--    <script src="/webview-files/js/telegram-webview.js"></script>-->
<#--    <script src="https://tg.dev/js/telegram-web-app.js?17"></script>-->
    <script src="https://telegram.org/js/telegram-web-app.js"></script>
    <script>
        function setThemeClass() {
            document.documentElement.className = Telegram.WebApp.colorScheme;
        }
        Telegram.WebView.onEvent('theme_changed', setThemeClass);
        setThemeClass();
    </script>
    <link href="/webview-files/css/cafe.css" rel="stylesheet">
</head>
<body style="display:none">

<h1 class="cafe-category">Комбо</h1>
<section class="cafe-page cafe-items">
        <#list combos as combo>
            <div class="cafe-item js-item" data-item-id="${combo.getId()}" data-item-price="${combo.getPrice()?c}" data-item-type="combo">
                <div class="cafe-item-counter js-item-counter">1</div>
                <div class="cafe-item-photo">
                    <picture class="cafe-item-lottie js-item-lottie">
                        <img class="cafe-image" src="/images/${combo.getImageSrc()}">
                    </picture>
                </div>
                <div class="cafe-item-label">
                    <span class="cafe-item-title">${combo.getName()}</span>
                    <span class="cafe-item-description">${combo.getDescription()}</span>
                    <span class="cafe-item-price">${combo.getPrice()} <i class="fas fa-tenge"></i></span>
                </div>
                <div class="cafe-item-buttons">
                    <button class="cafe-item-decr-button js-item-decr-btn button-item ripple-handler">
                        <span class="ripple-mask"><span class="ripple"></span></span>
                    </button>
                    <button class="cafe-item-incr-button js-item-incr-btn button-item ripple-handler">
                        <span class="button-item-label">Добавить</span>
                        <span class="ripple-mask"><span class="ripple"></span></span>
                    </button>
                </div>
            </div>
        </#list>
</section>

<#list categories as category>
    <h1 class="cafe-category">${category.name}</h1>
    <section class="cafe-page cafe-items">
        <#list category.getMeals() as meal>
            <div class="cafe-item js-item" data-item-id="${meal.getId()}" data-item-price="${meal.getPrice()?c}" data-item-type="meal">
                <div class="cafe-item-counter js-item-counter">1</div>
                <div class="cafe-item-photo">
                    <picture class="cafe-item-lottie js-item-lottie">
                        <img class="cafe-image" src="/images/${meal.getImageSrc()}">
                    </picture>
                </div>
                <div class="cafe-item-label">
                    <span class="cafe-item-title">${meal.getName()}</span>
                    <span class="cafe-item-description">${meal.getDescription()}</span>
                    <span class="cafe-item-price">${meal.getPrice()} <i class="fas fa-tenge"></i></span>
                </div>
                <div class="cafe-item-buttons">
                    <button class="cafe-item-decr-button js-item-decr-btn button-item ripple-handler">
                        <span class="ripple-mask"><span class="ripple"></span></span>
                    </button>
                    <button class="cafe-item-incr-button js-item-incr-btn button-item ripple-handler">
                        <span class="button-item-label">Добавить</span>
                        <span class="ripple-mask"><span class="ripple"></span></span>
                    </button>
                </div>
            </div>
        <#else>
            <div class="center-text">Пусто</div>
        </#list>
    </section>
</#list>
<br><br>
<section>
    <div class="cafe-item-shadow"></div>
    <div class="cafe-item-shadow"></div>
    <div class="cafe-item-shadow"></div>
    <div class="cafe-item-shadow"></div>
</section>
<section class="cafe-page cafe-order-overview">
    <div class="cafe-block">
        <div class="cafe-order-header-wrap">
            <h2 class="cafe-order-header">Ваш заказ</h2>
            <span class="cafe-order-edit js-order-edit">Изменить заказ</span>
        </div>
        <div class="cafe-order-items">
<#--            <div class="cafe-order-item js-order-item" data-item-id="1">-->
<#--                <div class="cafe-order-item-photo">-->
<#--                    <picture class="cafe-item-lottie js-item-lottie">-->
<#--                        <img src="/webview-files/img/cafe/Burger_148.png" style="background-image: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB2aWV3Qm94PSIwIDAgNTEyIDUxMiI+PGRlZnM+PGxpbmVhckdyYWRpZW50IGlkPSJnIiB4MT0iLTMwMCUiIHgyPSItMjAwJSIgeTE9IjAiIHkyPSIwIj48c3RvcCBvZmZzZXQ9Ii0xMCUiIHN0b3Atb3BhY2l0eT0iLjEiLz48c3RvcCBvZmZzZXQ9IjMwJSIgc3RvcC1vcGFjaXR5PSIuMDciLz48c3RvcCBvZmZzZXQ9IjcwJSIgc3RvcC1vcGFjaXR5PSIuMDciLz48c3RvcCBvZmZzZXQ9IjExMCUiIHN0b3Atb3BhY2l0eT0iLjEiLz48YW5pbWF0ZSBhdHRyaWJ1dGVOYW1lPSJ4MSIgZnJvbT0iLTMwMCUiIHRvPSIxMjAwJSIgZHVyPSIzcyIgcmVwZWF0Q291bnQ9ImluZGVmaW5pdGUiLz48YW5pbWF0ZSBhdHRyaWJ1dGVOYW1lPSJ4MiIgZnJvbT0iLTIwMCUiIHRvPSIxMzAwJSIgZHVyPSIzcyIgcmVwZWF0Q291bnQ9ImluZGVmaW5pdGUiLz48L2xpbmVhckdyYWRpZW50PjwvZGVmcz48cGF0aCBmaWxsPSJ1cmwoI2cpIiBkPSJNMjY4LDQ5OWMtNTEtMi0xMDYtMS0xNTMtMjItMjgtMTItMzktNDAtNDItNjgsMC00LDMtNywxLTEwLTUtNi0xNiwzLTEzLTE0LDItMTEsMTItMTQsMTEtMjcsMC0yLTUtMTItNS0xNiwwLTYsNS0xNyw0LTIyLTItNy05LTUtNi0xNSwzLTEwLDE0LTcsMTktMTMsNy0xMi0xNC0yNC0xNy0zMy0zLTEyLTEtMjgsMi0zOSwyOC0xMDEsMTQ4LTEzMywyMzktMTE1LDY0LDEzLDEzMCw1OSwxNDIsMTI3LDMsMTgsMCwzMi0xNSw0Mi0xLDEtMTEsMTMtNywxNiw0LDIsMjAsNCwyMiw5LDYsMTAtNywxNS05LDIyLTEsMywzLDExLDMsMTYsMCwyLTMsMTctMiwxOSwyLDIsOCwxLDEwLDQsMyw1LDQsMTYsNiwyMiw0LDEzLTE1LDIwLTE5LDI3LTksMjAsNSw0MC0yMyw2MC00MCwyOC0xMDEsMjktMTQ4LDMweiIvPjwvc3ZnPg==');">-->
<#--                    </picture>-->
<#--                </div>-->
<#--                <div class="cafe-order-item-label">-->
<#--                    <div class="cafe-order-item-title">Burger <span class="cafe-order-item-counter"><span class="js-order-item-counter">1</span>x</span></div>-->
<#--                    <div class="cafe-order-item-description">Meat™</div>-->
<#--                </div>-->
<#--                <div class="cafe-order-item-price js-order-item-price">$4.99</div>-->
<#--            </div>-->
        </div>
        <div class="cafe-order-item js-order-item selected">
            <div class="cafe-order-item-total-label">
                Сумма:
            </div>
            <div class="cafe-order-item-price">
                <span class="js-order-item-total-price">2590</span>
                <i class="fas fa-tenge"></i></div>
        </div>
    </div>
    <div class="cafe-text-field-wrap">
        <div>
            <textarea class="cafe-text-field-required cafe-text-field js-order-street-field cafe-block" rows="1"
                      placeholder="Улица*"></textarea>
        </div>
        <div style="display: flex">
            <div style="flex: 60%">
                <textarea class="cafe-text-field-required cafe-text-field js-order-home-field cafe-block" rows="1"
                          placeholder="Дом/Офис*"></textarea>
            </div>
            <div style="flex: 40%">
                <textarea class="cafe-text-field js-order-apartment-field cafe-block cafe-block-left" rows="1"
                          placeholder="Квартира"></textarea>
            </div>
        </div>
        <div>
            <textarea class="cafe-text-field js-order-map-link-field cafe-block" rows="1"
                      placeholder="Ссылка на 2GIS"></textarea>
        </div>
<#--        <textarea class="cafe-text-field-required cafe-text-field js-order-address-field cafe-block" rows="1" placeholder="Напишите ваш адрес*"></textarea>-->
        <div class="cafe-text-field-hint">
            Если не сложно, оставьте ссылку на 2GIS, чтобы мы смогли найти вас еще легче 😉
        </div>
    </div>
    <div class="cafe-text-field-wrap">
        <input type="number" class="cafe-text-field js-order-person-count-field cafe-block" placeholder="Количество персон">
    </div>
    <div class="cafe-text-field-wrap">
        <textarea class="cafe-text-field js-order-comment-field cafe-block" rows="1" placeholder="Добавить комментарий..."></textarea>
        <div class="cafe-text-field-hint">
            Любые особые пожелания, детали и т.д.
        </div>
    </div>
</section>
<div class="cafe-status-wrap">
    <div class="cafe-status js-status"></div>
</div>
<script src="/webview-files/js/jquery.min.js"></script>
<script src="/webview-files/js/tgsticker.js"></script>
<script src="/webview-files/js/cafe.js"></script>
<script>Cafe.init({"apiUrl":"/webview/make-order","userId":0,"userHash":null, "debug": false});</script>
</body>
</html>
