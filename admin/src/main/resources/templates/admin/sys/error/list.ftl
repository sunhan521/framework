<#import "../../layout/global.ftl" as global />

<div class="row">
    <div class="col-md-12">
        <div class="portlet light">
            <div class="portlet-body">
                <div class="table-toolbar">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="btn-group">
                                <button class="btn sbold green" data-url="admin/sys/errorMessage/save.html"
                                        data-toggle="modal">新增
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                            <div class="btn-group">
                                <button class="btn sbold green"
                                        data-url="<@global.api 'sys/errorMessage/batchDelete'/>" data-batch="true"
                                        data-msg="确定批量删除吗？" data-model="ajaxDelete" data-callback="refreshTable">批量删除
                                    <i class="fa fa-times"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover table-checkable order-column"
                       id="bee_table" data-url="<@global.api 'sys/errorMessage/page'/>">
                    <thead>
                    <tr>
                        <th data-field="id">
                            <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                <input type="checkbox" class="group-checkable" data-set="#bee_table .checkboxes"
                                       id="defaultCheck"/>
                                <span></span>
                            </label>
                        </th>
                                                    <th data-field="id"></th>
                                                    <th data-field="createDate">创建时间</th>
                                                    <th data-field="className">异常Class</th>
                                                    <th data-field="methodName">异常Method</th>
                                                    <th data-field="lineNumber">行号</th>
                                                    <th data-field="cause">异常cause</th>
                                                    <th data-field="message">异常消息</th>
                                                    <th data-field="status">处理状态</th>
                                                <th name="action" data-render="rendererAction">操作</th>
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
        return '<button data-url="sys/errorMessage/save.html?id=' + row.id + '" class="btn btn-xs blue" data-toggle="modal">编辑</button>' +
                '<button data-url="' + basePath + '/sys/errorMessage/' + row.id + '" class="btn btn-xs red" data-callback="refreshTable" data-msg="确定删除吗？" data-batch="false" data-model="ajaxDelete">删除</button>';
    }
</script>
