<#import "../../layout/global.ftl" as global />

<form id="data-form" class="form-horizontal" role="form" callfn="refreshTable"
      action="<@global.api 'sys/errorMessage/'+param.id!''/>">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
        <h4 class="modal-title">$#{param.id???string('编辑','新建')}</h4>
    </div>
    <div class="modal-body">
        <div class="row">
            <div class="col-md-12">
                <div class="form-body">
                                            <div class="form-group">
                        <label class="control-label col-md-3">                            <span class="required"> * </span>
                        </label>
                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" class="form-control" name="id" placeholder="请输入"/></div>
                        </div>
                    </div>
                                            <div class="form-group">
                        <label class="control-label col-md-3">创建时间                            <span class="required"> * </span>
                        </label>
                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" class="form-control" name="createDate" placeholder="请输入创建时间"/></div>
                        </div>
                    </div>
                                            <div class="form-group">
                        <label class="control-label col-md-3">异常Class                            <span class="required"> * </span>
                        </label>
                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" class="form-control" name="className" placeholder="请输入异常Class"/></div>
                        </div>
                    </div>
                                            <div class="form-group">
                        <label class="control-label col-md-3">异常Method                            <span class="required"> * </span>
                        </label>
                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" class="form-control" name="methodName" placeholder="请输入异常Method"/></div>
                        </div>
                    </div>
                                            <div class="form-group">
                        <label class="control-label col-md-3">行号                            <span class="required"> * </span>
                        </label>
                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" class="form-control" name="lineNumber" placeholder="请输入行号"/></div>
                        </div>
                    </div>
                                            <div class="form-group">
                        <label class="control-label col-md-3">异常cause                            <span class="required"> * </span>
                        </label>
                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" class="form-control" name="cause" placeholder="请输入异常cause"/></div>
                        </div>
                    </div>
                                            <div class="form-group">
                        <label class="control-label col-md-3">异常消息                            <span class="required"> * </span>
                        </label>
                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" class="form-control" name="message" placeholder="请输入异常消息"/></div>
                        </div>
                    </div>
                                            <div class="form-group">
                        <label class="control-label col-md-3">处理状态                            <span class="required"> * </span>
                        </label>
                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" class="form-control" name="status" placeholder="请输入处理状态"/></div>
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
    var id = "$#{param.id!''}";
    $(function () {
        loadData();
        $('#data-form').validate({
            rules: {
                                id:"required",
                                createDate:"required",
                                className:"required",
                                methodName:"required",
                                lineNumber:"required",
                                cause:"required",
                                message:"required",
                                status:"required",
                            }
        });
    });
    function loadData() {
        var method = "";
        if (id != "") {
            $('#data-form').beeForm("/sys/errorMessage/" + id);
            method = "PUT";
        } else {
            method = "POST";
        }
        $('#data-form').attr("method", method);
    }
</script>
