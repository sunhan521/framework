<#import "/spring.ftl" as spring/>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<#assign ossPath ='http://idle-data.oss-cn-shanghai.aliyuncs.com/assets/'/>
<head>
    <meta charset="utf-8"/>
    <title>后台通用管理框架</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="后台通用管理框架"
          name="description"/>
    <meta content="Han.Sun" name="author"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="${ossPath}global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ossPath}global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ossPath}global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ossPath}global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <link href="${ossPath}global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ossPath}global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN THEME GLOBAL STYLES -->
    <link href="${ossPath}global/css/components-rounded.min.css" rel="stylesheet" id="style_components" type="text/css"/>
    <link href="${ossPath}global/css/plugins.min.css" rel="stylesheet" type="text/css"/>
    <!-- END THEME GLOBAL STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="${ossPath}pages/css/login-4.min.css" rel="stylesheet" type="text/css"/>
    <!-- END PAGE LEVEL STYLES -->
    <!-- BEGIN THEME LAYOUT STYLES -->
    <!-- END THEME LAYOUT STYLES -->
    <link rel="shortcut icon" href="favicon.ico"/>
</head>
<style type="text/css">
    .login .content .form-actions {
        padding-bottom: 0px;
    }
</style>
<!-- END HEAD -->

<body class=" login">
<!-- BEGIN LOGO -->
<div class="logo">
    <a href="index.html">
        <img src="${ossPath}pages/img/logo-big.png" alt=""/> </a>
</div>
<!-- END LOGO -->
<!-- BEGIN LOGIN -->
<div class="content">
    <!-- BEGIN LOGIN FORM -->
    <form class="login-form" action="/login" method="post">
        <h3 class="form-title">账户登录</h3>
        <div class="alert alert-danger display-hide">
            <button class="close" data-close="alert"></button>
            <span> 请输入正确的用户名和密码. </span>
        </div>
    <#if RequestParameters.error??>
        <div class="alert alert-danger">
            <button class="close" data-close="alert"></button>
            <span> 请输入正确的用户名和密码. </span>
        </div>
    </#if>
        <div class="form-group">
            <!--ie8, ie9 不支持html5 placeholder-->
            <label class="control-label visible-ie8 visible-ie9">用户名：</label>
            <div class="input-icon">
                <i class="fa fa-user"></i>
                <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="用户名"
                       name="username"/></div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">密码：</label>
            <div class="input-icon">
                <i class="fa fa-lock"></i>
                <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="密码"
                       name="password"/></div>
        </div>
        <div class="form-actions">
            <label class="rememberme mt-checkbox mt-checkbox-outline">
                <input type="checkbox" name="remember" value="1"/> 记住我
                <span></span>
            </label>
            <button type="submit" class="btn green pull-right"> 登录</button>
        </div>
        <div class="login-options" style="display:none">
            <h4>Or login with</h4>
            <ul class="social-icons">
                <li>
                    <a class="facebook" data-original-title="facebook" href="javascript:;"> </a>
                </li>
                <li>
                    <a class="twitter" data-original-title="Twitter" href="javascript:;"> </a>
                </li>
                <li>
                    <a class="googleplus" data-original-title="Goole Plus" href="javascript:;"> </a>
                </li>
                <li>
                    <a class="linkedin" data-original-title="Linkedin" href="javascript:;"> </a>
                </li>
            </ul>
        </div>
        <div class="create-account">
            <a href="javascript:;" id="forget-password">重置密码 </a> <a href="javascript:;" id="register-btn"
                                                                     style="float:right"> 创建账户 </a>
        </div>
    </form>
    <!-- END LOGIN FORM -->
    <!-- BEGIN FORGOT PASSWORD FORM -->
    <form class="forget-form" action="index.html" method="post">
        <h3>忘记密码?</h3>
        <p>输入您的邮箱地址，找回密码
        </p>
        <div class="form-group">
            <div class="input-icon">
                <i class="fa fa-envelope"></i>
                <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="邮箱"
                       name="email"/></div>
        </div>
        <div class="form-actions">
            <button type="button" id="back-btn" class="btn red btn-outline">后退</button>
            <button type="submit" class="btn green pull-right"> 提交</button>
        </div>
    </form>
    <!-- END FORGOT PASSWORD FORM -->
    <!-- BEGIN REGISTRATION FORM -->
    <form class="register-form" action="index.html" method="post">
        <h3>注册</h3>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">登录名</label>
            <div class="input-icon">
                <i class="fa fa-user"></i>
                <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="登录名"
                       name="username"/></div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">密码</label>
            <div class="input-icon">
                <i class="fa fa-lock"></i>
                <input class="form-control placeholder-no-fix" type="password" autocomplete="off" id="register_password"
                       placeholder="密码" name="password"/></div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">确认密码</label>
            <div class="controls">
                <div class="input-icon">
                    <i class="fa fa-check"></i>
                    <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="确认密码"
                           name="rpassword"/></div>
            </div>
        </div>
        <div class="form-group">
            <label class="mt-checkbox mt-checkbox-outline">
                <input type="checkbox" name="tnc"/>我同意
                <a href="javascript:;">服务条款 </a> &
                <a href="javascript:;">隐私政策 </a>
                <span></span>
            </label>
            <div id="register_tnc_error"></div>
        </div>
        <div class="form-actions">
            <button id="register-back-btn" type="button" class="btn red btn-outline"> 退回</button>
            <button type="submit" id="register-submit-btn" class="btn green pull-right"> 注册</button>
        </div>
    </form>
    <!-- END REGISTRATION FORM -->
</div>
<!-- END LOGIN -->
<!-- BEGIN COPYRIGHT -->
<div class="copyright"> 2017 &copy;后台管理系统.</div>
<!-- END COPYRIGHT -->
<!--[if lt IE 9]>
<script src="${ossPath}global/plugins/respond.min.js"></script>
<script src="${ossPath}global/plugins/excanvas.min.js"></script>
<script src="${ossPath}global/plugins/ie8.fix.min.js"></script>
<![endif]-->
<!-- BEGIN CORE PLUGINS -->
<script src="${ossPath}global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${ossPath}global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${ossPath}global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="${ossPath}global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${ossPath}global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${ossPath}global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${ossPath}global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ossPath}global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="${ossPath}global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
<script src="${ossPath}global/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<script src="${ossPath}global/scripts/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="js/login.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME LAYOUT SCRIPTS -->
<!-- END THEME LAYOUT SCRIPTS -->

<script>
    // init background slide images
    $.backstretch([
                "${ossPath}pages/media/bg/1.jpg",
                "${ossPath}pages/media/bg/2.jpg",
                "${ossPath}pages/media/bg/3.jpg",
                "${ossPath}pages/media/bg/4.jpg"
            ], {
                fade: 1000,
                duration: 8000
            }
    );
</script>
</body>

</html>