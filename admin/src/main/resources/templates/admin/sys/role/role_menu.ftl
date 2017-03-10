<#import "../../layout/global.ftl" as global />
<div id="data-form">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
        <h4 class="modal-title">${param.id???string('编辑','新建')}</h4>
    </div>
    <div class="modal-body">
        <div class="row">
            <div class="col-md-12">
                <div class="form-body">
                    <div id="role_menu" style="overflow: auto;height: 400px;"
                         data-url="<@global.api 'sys/menu/jstree/'+param.id!''/>" data-callback="loadedJsTree" data-open="true"
                         class="tree-demo jstree jstree-1 jstree-default"
                         role="tree" data-check="true">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn default" data-dismiss="modal">关闭</button>
        <button class="btn blue" onclick="saveRoleMenu()" >保存</button>
    </div>
</div>
<script type="text/javascript">
    var id = "${param.id!''}";
    $("#role_menu").beeJsTree();


    function loadedJsTree(data) {
        $('#role_menu').bind("loaded.jstree", function (event, data) {
            $('#role_menu').jstree("open_all");
        });
    }
    function loadData() {
        if (id != "") {
            $('#data-form').beeForm("/sys/roleMenu/" + id);
        }
    }

    function saveRoleMenu() {
        $.post("sys/role/roleMenu/" + id, {menuIds: $('#role_menu').jstree("get_selected").join(",")}, function (data) {
            $("#data-form").find("*[data-dismiss='modal']").click();
        });
    }
</script>
