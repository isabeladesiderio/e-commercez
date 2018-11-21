$(function(){
    
    var in_array = function(array, value){
        let exist = false;
        for(var index in array){
            if(array[index] == value){
                exist = true;
            }
        }
        return exist;
    }
    
    //Quantidade da pagina de produto
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
        var maxquantity = $("#maxquantity").val();
        quantity++;
        if(quantity > maxquantity){
            quantity--;
        }
        $("#quantity").val(quantity);
    });
    
    $(".less-cart").click(function(){
        var id = $(this).attr('id');
        var quantity = $("#quantity_"+id).val();
        if(quantity == 1){
            $("#quantity_"+id).val(1);
        }else{
            quantity--;
            $("#quantity_"+id).val(quantity);
        }
    });
    
    $(".plus-cart").click(function(){
        var id = $(this).attr('id');
        var maxquantity = $("#maxquantity_"+id).val();
        var quantity = $("#quantity_"+id).val();
        quantity++;
        if(quantity > maxquantity){
            quantity--;
        }
        $("#quantity_"+id).val(quantity);
    });
    
    $(".produtos").ready(function(){
        var current = $("#current").val();
        $.ajax({
            type: "POST",
            url: "produto",
            dataType: "json",
            data: {
                query: "produtos",
                marca: current
            }, success: function(data){
                //Listando produtos
                var html = "<div class='row'>";
                $.each(data, function(key, value){
                    html += '<div class="col-sm-12 col-md-4 col-lg-4">';
                    html += '<div class="card"><div class="img-produto"><img src="'+value.image+'"/></div>';
                    html += '<div class="detalhes-produto"><p><a href="produto?id='+value.id+'">'+value.titulo+'</a></p><label>R$ '+(value.preco / 100).toFixed(2).replace(".", ",")+'</label></div>';
                    html += '<div class="adicionar-produto"><button class="add-cart" id="'+value.id+'">Adicionar ao carrinho</button></div></div>';
                    html += '</div>';
                    
                });
                html += "</div>";
                $(".produtos").html(html);
            }
        });
    });
    
    $(".marcas").ready(function(){
        var current = $("#current").val();
        $.ajax({
            type: "POST",
            url: "produto",
            dataType: "json",
            data: {
                query: "marcas"
            }, success: function(data){
                var html = "";
                $.each(data, function(key,  value){
                    var checked = "";
                    if(current == value){
                        checked = "checked";
                    }
                    html += '<li><input type="checkbox" class="marca" name="marca" id="marca_'+(key+1)+'" value="'+value+'" '+checked+'/><label for="marca_'+(key+1)+'"> '+value+'</label></li>';
                });
                $(".marcas").html(html);
            }, error: function(e){
                console.log(e);
            }
        });
    });
    
    $(document).on('click', '.add-cart, .add-cart-button', function(){
        var $this = $(this);
        var produto = $this.attr('id');
        
        $.ajax({
            type: 'POST',
            url: 'cart',
            dataType: 'json',
            data: {
                produto: produto
            }, success: function(data){
                console.log(data);
                $this.text("Produto adicionado");
            }, error: function(e){
                console.log(e);
            }
        })
    });
    
    $(document).on('change', '.marca',function(){
        var marca = $(this).val();
        $(location).attr('href', '?marca='+marca);
    });
});