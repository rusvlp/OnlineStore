<#import "blocks/user.ftlh" as t>
<@t.template>
    <!--== Start My Account Area Wrapper ==-->
    <section class="account-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 m-auto">
                    <div class="section-title text-center">
                        <h2 class="title">Войти</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="login-form-content">
                        <form id="login-form" action="/login" method="post">
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="username">Адрес электронной почты: <span class="required">*</span></label>
                                        <input id="username" name="username" class="form-control" type="text">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="password">Пароль: <span class="required">*</span></label>
                                        <input id="password" name="password" class="form-control" type="password">
                                    </div>
                                </div>
                                <input type="hidden" name = "_csrf" value="${_csrf.token}">
                                <div class="col-12">
                                    <div class="form-group">
                                        <a class="btn-login submit" href="#" onclick="a_submit('login-form'); return false;">Войти</a>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group account-info-group mb--0">
                                        <div class="rememberme-account">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                                                <label class="form-check-label" for="defaultCheck1">Запомнить меня</label>
                                            </div>
                                        </div>
                                        <a class="lost-password" href="#/">Забыли пароль?</a>
                                    </div>
                                </div>
                                <div class="col-12 pt-3">
                                    <div class="card special-card">
                                        <h3>
                                            <i class="fa fa-info-circle"></i>
                                            Нет аккаунта?
                                            <a href="/registration">Зарегистрироваться</a>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</@t.template>