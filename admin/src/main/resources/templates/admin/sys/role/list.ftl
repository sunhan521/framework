<#import "../../layout/global.ftl" as global />
<div class="row">
    <div class="col-md-12">
        <div class="portlet light">
            <div class="portlet-body">
                <div class="table-toolbar">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="btn-group">
                                <button class="btn sbold green" data-url="admin/sys/role/save.html"
                                        data-toggle="modal">新增
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                            <div class="btn-group">
                                <button class="btn sbold green"
                                        data-url="<@global.api 'sys/role/batchDelete'/>" data-batch="true"
                                        data-msg="确定批量删除吗？" data-model="ajaxDelete" data-callback="refreshTable">批量删除
                                    <i class="fa fa-times"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover table-checkable order-column"
                       id="bee_table" data-url="<@global.api 'sys/role/page'/>">
                    <thead>
                    <tr>
                        <th data-field="id">
                            <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                <input type="checkbox" class="group-checkable" data-set="#bee_table .checkboxes"
                                       id="defaultCheck"/>
                                <span></span>
                            </label>
                        </th>
                        <th data-field="name">角色名称</th>
                        <th data-field="remarks">备注</th>
                        <th data-field="createDate" data-format="yyyy-MM-dd hh:mm:ss">创建时间</th>
                        <th data-field="updateDate" data-format="yyyy-MM-dd hh:mm:ss">更新时间</th>
                        <th name="action" style="width: 132px;" data-render="rendererAction">操作</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var dataTable = $("#bee_table").beeTables();
    function refreshTable(toFirst) {
        if (toFirst) {
            //表格重绘，并跳转到第一页
            dataTable.fnDraw();
        } else {
            //表格重绘，保持在当前页
            dataTable.fnDraw(false);
        }
    }
    function rendererAction(data, type, row) {
        return '<button data-url="admin/sys/role/save.html?id=' + row.id + '" class="btn btn-xs blue" data-toggle="modal">编辑</button>' +
                '<button data-url="admin/sys/role/role_menu.html?id=' + row.id + '" class="btn btn-xs blue" data-toggle="modal" data-width="360">分配权限</button>' +
                '<button data-url="' + basePath + '/sys/role/' + row.id + '" class="btn btn-xs red" data-callback="refreshTable" data-msg="确定删除吗？" data-batch="false" data-model="ajaxDelete">删除</button>';
    }
</script>
