<#import "blocks/user.ftlh" as t>
<@t.template>
    <br/>
    <br/>
    PollSCM Check
    <!-- Для Ивана: разделить основную форму и навигацию по страницам, последнюю переместить вниз страницы -->
    <form action = "/" method="get" onsubmit = "searchSubmitActions()">
        Сортировать по цене:
        <input type = "radio" name = "priceSort" value="increasing" id = "increasingChoice" <#if  filters.priceSort ?? && filters.priceSort == "increasing"> checked = "checked" </#if>>
        <label for = "increasingChoice">Цена: по возрастанию</label>
        <input type = "radio" name = "priceSort" value = "decreasing" id = "decreasingChoice" <#if  filters.priceSort ?? && filters.priceSort == "decreasing"> checked = "checked"</#if>>
        <label for = "decreasingChoice">Цена: по убыванию</label>
        <input type = "radio" name = "priceSort" value = "" id = "noneChoice">
        <label for = "noneChoice">Цена: без сортировки</label> <br/>
        Задать диапазон цены:
        <label for = "from">От: </label>
        <div class = "blockFrom" style = "display: inline">
            <input type="number" name = "priceFrom" id = "from" <#if filters.priceFrom ??> value="${filters.priceFrom}" </#if>>
        </div>
        <label for = "to">До: </label>
        <div class = "blockTo" style="display: inline">
            <input type = "number" name = "priceTo" id = "to" <#if  filters.priceTo ??> value="${filters.priceTo}" </#if>> <br/>
        </div>
        Выберите категории товаров: <br />
        <#list categories as category>
            <input type="checkbox" name = "category" value="${category.getCat().title}" id = "${category.getCat().title}Category" path = "category" <#if category.isChecked() == true>checked = "checked"<#else></#if>>
            <label for = "${category.getCat().title}Category">${category.getCat().title}</label>
        </#list>


        <br />
        <input type = "submit" value = "Применить"> <br/>
        <input type = "reset" value = "Сбросить"> <br />
        Навигация по страницам:
        <#assign nop = numberOfPages>
        <#list 1..nop as i>
            <button name = "page" onclick="clearCurrentPage()" value = "${i}">${i}</button>
        </#list>
        <div class = "currentPageBlock">
            <input type = "hidden" name = "page" value="${currentPage}">
        </div>
    </form>

    Привет, тут будет список товаров: <br>
    <#if products??>
        <!--== End Product Area Wrapper ==-->
            <!--== Start Product Area Wrapper ==-->
            <section class="product-area product-default-area">
                <div class="container">
                    <div class="row justify-content-between">
                        <!--== Start Search Results Items ==-->
                        <div class="col-xl-9">
                            <div class="row">
                                <div class="col-12">
                                    <div class="shop-top-bar">
                                        <div class="shop-top-left">
                                            <p class="pagination-line"><a href="#">12</a> продуктов из <a href="#">30</a></p>
                                        </div>
                                        <div class="shop-top-center">
                                            <nav class="product-nav">
                                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                                    <button class="nav-link active" id="nav-grid-tab" data-bs-toggle="tab" data-bs-target="#nav-grid" type="button" role="tab" aria-controls="nav-grid" aria-selected="true"><i class="fa fa-th"></i></button>
                                                    <button class="nav-link" id="nav-list-tab" data-bs-toggle="tab" data-bs-target="#nav-list" type="button" role="tab" aria-controls="nav-list" aria-selected="false"><i class="fa fa-list"></i></button>
                                                </div>
                                            </nav>
                                        </div>
                                        <div class="shop-top-right">
                                            <div class="shop-sort">
                                                <span>Сортировка по:</span>
                                                <select class="form-select" aria-label="Sort select example">
                                                    <option selected>Нет</option>
                                                    <option value="1">Дешевле</option>
                                                    <option value="2">Дороже</option>
                                                    <!--<option value="3">Популярнее</option>-->
                                                    <!--<option value="4">По отзывам</option>-->
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="tab-content" id="nav-tabContent">
                                        <div class="tab-pane fade show active" id="nav-grid" role="tabpanel" aria-labelledby="nav-grid-tab">
                                            <div class="row">
                                                <#list products as product>
                                                <div class="col-sm-6 col-lg-4">

                                                    <!--== Start Product Item ==-->
                                                    <div class="product-item">
                                                        <div class="inner-content">
                                                            <div class="product-thumb">
                                                                <a href="/product/${product.id}">
                                                                    <#if product.images?size == 0>
                                                                        <img src="static/img/no-photo.png" width="270" height="274" alt="Product-Image">
                                                                    <#else>
                                                                        <img src="/images/${product.images[0].id}" width="270" height="274" alt="Product-Image">
                                                                    </#if>
                                                                </a>
                                                                <!--
                                                                <div class="product-flag">
                                                                    <ul>
                                                                        <li class="discount">-10%</li>
                                                                    </ul>
                                                                </div>
                                                                -->
                                                                <div class="product-action">
                                                                    <a class="btn-product-wishlist" href="shop-wishlist.html"><i class="fa fa-heart"></i></a>
                                                                    <form action = "/cart/addProduct" method="post" style="display: inline">
                                                                        <input type = "hidden" name = "_csrf" value = "${_csrf.token}">
                                                                        <input type = "hidden" name = "productId" value="${product.id}">
                                                                        <a class="btn-product-cart" type="submit"><i class="fa fa-shopping-cart"></i></a>
                                                                        <!--<input type = "submit" value = "Добавить товар в корзину">-->
                                                                    </form>
                                                                    <!--<a class="btn-product-compare" href=""><i class="fa fa-random"></i></a>-->
                                                                </div>
                                                                <a class="banner-link-overlay" href=""></a>
                                                            </div>
                                                            <div class="product-info">
                                                                <div class="category">
                                                                    <ul>
                                                                        <li><a href="#"></a></li>
                                                                    </ul>
                                                                </div>
                                                                <h4 class="title"><a href="/product/${product.id}">${product.title}</a></h4>
                                                                <div class="prices">
                                                                    <!--<span class="price-old">${product.price} р.</span>
                                                                    <span class="sep">-</span>-->
                                                                    <span class="price">${product.price} р.</span>
                                                                </div>
                                                                <br>
                                                                <div class="prices short-info">
                                                                    ${product.description}
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                </#list>
                                                <div class="col-12">
                                                    <div class="pagination-items">
                                                        <ul class="pagination justify-content-end mb--0">
                                                            <li><a class="active" href="shop.html">1</a></li>
                                                            <li><a href="shop-four-columns.html">2</a></li>
                                                            <li><a href="shop-three-columns.html">3</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="nav-list" role="tabpanel" aria-labelledby="nav-list-tab">
                                            <div class="row">
                                                <#list products as product>
                                                <div class="col-md-12">
                                                    <!--== Start Product Item ==-->
                                                    <div class="product-item product-list-item">
                                                        <div class="inner-content">
                                                            <div class="product-thumb">
                                                                <a href="/product/${product.id}">
                                                                    <img src="static/img/no-photo.png" width="322" height="360" alt="Product-Image">
                                                                </a>
                                                                <!--
                                                                <div class="product-flag">
                                                                    <ul>
                                                                        <li class="discount">-10%</li>
                                                                    </ul>
                                                                </div>
                                                                -->
                                                                <div class="product-action">
                                                                    <a class="btn-product-wishlist" href="shop-wishlist.html"><i class="fa fa-heart"></i></a>
                                                                    <a class="btn-product-cart" href="shop-cart.html"><i class="fa fa-shopping-cart"></i></a>
                                                                </div>
                                                                <a class="banner-link-overlay" href="shop.html"></a>
                                                            </div>
                                                            <div class="product-info">
                                                                <div class="category">
                                                                    <!--
                                                                    <ul>
                                                                        <li><a href="shop.html">Men</a></li>
                                                                        <li class="sep">/</li>
                                                                        <li><a href="shop.html">Women</a></li>
                                                                    </ul>
                                                                    -->
                                                                </div>
                                                                <h4 class="title"><a href="/product/${product.id}">${product.title}</a></h4>
                                                                <div class="prices">
                                                                    <!--<span class="price-old">$300</span>
                                                                    <span class="sep">-</span>-->
                                                                    <span class="price">${product.price} р.</span>
                                                                </div>
                                                                <p>${product.description}</p>
                                                                <a class="btn-theme btn-sm" href="shop-cart.html">Добавить в корзину</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--== End prPduct Item ==-->
                                                </div>
                                                </#list>
                                                <div class="col-12">
                                                    <div class="pagination-items">
                                                        <ul class="pagination justify-content-end mb--0">
                                                            <li><a class="active" href="shop.html">1</a></li>
                                                            <li><a href="shop-four-columns.html">2</a></li>
                                                            <li><a href="shop-three-columns.html">3</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--== End Search Results Items ==-->
                        <!--== Start Shop Right Sidebar ==-->
                        <div class="col-xl-3">
                            <div class="shop-sidebar">
                                <div class="shop-sidebar-category">
                                    <h4 class="sidebar-title">Выбрать категории</h4>
                                    <div class="sidebar-category">
                                        <ul class="category-list mb--0">
                                            <li><a href="CHANGE.HTML">Test <span>(6)</span></a></li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="shop-sidebar-price-range">
                                    <h4 class="sidebar-title">Сортировать по цене:</h4>
                                    <div class="sidebar-price-range">
                                        <div id="price-range"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--== End Shop Right Sidebar ==-->
                    </div>
                </div>
            </section>


        <br />
    <#else>
        Товаров нет
    </#if>

    <#if user?? && user.email??>

        <#list user.roles as role>
            <#if role == "ROLE_ADMIN">
                Вы - администратор
                <a href = "/adminPanel">Войти в админ-панель</a>
                <#break>
            </#if>
        </#list>
    </#if>

    <script>
        function onSubmitActions(){
            let searchQueryBlock = document.querySelector(".searchQueryBlock");
            let searchQuery = document.querySelector("#searchQuery");
            if (searchQuery.value == ""){
                searchQueryBlock.innerHTML = "";
            }

            let priceFrom = document.querySelector(".blockFrom")
            let fromValue = document.querySelector("#from")
            if (fromValue.value == ""){
                priceFrom.innerHTML = "";
            }

            let priceTo = document.querySelector(".blockTo")
            let toValue = document.querySelector("#to")
            if (toValue.value == ""){
                priceTo.innerHTML = "";
            }
        }
        function clearCurrentPage(){
            let currentPageBlock = document.querySelector(".currentPageBlock");
            currentPageBlock.innerHTML = "";
        }
    </script>

</@t.template>