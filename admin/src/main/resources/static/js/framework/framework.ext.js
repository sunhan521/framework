/**
 * jquery 插件整合
 * @since 2017年02月08日
 * @author Han.Sun
 */

/**
 * 整合dataTables
 */
(function ($) {
    $.fn.beeTables = function (params) {
        var table = $(this);
        var columns = [];
        var columnDefs = [];
        table.find("thead tr th").each(function (i) {
            var field = $(this).data("field");
            var render = $(this).data("render");
            var format = $(this).data("format");
            if (field) {
                var column = {orderable: false, searchable: false};
                column.data = field.toString();
                if (format) {
                    column.render = function (data, type, row) {
                        var date = new Date(data);
                        return date.Format(format)
                    };

                }
                if (render) {
                    column.render = function (data, type, row) {
                        return eval(render + "(data, type, row)");
                    };
                }
                columns.push(column)

            } else if (render) {
                var columnDef = {};
                columnDef.targets = i;
                columnDef.orderable = false;
                columnDef.searchable = false;
                columnDef.render = function (data, type, row) {
                    return eval(render + "(data, type, row)");
                };
                columnDefs.push(columnDef)
            }

        });
        return table.dataTable({
            "searching": false,
            "ordering": false,
            "pagingType": "bootstrap_full_number",
            "autoWidth": false,
            "serverSide": true,
            "ajax": {
                "url": table.data("url"),
                "type": "post",
                "data": function (data) {
                    $.each(params, function (key, value) {
                        data[key] = value;
                    });
                }
            },
            "createdRow": function (row, data) {
                $('td:eq(0)', row).html('<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">'
                    + '<input type="checkbox" class="checkboxes" name="chx_default" value="' + data.id + '"/>'
                    + '<span></span>'
                    + '</label>');
            },
            "columns": columns,
            "columnDefs": columnDefs,
            "drawCallback": function () {
                var drawCallback = table.data("drawCallback");
                if (drawCallback) {
                    if (drawCallback.indexOf(')') != -1) {
                        eval(drawCallback);
                    } else {
                        eval(drawCallback + "()");
                    }

                }
            },
            "initComplete": function () {
                var initComplete = table.data("initComplete");
                if (initComplete) {
                    if (initComplete.indexOf(')') != -1) {
                        eval(initComplete);
                    } else {
                        eval(initComplete + "()");
                    }

                }
                table.find('.group-checkable').change(function () {
                    var set = jQuery(this).attr("data-set");
                    var checked = jQuery(this).is(":checked");
                    jQuery(set).each(function () {
                        if (checked) {
                            $(this).prop("checked", true);
                            $(this).parents('tr').addClass("active");
                        } else {
                            $(this).prop("checked", false);
                            $(this).parents('tr').removeClass("active");
                        }
                    });
                });

                table.on('change', 'tbody tr .checkboxes', function () {
                    $(this).parents('tr').toggleClass("active");
                });
            },
            "language": {
                "emptyTable": "表中无指定条件数据存在！",
                "info": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
                "infoEmpty": "显示0到0条记录",
                "infoFiltered": "(数据表中共为 _MAX_ 条记录)",
                "lengthMenu": "每页显示 _MENU_ 条记录",
                "search": "搜索:",
                "zeroRecords": "表中无指定条件数据存在！",
                "paginate": {
                    "previous": "上一页",
                    "next": "下一页",
                    "last": "末页",
                    "first": "首页"
                }
            }

        });
    };

    $.fn.toJSON = function () {
        var $elements = {};
        var $form = $(this);
        $form.find('input, select, textarea').each(function () {
            var name = $(this).attr('name');
            var type = $(this).attr('type');
            if (name) {
                var $value;
                if (type == 'radio') {
                    $value = $('input[name=' + name + ']:checked', $form).val()
                } else if (type == 'checkbox') {
                    $value = $(this).is(':checked')
                } else {
                    $value = $(this).val()
                }
                $elements[$(this).attr('name')] = $value
            }
        });
        return JSON.stringify($elements)
    };
    $.fn.beeForm = function (remoteUrl, callback) {
        var $form = $(this);
        $.get(remoteUrl, {}, function (data) {
            $.each(data.data, function (key, value) {
                //all form elements for a name. Multiple checkboxes can have the same name, but different values
                var $ctrls = $form.find('[name=' + key + ']');
                //console.log("Number found elements: " + $ctrls.length );
                if ($ctrls.is('select')) //special form types
                {
                    $('option', $ctrls).each(function () {
                        if (this.value == value)
                            this.selected = true;
                    });
                    $ctrls.trigger("change");
                }
                else if ($ctrls.is('textarea')) {
                    $ctrls.val(value);
                }
                else {
                    switch ($ctrls.attr("type"))   //input type
                    {
                        case "text":
                        case "hidden":
                            $ctrls.val(value);
                            break;
                        case "radio":
                            if ($ctrls.length >= 1) {
                                $.each($ctrls, function () {
                                    var elemValue = $(this).attr("value");
                                    console.log("elemValue:" + elemValue);
                                    console.log("value:" + value);
                                    if (elemValue == value) {
                                        $(this).prop('checked', true);
                                    } else {
                                        $(this).prop('checked', false);
                                    }
                                });
                            }
                            break;
                        case "checkbox":
                            if ($ctrls.length > 1) {
                                $.each($ctrls, function () {
                                    if (typeof value == 'undefined' || value == null) {
                                        return;
                                    }
                                    var elemValue = $(this).attr("value");
                                    var elemValueInData = undefined;
                                    var singleVal;
                                    var values = value.toString().split(',');
                                    for (var i = 0; i < values.length; i++) {
                                        singleVal = values[i];
                                        if (singleVal == elemValue) {
                                            elemValueInData = singleVal
                                        }
                                    }
                                    if (elemValueInData) {
                                        $(this).prop('checked', true);
                                    } else {
                                        $(this).prop('checked', false);
                                    }
                                });
                            } else if ($ctrls.length == 1) {
                                if (value) {
                                    $ctrls.prop('checked', true);
                                }
                                else {
                                    $ctrls.prop('checked', false);
                                }
                            }
                            break;
                    }
                }
            });

            if (callback) {
                callback(data);
            }
        });
    };

    /**
     * select2 全局插件。
     * Server Return Class List<KeyValue>
     */
    $.fn.beeSelect = function () {
        var el = $(this);
        var url = $(this).data("url");
        if (url != undefined) {
            $.get(url, {}, function (data) {
                el.select2({
                    data: data,
                    placeholder: {
                        id: '-1', // the value of the option
                        text: '请选择..'
                    }
                });
            });
        } else {
            el.select2({
                placeholder: {
                    id: '-1', // the value of the option
                    text: '请选择..'
                }
            });
        }

    };

    /**
     * radio remote  全局插件。
     * Server Return Class List<KeyValue>
     */
    $.fn.beeCheck = function () {
        var el = $(this);
        var url = el.data("url");
        var name = el.data("name");
        var type = "checkbox";
        if (url != undefined) {
            $.get(url, {}, function (data) {
                $.each(data, function (i, item) {
                    var option = '<label class="mt-checkbox col-md-6">' +
                        '<input type="' + type + '" id="' + name + '_' + item.id + '" name="' + name + '" value="' + item.id + '">' +
                        item.text +
                        '<span></span>' +
                        '</label>';
                    el.append(option);
                })
            });
        }
    };

    $.fn.beeRadio = function () {
        var el = $(this);
        var url = el.data("url");
        var name = el.data("name");
        var type = "radio";
        if (url != undefined) {
            $.get(url, {}, function (data) {
                $.each(data, function (i, item) {
                    var option = '<label class="mt-radio">' +
                        '<input type="' + type + '" name="' + name + '" value="' + item.id + '">' +
                        item.text +
                        '<span></span>' +
                        '</label>';
                    el.append(option);
                })
            });
        }

    };

    /**
     * 以指定的Json数据，初始化JStree控件
     * treeName 树div Id
     * url 数据源地址
     * checkbox 是否显示复选框
     * loadedFunction 加载完毕的回调函数
     */

    $.fn.beeJsTree = function () {

        var el = $(this);
        var url = el.data("url");
        var isCheck = el.data("check") || false; //设置checkbox默认值为false
        if (isCheck) {
            //复选框树的初始化
            $.getJSON(url, function (data) {
                el.jstree({
                    'plugins': ["checkbox"], //出现选择框
                    'checkbox': {cascade: "", three_state: false}, //不级联
                    "types": {
                        "default": {
                            "icon": "fa fa-file-o"
                        },
                        "file": {
                            "icon": "fa fa-file-o"
                        }
                    },
                    'core': {
                        'data': data,
                        "themes": {
                            "responsive": false
                        }
                    }
                }).bind('loaded.jstree', loadedFunction(data));
            });
        } else {
            //普通树列表的初始化
            $.getJSON(url, function (data) {
                el.jstree({
                    'core': {
                        'data': data,
                        "types": {
                            "default": {
                                "icon": "fa fa-file-o"
                            },
                            "file": {
                                "icon": "fa fa-file-o"
                            }
                        },
                        "themes": {
                            "responsive": false
                        }
                    }
                }).bind('loaded.jstree', loadedFunction(data));
            });
        }

        function loadedFunction(data) {
            var callback = el.data("callback");
            if (callback) {
                if (callback.indexOf(')') != -1) {
                    eval(callback(data));
                } else {
                    eval(callback + "(data)");
                }

            }
        }
    }
}(jQuery));


// 对Date的扩展，将 Date 转化为指定格式的String
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
// 例子：
// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
Date.prototype.Format = function (fmt) { //author: meizz
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "h+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
};