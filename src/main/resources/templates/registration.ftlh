<#import "blocks/user.ftlh" as t>
<@t.template>
<main class="main-content">
    <!--== Start My Account Area Wrapper ==-->
    <section class="account-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 m-auto">
                    <div class="section-title text-center">
                        <h2 class="title">Зарегистрироваться</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="register-form-content">
                        <#if userExistError??>
                            <div class="col-12 pt-3">
                                <div class="card special-card alert-danger">
                                    <h3>
                                        <i class="fa fa-info-circle"></i>
                                        ${userExistError}
                                    </h3>
                                </div>
                            </div>
                        <#else>
                        </#if>
                        <form id="register-form" action="/registration" method="post">
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="username">Адрес электрнной почты: <span class="required">*</span></label>
                                        <input id="username" class="form-control" type="email" name="email">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="password">Пароль: <span class="required">*</span></label>
                                        <input id="password" class="form-control" type="password" name="password">
                                    </div>
                                </div>
                                <input type="hidden" name ="_csrf" value="${_csrf.token}">
                                <div class="col-12">
                                    <div class="form-group mb--0">
                                        <a class="btn-register submit" href="#" onclick="a_submit('register-form'); return false;">Зарегистрироваться</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="col-12 pt-3">
                            <div class="card special-card">
                                <h3>
                                    <i class="fa fa-info-circle"></i>
                                    Уже есть аккаунт?
                                    <a href="/login">Войдите!</a>
                                </h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--== End My Account Area Wrapper ==-->
</main>
</@t.template>