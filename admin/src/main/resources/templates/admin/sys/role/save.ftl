<#import "../../layout/global.ftl" as global />
<form id="data-form" class="form-horizontal" role="form" callfn="refreshTable"
      action="<@global.api 'sys/role/'+param.id!''/>">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
        <h4 class="modal-title">${param.id???string('编辑','新建')}</h4>
    </div>
    <div class="modal-body">
        <div class="row">
            <div class="col-md-12">
                <div class="form-body">
                    <div class="form-group">
                        <label class="control-label col-md-3">角色名称 <span class="required"> * </span>
                        </label>
                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" class="form-control" name="name" placeholder="请输入角色名称"/></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">备注 <span class="required"> * </span>
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
        <button type="submit" class="btn blue" >保存</button>
    </div>
</form>

<script type="text/javascript">
    var id = "${param.id!''}";
    $(function () {
        $(".mt-radio-inline").beeRadio();
        loadData();
        $('#data-form').validate({
            rules: {
                id: "required",
                name: "required",
                enabled: "required",
                remarks: "required",
                createDate: "required",
                updateDate: "required",
                delFlag: "required"
            }
        });
    });
    function loadData() {
        var method = "";
        if (id != "") {
            $('#data-form').beeForm("/sys/role/" + id);
            method = "PUT";
        } else {
            method = "POST";
        }
        $('#data-form').attr("method", method);
    }
</script>
