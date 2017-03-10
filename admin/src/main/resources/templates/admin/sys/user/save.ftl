<#import "../../layout/global.ftl" as global />
<form id="data-form" class="form-horizontal" role="form" callfn="refreshTable" action="<@global.api 'sys/user/'+param.id!''/>">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
        <h4 class="modal-title">用户新增</h4>
    </div>
    <div class="modal-body">
        <div class="row">
            <div class="col-md-12">
                <div class="form-body">
                    <div class="form-group">
                        <label class="control-label col-md-3">姓名
                            <span class="required"> * </span>
                        </label>
                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" class="form-control" name="name"/></div>
                        </div>
                    </div>
                    <div class="form-group  margin-top-20">
                        <label class="control-label col-md-3">登录名
                            <span class="required"> * </span>
                        </label>
                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" class="form-control" name="loginName"/></div>
                        </div>
                    </div>
                    <div class="form-group  margin-top-20">
                        <label class="control-label col-md-3">密码
                            <span class="required"> * </span>
                        </label>
                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="password" class="form-control" name="password"/></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">邮箱
                            <span class="required"> * </span>
                        </label>
                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" class="form-control" name="email"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">手机号码
                            <span class="required"> * </span>
                        </label>
                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" class="form-control" name="phone"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">角色
                            <span class="required"> * </span>
                        </label>
                        <div class="col-md-5">
                            <div class="mt-check-inline rows" data-url="sys/dict/other/role" data-name="roleIds"></div>
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
        $(".mt-check-inline").beeCheck();
        loadData();
        $('#data-form').validate({
            rules: {
            }
        });
    });
    function loadData() {
        var method = "";
        if (id != "") {
            $('#data-form').beeForm("/sys/user/" + id);
            method = "PUT";
        } else {
            method = "POST";
        }
        $('#data-form').attr("method", method);
    }
</script>