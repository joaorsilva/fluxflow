    <div>
        <a class="hiddenanchor" id="signup"></a>
        <a class="hiddenanchor" id="signin"></a>
        <a class="hiddenanchor" id="forgot"></a>

        <div class="login_wrapper">
            <div class="animate form login_form">
                <div class="product-name">
                    <h1><img src="/img/logo_60x44.png" width="60" height="44" alt="Flux Flow logo"> Flux Flow</h1>
                </div>
                <section class="login_content">
                    <form id="login-form" method="post" action="/api/login">
                        <h1>Login Form</h1>
                        <div class="item form-group">
                            <input type="email" id="login-email" name="email" data-validate-linked="email" data-validate-length="3,250" class="form-control" placeholder="Email" required="required" />
                        </div>
                        <div class="item form-group">
                            <input type="password" id="login-password" name="password" data-validate-length="6,100" class="form-control" placeholder="Password" required="required" />
                        </div>
                        <div id="login-error" class="user-error hidden">
                        </div>
                        <div>
                            <a class="btn btn-default submit" href="javascript:void(0);">Log in</a>
                        </div>
                        <div class="clearfix"></div>
                        <div class="separator">
                            <p class="change_link">
                                <a href="#signup" class="to_register"> Create Account </a>
                                <a href="#forgot" class="to_register"> Lost your password? </a>
                            </p>
                            <div class="clearfix"></div>
                            <br />
                            <div>
                                <p>©2017 All Rights Reserved. SPAGI Systems, Ltd.</p>
                                <p>Privacy and Terms</p>
                            </div>
                        </div>
                    </form>
                </section>
            </div>
            <div id="register" class="animate form registration_form">
                <div class="product-name">
                    <h1><img src="/img/logo_60x44.png" width="60" height="44" alt="Flux Flow logo"> Flux Flow</h1>
                </div>
                <section class="login_content">
                    <form>
                        <h1>Create Account</h1>
                        <div>
                            <input type="email" class="form-control" placeholder="Email" required="required" />
                        </div>
                        <div>
                            <input type="password" class="form-control" placeholder="Password" required="required" />
                        </div>
                        <div>
                            <a class="btn btn-default submit" href="index.html">Submit</a>
                        </div>
                        <div class="clearfix"></div>
                        <div class="separator">
                            <p class="change_link">
                                <a href="#signin" class="to_register"> Log in </a>
                              </p>
                            <div class="clearfix"></div>
                            <br />
                            <div>
                                <p>©2017 All Rights Reserved. SPAGI Systems, Ltd.</p>
                                <p>Privacy and Terms</p>
                            </div>
                        </div>
                    </form>
                </section>
            </div>
            <div id="forgot" class="animate form forgot_form">
                <div class="product-name">
                    <h1><img src="/img/logo_60x44.png" width="60" height="44" alt="Flux Flow logo"> Flux Flow</h1>
                </div>
                <section class="login_content">
                    <form>
                        <h1>Password Recovery</h1>
                        <div>
                            <input type="email" class="form-control" placeholder="Email" required="required" />
                        </div>
                        <div>
                            <a class="btn btn-default submit" href="index.html">Submit</a>
                        </div>
                        <div class="clearfix"></div>
                        <div class="separator">
                            <p class="change_link">
                                <a href="#signin" class="to_register"> Log in </a>
                            </p>
                            <div class="clearfix"></div>
                            <br />
                            <div>
                                <p>©2017 All Rights Reserved. SPAGI Systems, Ltd.</p>
                                <p>Privacy and Terms</p>
                            </div>
                        </div>
                    </form>
                </section>
            </div>
        </div>
    </div>