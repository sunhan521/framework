<#import "../../layout/global.ftl" as global />
<div class="row">
    <div class="col-md-12">
        <div class="portlet light">
            <div class="portlet-body">
                <div class="table-toolbar">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="btn-group">
                                <button id="ajax-demo" class="btn sbold green"  data-url="admin/sys/user/save.html"  data-toggle="modal" >新增
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                            <div class="btn-group">
                                <button id="ajax-demo" class="btn sbold green"
                                        data-url="<@global.api 'sys/user/batchDelete'/>" data-batch="true"
                                        data-msg="确定批量删除吗？" data-model="ajaxDelete" data-callback="refreshTable">批量删除
                                    <i class="fa fa-times"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover table-checkable order-column"
                       id="table_user" data-url="<@global.api 'sys/user/page'/>">
                    <thead>
                    <tr>
                        <th data-field="id">
                            <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                <input type="checkbox" class="group-checkable" data-set="#table_user .checkboxes"
                                       id="defaultCheck"/>
                                <span></span>
                            </label>
                        </th>
                        <th data-field="loginName">登录名</th>
                        <th data-field="name">用户名</th>
                        <th data-field="phone">手机号码</th>
                        <th data-field="email">邮箱</th>
                        <th data-field="createDate" data-format="yyyy-MM-dd hh:mm:ss">创建时间</th>
                        <th name="action" data-render="rendererAction">操作</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var dataTable = $("#table_user").beeTables();

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
        return '<button data-url="admin/sys/user/save.html?id=' + row.id + '" class="btn btn-xs blue" data-toggle="modal">编辑</button>' +
                '<button data-url="' + basePath + '/sys/user/' + row.id + '" class="btn btn-xs red" data-callback="refreshTable" data-msg="确定删除吗？" data-batch="false" data-model="ajaxDelete">删除</button>';
    }
</script>
