<div class="modal-content scroller" style="height: 100%;" data-always-visible="1" data-rail-visible="0">
    <div class="modal-header">
    </div>
    <div class="modal-body">

    </div>
    <div class="modal-footer">
        <button class="btn default" data-dismiss="modal" aria-hidden="true">Close</button>
    </div>
</div>

<script>
    var id = "${param.id!''}";
    $.get('sys/errorMessage/'+id,{},function (result) {
        console.log(result);
        $(".modal-body").html(result.data.stackTrace);
    })
</script>
