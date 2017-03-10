/**
 * 表单验证
 * @since 2017年02月08日
 * @author Han.Sun
 */
$.validator.setDefaults({
    errorElement: 'span', //default input error message container
    errorClass: 'help-block help-block-error', // default input error message class
    focusInvalid: false, // do not focus the last invalid input
    ignore: "",  // validate all fields including form hidden input
    errorPlacement: function (error, element) { // render error placement for each input type
        var icon = $(element).parent('.input-icon').children('i');
        icon.removeClass('fa-check').addClass("fa-warning");
        icon.attr("data-original-title", error.text()).tooltip();
        if ($(element).closest(".form-group").find(".help-block").length == 0) {
            $(element).closest(".form-group").append('<div class="col-md-3 help-block">' + error.text() + '</div>');
        } else {
            $(element).closest(".form-group").find(".help-block").html(error.text());
        }
    },

    highlight: function (element) { // 设置错误高亮
        $(element).closest('.form-group').removeClass("has-success").addClass('has-error'); // set error class to the control group
    },

    unhighlight: function (element) { // revert the change done by hightlight

    },

    success: function (label, element) {
        var icon = $(element).parent('.input-icon').children('i');
        $(element).closest('.form-group').removeClass('has-error').addClass('has-success'); // set success class to the control group
        icon.removeClass("fa-warning").addClass("fa-check");
    },
    submitHandler: function (form) {
        $(form).ajaxSubmit({
            type:$(form).attr("method"),
            dataType: "json",
            success: function (responseText, statusText) {
                if (true) { // 成功提示
                    $(form).clearForm();
                    if ($(form).find("*[data-dismiss='modal']").length > 0) {
                        $(form).find("*[data-dismiss='modal']").click();
                    }
                    var callfn = $(form).attr("callfn");
                    if (callfn) {
                        if (callfn.indexOf(')') != -1) {
                            eval(callfn);
                        } else {
                            eval(callfn + "()");
                        }
                    }
                    swal({
                        title: "操作结果提示",
                        text: responseText.msg || "操作成功!",
                        type: "success",
                        timer: 100000
                    });
                }
                else {
                    swal({
                        title: "操作结果提示",
                        text: responseText.msg || "未知错误警告!请您反馈给系统管理员，我们会尽快解决该问题",
                        type: "warning",
                        timer: 100000
                    });
                }
            },
            error: function (XmlHttpRequest, textStatus, errorThrown) {
                if ($(form).find("*[data-dismiss='modal']").length > 0) {
                    $(form).find("*[data-dismiss='modal']").click();
                }
                setTimeout(function () {
                    swal({
                        title: "操作结果提示",
                        text: "未知错误警告!请您反馈给系统管理员，我们会尽快解决该问题",
                        type: "warning"
                    });
                }, 500);

            }
        });
    }
});
jQuery.extend(jQuery.validator.messages, {
    required: "必选字段",
    remote: "请修正该字段",
    email: "请输入正确格式的电子邮件",
    url: "请输入合法的网址",
    date: "请输入合法的日期",
    dateISO: "请输入合法的日期 (ISO).",
    number: "请输入合法的数字",
    digits: "只能输入整数",
    creditcard: "请输入合法的信用卡号",
    equalTo: "请输入相同的值",
    accept: "请输入拥有合法后缀名的字符串",
    maxlength: jQuery.validator.format("长度最多是 {0}"),
    minlength: jQuery.validator.format("长度最少是 {0}"),
    rangelength: jQuery.validator.format("长度介于 {0} 和 {1} 之间"),
    range: jQuery.validator.format("值介于 {0} 和 {1} 之间"),
    max: jQuery.validator.format("请输入一个最大为{0} 的值"),
    min: jQuery.validator.format("请输入一个最小为{0} 的值")
});

jQuery.validator.addMethod("isMobile", function (value, element) {
    var length = value.length;
    return this.optional(element) || length == 11 && /^1[358]\d{9}$/.test(value)
}, "请正确填写您的手机号码");
jQuery.validator.addMethod("commonString", function (value, element) {
    return this.optional(element) || /^[a-zA-Z0-9_@]+$/.test(value);
}, "只能包含英文、数字、下划线、@等字符");
jQuery.validator.addMethod("stringCheck", function (value, element) {
    return this.optional(element) || /^[a-zA-Z0-9\u4e00-\u9fa5-_@]+$/.test(value);
}, "只能包含中文、英文、数字、下划线、@等字符");

jQuery.validator.addMethod("datetime", function (value, element) {
    var length = value.length;
    //alert(/^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01]) (([0-1]?[0-9])|([2][0-3]))(:([0-5]?[0-9]))+$/.test(value));
    return this.optional(element) || /^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01]) (([0-1]?[0-9])|([2][0-3]))(:([0-5]?[0-9]))+$/.test(value)
}, "日期时间不正确");
jQuery.validator.addMethod("greaterEquals", function (value, element, param) {

    var startTime = $(param).val();
    var reg = new RegExp('-', 'g');
    startTime = startTime.replace(reg, '/');//正则替换
    endTime = value.replace(reg, '/');
    startTime = new Date(parseInt(Date.parse(startTime), 10));
    endTime = new Date(parseInt(Date.parse(endTime), 10));
    if (startTime > endTime) {
        return false;
    } else {
        return true;
    }
}, "结束日期必须大于开始日期");