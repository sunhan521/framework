<#import "../../layout/global.ftl" as global />
<form id="data-form" class="form-horizontal" role="form" callfn="refreshTable"
      action="<@global.api 'sys/menu/'+param.id!''/>">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
        <h4 class="modal-title">${param.id???string('编辑','新建')}</h4>
    </div>
    <div class="modal-body">
        <div class="row">
            <div class="col-md-12">
                <div class="form-body">
                    <div class="form-group">
                        <label class="control-label col-md-3">父菜单名称
                        </label>
                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input id="parentName" type="text" class="form-control"
                                       onclick="showMenu()" readonly/>
                                <input type="hidden" class="form-control" id="parentId" name="parentId"/>
                                <div id="menuContent" class="dropdown-menu">
                                    <div id="menu_select"
                                         data-url=""
                                         class="tree-demo jstree jstree-1 jstree-default"
                                         role="tree" data-callback="loadedJsTree"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">菜单名称<span class="required"> * </span>
                        </label>
                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>

                                <input type="text" class="form-control" name="name" placeholder="请输入菜单名称"/></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">排序
                        </label>
                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" class="form-control" name="sort" placeholder="请输入排序"/></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">链接
                        </label>
                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" class="form-control" name="href" placeholder="请输入链接"/></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">图标
                        </label>
                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" class="form-control" name="icon" placeholder="请输入图标"/></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">是否显示</label>
                        <div class="col-md-5">
                            <div class="mt-radio-inline" data-url="sys/dict/type/yes_no" data-name="show"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">权限标识
                        </label>
                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" class="form-control" name="permission" placeholder="请输入权限标识"/></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">备注
                        </label>
                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" class="form-control" name="remarks" placeholder="请输入备注"/></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn blue">保存</button>
    </div>
</form>



<script type="text/javascript">
    var id = "${param.id!''}";
    $(function () {

        $(".mt-radio-inline").beeRadio();

        loadData();
        $('#data-form').validate({
            rules: {
                name: "required"
            }
        });
    });
    function loadData() {
        var method = "";
        if (id != "") {
            $('#data-form').beeForm("/sys/menu/" + id, function (result) {
                $("#parentName").val(result.data.parentName);
                $("#menu_select").attr("data-url", "sys/menu/jstree/?disableId=" + result.data.id + "&&selectedId=" + result.data.parentId);
                $("#menu_select").beeJsTree();
            });
            method = "PUT";
        } else {
            method = "POST";
            $("#menu_select").attr("data-url", "sys/menu/jstree/");
            $("#menu_select").beeJsTree();
        }

        $('#data-form').attr("method", method);
    }

    function loadedJsTree() {
        $('#menu_select').on("changed.jstree", function (e, data) {
            if (data.action == "select_node") {
                $("#parentName").val(data.node.text);
                $("#parentId").val(data.node.id);
                hideMenu();
            }
        });

    }
    function showMenu() {
        if ($("#menuContent").css("display") == "none") {
            $("#menuContent").slideDown("fast");
        }
        $("body").bind("mousedown", onBodyDown);
    }
    function hideMenu() {
        $("#menuContent").fadeOut("fast");
        $("body").unbind("mousedown", onBodyDown);
    }
    function onBodyDown(event) {
        if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
            hideMenu();
        }
    }
</script>
