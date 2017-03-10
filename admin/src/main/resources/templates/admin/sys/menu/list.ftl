<#import "../../layout/global.ftl" as global />
<div class="row">
    <div class="col-md-12">
        <div style="float:left;width: 250px;margin-right: 20px;">
            <div class="portlet light ">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-social-dribbble font-blue-sharp"></i>
                        <span class="caption-subject font-blue-sharp bold uppercase">菜单列表</span>
                    </div>
                    <div class="actions">
                    </div>
                </div>
                <div class="portlet-body">
                    <div id="menu_tree" data-url="sys/menu/jstree/" class="tree-demo jstree jstree-1 jstree-default"  data-open="true"
                         role="tree"></div>
                </div>
            </div>
        </div>
        <div style="overflow: hidden;">
            <div class="portlet light">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-social-dribbble font-blue-sharp"></i>
                        <span class="caption-subject font-blue-sharp bold uppercase">数据列表</span>
                    </div>
                    <div class="actions">
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-toolbar">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="btn-group">
                                    <button class="btn sbold green btn-add" data-url="admin/sys/menu/save.html"
                                            data-toggle="modal">新增
                                        <i class="fa fa-plus"></i>
                                    </button>
                                </div>
                                <div class="btn-group">
                                    <button class="btn sbold green"
                                            data-url="<@global.api 'sys/menu/batchDelete'/>" data-batch="true"
                                            data-msg="确定批量删除吗？" data-model="ajaxDelete" data-callback="refreshTable">
                                        批量删除
                                        <i class="fa fa-times"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="table-scrollable">
                        <table class="table table-striped table-bordered table-hover table-checkable order-column"
                               id="bee_table">
                            <thead>
                            <tr>
                                <th data-field="id">
                                    <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                        <input type="checkbox" class="group-checkable" data-set="#bee_table .checkboxes"
                                               id="defaultCheck"/>
                                        <span></span>
                                    </label>
                                </th>
                                <th data-field="name" style="min-width: 145px;">菜单名称</th>
                                <th data-field="sort">排序</th>
                                <th data-field="href">链接</th>
                                <th data-field="icon" style="text-align: center;">图标</th>
                                <th data-field="show" style="text-align: center;">是否显示</th>
                                <th data-field="permission" >权限标识</th>
                                <th name="action" data-render="rendererAction" style="min-width: 135px;">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    params = {parentId: 0};
    $(function () {

        initTreeGrid();
        $("#menu_tree").beeJsTree();
        //树控件的变化事件处理
        $('#menu_tree').on("changed.jstree", function (e, data) {
            var id, text;
            if (data.action == 'select_all' || typeof data.node == 'undefined') {
                params.parentId = 0;
                id = 0;
                text = '';
            } else {
                params.parentId = data.selected[0];
                id = data.node.id;
                text = data.node.text;
            }
            $(".btn-add").attr("data-url", "admin/sys/menu/save.html?parentId=" + id + "&parentText=" + text);
            initTreeGrid();
        });

    });

    function loadedJsTree(data) {
        $('#role_menu').bind("loaded.jstree", function (event, data) {
            $('#role_menu').jstree("open_all");
        });
    }

    function initTreeGrid() {

        $.get('sys/menu/treeGrid', params, function (result) {
            $('#bee_table tbody').html("");
            $.each(result, function (i, menu) {
                $('#bee_table tbody').append(initTr(menu));
            });
            $('#bee_table').treegrid({
                treeColumn: 1,
                initialState: 'collapsed',
                expanderExpandedClass: 'fa fa-chevron-down',
                expanderCollapsedClass: 'fa fa-chevron-right'
            });
        });

    }


    function initTr(menu, parentId) {
        var show;
        if (menu.show) {
            show = '<span class="label label-sm label-info">显示</span>';
        } else {
            show = '<span class="label label-sm label-warning">隐藏</span>';
        }

        var tr =
                '<tr class="treegrid-' + menu.id;
        if (parentId) {
            tr += ' treegrid-parent-' + parentId;
        }
        tr += '">' +
                '<td>' +
                '<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">' +
                '<input type="checkbox" class="checkboxes" name="chx_default" value="' + menu.id + '"/>' +
                '<span></span>' +
                '</label>' +
                '</td>' +
                '<td>' + menu.name + '</td>' +
                '<td>' + menu.sort + '</td>' +
                '<td>' + menu.href + '</td>' +
                '<td style="text-align: center;"><i class="' + menu.icon + '"></i></td>' +
                '<td style="text-align: center;">' + show + '</td>' +
                '<td>' + menu.permission + '</td>' +
                '<td style="min-width: 100%">' +
                '<button data-url="admin/sys/menu/save.html?id=' + menu.id + '" class="btn btn-xs blue" data-toggle="modal">编辑</button>' +
                '<button data-url="' + basePath + '/sys/menu/' + menu.id + '" class="btn btn-xs red" data-callback="refreshTable" data-msg="确定删除吗？" data-batch="false" data-model="ajaxDelete">删除</button>' +
                '</td>' +
                '</tr>';
        if (menu.children.length > 0) {
            $.each(menu.children, function (i, child) {
                tr += initTr(child, menu.id);
            });
        }
        return tr;
    }

    function refreshTable() {
        var tree = $.jstree.reference("#menu_tree");
        tree.refresh();
        initTreeGrid();
    }
</script>
