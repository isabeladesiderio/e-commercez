$(function(){
    $(".less").click(function(){
        var quantity = $("#quantity").val();
        if(quantity == 1)
            $("#quantity").val(1);
        else{
            quantity--;
            $("#quantity").val(quantity);
        }
    });
    
    $(".plus").click(function(){
        var quantity = $("#quantity").val();
        quantity++;
        $("#quantity").val(quantity);
    })
});