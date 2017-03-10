<#import "/spring.ftl" as spring/>
<#macro basePath>${absPath!'/'}</#macro>
<#assign ossPath ='http://idle-data.oss-cn-shanghai.aliyuncs.com/assets/'/>
<#--metric插件-->
<#macro importOSSPlugin(pathList...)>
    <#list pathList as path>
        <#if path?ends_with('js')>
        <script src="${ossPath}${path}" type="text/javascript"></script>
        </#if>
        <#if path?ends_with('css')>
        <link href="${ossPath}${path}" rel="stylesheet" type="text/css"/>
        </#if>
    </#list>
</#macro>


<#--插件-->
<#macro importPlugin(pathList...)>
    <#list pathList as path>
        <#if path?ends_with('js')>
        <script src="<@basePath/>${path}" type="text/javascript"></script>
        </#if>
        <#if path?ends_with('css')>
        <link href="<@basePath/>${path}" rel="stylesheet" type="text/css"/>
        </#if>
    </#list>
</#macro>
<#-- 此处是公用的引入-->

<#macro importCss()>

    <@importOSSPlugin
    <#-- BEGIN GLOBAL MANDATORY STYLES -->
    "global/plugins/font-awesome/css/font-awesome.min.css",
    "global/plugins/simple-line-icons/simple-line-icons.min.css",
    "global/plugins/bootstrap/css/bootstrap.min.css",
    "global/plugins/bootstrap-switch/css/bootstrap-switch.min.css",

    <#-- BEGIN PAGE LEVEL PLUGINS -->

    "global/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css",
    "global/plugins/bootstrap-modal/css/bootstrap-modal.css",
    "global/plugins/bootstrap-sweetalert/sweetalert.css",

    "global/plugins/select2/css/select2.min.css",

    "global/plugins/datatables/datatables.min.css",
    "global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css",

    "global/plugins/jstree/dist/themes/default/style.min.css",
    <#-- BEGIN THEME GLOBAL STYLES -->
    "global/css/components-rounded.min.css",
    "global/css/plugins.min.css",

    <#-- BEGIN THEME LAYOUT STYLES -->
    "layouts/layout2/css/layout.min.css",
    "layouts/layout2/css/themes/blue.min.css",
    "layouts/layout2/css/custom.min.css"
    />
    <@importPlugin
    "plugins/treegrid/css/jquery.treegrid.css"
    "css/override.css",
    "css/style.css"
    />
</#macro>

<#-- 此处是公用的引入-->
<#macro importRequest()>
<!--[if lt IE 9]>
    <@importOSSPlugin
    "global/plugins/respond.min.js",
    "global/plugins/excanvas.min.js",
    "global/plugins/ie8.fix.min.js",
    "global/plugins/jquery.min.js"
    />
<![endif]-->
    <@importOSSPlugin
    "global/plugins/jquery.min.js",
    "global/plugins/bootstrap/js/bootstrap.min.js",
    "global/plugins/js.cookie.min.js",
    "global/plugins/jquery-slimscroll/jquery.slimscroll.min.js",
    "global/plugins/jquery.blockui.min.js",
    "global/plugins/bootstrap-switch/js/bootstrap-switch.min.js",

    "global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js",
    "global/plugins/bootstrap-modal/js/bootstrap-modal.js",
    "global/plugins/bootstrap-sweetalert/sweetalert.min.js",

    "global/plugins/jquery-validation/js/jquery.validate.min.js",
    "global/plugins/jquery-validation/js/additional-methods.min.js",
    "global/plugins/jquery-validation/js/localization/messages_zh.min.js"


    "global/scripts/datatable.js",
    "global/plugins/datatables/datatables.min.js",
    "global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js"


    "global/plugins/select2/css/select2-bootstrap.min.css",
    "global/plugins/select2/js/select2.full.min.js"


    "global/plugins/jstree/dist/jstree.min.js"

    "global/scripts/app.min.js",
    "layouts/layout2/scripts/layout.js",
    "layouts/layout2/scripts/demo.js",
    "layouts/global/scripts/quick-sidebar.min.js",
    "layouts/global/scripts/quick-nav.min.js"/>

    <@importPlugin
    "js/jquery/jquery.form.js"

    "plugins/treegrid/js/jquery.treegrid.js",
    "plugins/treegrid/js/jquery.treegrid.bootstrap3.js"

    "js/framework/framework.common.js",
    "js/admin.js",
    "js/framework/framework.delegate.js",
    "js/framework/framework.ext.js",
    "js/framework/framework.validate.js"
    />
<script type="text/javascript">basePath = "<@basePath/>";</script>
</#macro>

<#macro importFontIcon>
    <@resources "icons/css/font-awesome.min.css"/>
</#macro>
<#--资源文件-->
<#macro resources(paths...)>
    <#list paths as path>
        <#if path?ends_with("js")>
        <script src="<@basePath/>${path}" type="text/javascript"></script>
        </#if>
        <#if path?ends_with('css')>
        <link href="<@basePath/>${path}" rel="stylesheet" type="text/css"/>
        </#if>
    </#list>
</#macro>
<#macro img(path,class)>
<img src="<@basePath/>ui/resources/${path}" class="${class}"/>
</#macro>

<#macro pluginUrl(uri)><@basePath/>ui/plugins/${uri}</#macro>
<#macro api(uri)><@basePath/>${uri}</#macro>
