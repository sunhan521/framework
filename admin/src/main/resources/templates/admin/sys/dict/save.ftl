<#import "../../layout/global.ftl" as global />


<form id="data-form" class="form-horizontal" role="form" callfn="refreshTable"
      action="<@global.api 'sys/dict/'+param.id!''/>">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
        <h4 class="modal-title">${param.id???string('编辑字典表','新建字典表')}</h4>
    </div>
    <div class="modal-body">
        <div class="row">
            <div class="col-md-12">
                <div class="form-body">
                    <div class="form-group">
                        <label class="control-label col-md-3">字典类型
                            <span class="required"> * </span>
                        </label>
                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" class="form-control" name="type" placeholder="请输入字典类型"/></div>
                        </div>
                    </div>
                    <div class="form-group  margin-top-20">
                        <label class="control-label col-md-3">数据值
                            <span class="required"> * </span>
                        </label>
                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" class="form-control" name="value" placeholder="请输入数据值"/></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">字典标签
                            <span class="required"> * </span>
                        </label>
                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" class="form-control" name="label" placeholder="请输入字典标签"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">排序
                            <span class="required"> * </span>
                        </label>
                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" class="form-control" name="sort" placeholder="请输入排序值"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">描述
                            <span class="required"></span>
                        </label>
                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <textarea id="description" name="description" class="form-control" rows="3"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn blue" onclick="test()">保存</button>
    </div>
</form>

<script type="text/javascript">
    function test() {
        console.log("toJson:" + $('#data-form').toJSON());
    }
    var id = "${param.id!''}";
    $(function () {
        loadData();
        $('#data-form').validate({
            rules: {
                type:"required",
                value:"required",
                label:"required",
                sort: {
                    digits:true
                }
            }
        });
    });
    function loadData() {
        var method = "";
        if (id != "") {
            $('#data-form').beeForm("/sys/dict/" + id);
            method = "PUT";
        } else {
            method = "POST";
        }
        $('#data-form').attr("method", method);
    }
</script>
