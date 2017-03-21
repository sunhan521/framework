<#import "../../layout/global.ftl" as global />

<div class="row">
    <div class="col-md-12">
        <div class="portlet light">
            <div class="portlet-body">
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
                        <th data-field="createDate" data-format="yyyy-MM-dd hh:mm:ss">时间</th>
                        <th data-field="className">Class</th>
                        <th data-field="methodName">Method</th>
                        <th data-field="lineNumber">行号</th>
                        <th data-field="message">异常消息</th>
                        <th data-field="status" data-class="dt-center" data-render="rendererStatus"></th>
                        <th name="action" data-render="rendererAction"></th>
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
        return '<button data-full-width="true" data-url="admin/sys/error/stackTrace.html?id=' + row.id + '" class="btn btn-xs blue" data-toggle="modal">stackTrace</button>'

    }

    function rendererStatus(data, type, row) {
        if(data){
            return '<span class="label label-sm label-info">已处理</span>';
        }
        return '<span class="label label-sm label-warning">未处理</span>';

    }
</script>
