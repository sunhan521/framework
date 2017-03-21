/**
 * 全局初始化
 * @since 2017年02月08日
 * @author Han.Sun
 */
$(function () {
    // menu点击的时候，增加#路径
    $("body").delegate("*[class='ajaxify nav-link']","click",function () {
        if (window.history.pushState)
            window.history.pushState(0, 0, "#" + $(this).attr("href"));
    });

    // ajax 加载modal 页面
    $("body").delegate("*[data-toggle='modal']", "click", function () {
        //ajax demo:
        var $modal = $('#ajax-modal');

        $('body').modalmanager('loading');
        var el = $(this);
        var url = el.data("url");
        var fullWidth = el.data("full-width");
        if(fullWidth){
            $modal.addClass("container");
        }
        var width = el.data("width");
        if (!width) {
            width = 760;
        }
        console.log("width:" + width);
        $modal.load(url, '', function () {
            $modal.modal({width: width});
        });
        $modal.on('click', '.update', function () {
            $modal.modal('loading').find('.modal-body')
                .prepend('<div class="alert alert-info fade in">' +
                    'Updated!<button type="button" class="close" data-dismiss="alert">&times;</button>' +
                    '</div>');
        });
    });

    /**
     * 约定：button 是批量删除，a 标签的是单条删除
     * 该操作分单条/批量数据操作
     */
    $("body").delegate("*[data-model='ajaxDelete']", "click", function () {
        var msg = $(this).data("msg");
        var callback = $(this).data("callback");// 回调函数
        var method = "";
        var url = $(this).data("url");
        if (typeof url == 'undefined') {
            swal({
                title: "删除路径不存在，请联系管理员",
                type: "warning"
            });
            return;
        }
        if ($(this).data("batch")) {
            method = "POST";
            var ids = getCheckboxItem("chx_default");
            if (ids == "") {
                swal({
                    title: "请先勾选数据",
                    type: "warning"
                });
                return;
            }
        } else {
            method = "DELETE";
        }
        swal({
                title: msg,
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "确定",
                cancelButtonText: "取消",
                closeOnConfirm: false,
                closeOnCancel: true
            },
            function (isConfirm) {
                if (isConfirm) {
                    $.ajax({
                        url: url,
                        data: {
                            "ids": ids
                        },
                        method: method,
                        dataType: 'json',
                        success: function (data) {
                            if (data.code == 200) {
                                if (callback) {
                                    if (callback.indexOf(')') != -1) {
                                        eval(callback);
                                    } else {
                                        eval(callback + "()");
                                    }
                                }
                                swal({
                                    title: "操作结果提示",
                                    text: data.message || "操作成功!",
                                    type: "success",
                                    timer: 1000
                                });
                            } else {
                                setTimeout(function () {
                                    swal({
                                        title: "操作结果提示",
                                        text: "未知错误警告!请您反馈给系统管理员，我们会尽快解决该问题",
                                        type: "warning"
                                    });
                                }, 500);
                            }
                        },
                        error: function (XmlHttpRequest, textStatus, errorThrown) {
                            setTimeout(function () {
                                swal({
                                    title: "操作结果提示",
                                    text: "未知错误警告!请您反馈给系统管理员，我们会尽快解决该问题",
                                    type: "warning"
                                });
                            }, 500);
                        }
                    });
                } else {
                }
            });
        return false;
    });
});


