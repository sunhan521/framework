/**
 * 通用方法
 * @since 2017年02月08日
 * @author Han.Sun
 */
function newGuid() {
    var guid = "";
    for (var i = 1; i <= 32; i++) {
        var n = Math.floor(Math.random() * 16.0).toString(16);
        guid += n;
    }
    guid += new Date().getTime();
    return guid.toUpperCase();
}

//获得选中项
function getCheckboxItem(checkBoxName) {
    var allSel = "";
    var ids = $("input[name='" + checkBoxName + "']");
    $(ids).each(function () {
        if (this.disabled == false) {
            if (this.checked) {
                if (allSel == "")
                    allSel = this.value;
                else
                    allSel = allSel + "," + this.value;
            }
        }
    });
    return allSel;
}

