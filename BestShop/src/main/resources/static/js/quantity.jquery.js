    $(document).ready(function(){
    $('#qty_input').prop('disabled', true);
    $('#plus-btn').click(function(){
        $('#qty_input').val(parseInt($('#qty_input').val()) + 1 );
            });
        $('#minus-btn').click(function(){
        $('#qty_input').val(parseInt($('#qty_input').val()) - 1 );
        if ($('#qty_input').val() == 0) {
            alert("0개 이상의 수량을 주문해 주십시오")
            $('#qty_input').val(1);
        }

            });
 });