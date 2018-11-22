$(function(){
    
    var in_array = function(array, value){
        for(var index in array){
            if(array[index] == value){
                exist = true;
            }
        }
        return exist;
    }
    
    var updatePrice = function(){
        var produtos = $(".produtos").children();
        var total = 0;

        for(var i = 0; i < produtos.length; i++){
            var produto = produtos[i].childNodes;
            var price = $(produto[5]).val();
            var quantity = produto[9].childNodes;
            quantity = $(quantity[3]).val();
            total += price * quantity;
        }
        $(".total-price").text(total.toFixed(2));
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
        if(quantity == 1)
            quantity = 1;
        else
            quantity--;
        
        $.ajax({
            type: "POST",
            url: "cart",
            dataType: "json",
            data: {
                produto: id,
                quantity: quantity
            }, success: function(data){
                $("#quantity_"+id).val(quantity);
                updatePrice();
            }
        });
    });
    
    $(".plus-cart").click(function(){
        var id = $(this).attr('id');
        var maxquantity = $("#maxquantity_"+id).val();
        var quantity = $("#quantity_"+id).val();
        quantity++;
        if(quantity > maxquantity){
            quantity--;
        }
        $.ajax({
            type: "POST",
            url: "cart",
            dataType: "json",
            data: {
                produto: id,
                quantity: quantity
            }, success: function(data){
                $("#quantity_"+id).val(quantity);
                updatePrice();
            }, error: function(e){
                console.log(e);
            }
        });
    });
    
    $("#search").keydown(function(){
        var search = $(this).val();
        
        setTimeout(function(){
            $(".autocomplete").hide();
            $.ajax({
                type: "POST",
                url: "produto",
                dataType: "json",
                data: {
                    query: "search",
                    search: search
                }, success: function(data){
                    $(".autocomplete ul").html("");
                    $.each(data, function(key, value){
                        $(".autocomplete ul").append("<li><a href='./dashboard.jsp?search="+value.titulo+"'>"+value.titulo+"</a></li>");
                        $(".autocomplete").show();
                    })
                }, error: function(e){
                    console.log(e);
                }
            });
        }, 2000);
    });
    
    $(".produtos").ready(function(){
        var current = $("#current").val();
        var search = $("#currents").val();
        
        $.ajax({
            type: "POST",
            url: "produto",
            dataType: "json",
            data: {
                query: "produtos",
                marca: current,
                search: search
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
                $this.text("Produto adicionado");
            }, error: function(e){
                console.log(e);
            }
        })
    });
    
    $("#users-list").ready(function () {
        $.ajax({
            url: "../adashboard",
            method: "post",
            data: {
                query: "usuarios"
            },
            dataType: "json",
            success: function (data) {
                $.each(data, function(key, value){
                    var html = "<tr><td>" + value.nome + "</td><td>" + value.cpf + "</td><td>" + value.login + "</td><td>" + value.email + "</td></tr>";
                    $("#users-list tbody").append(html);
                });

            }
        });
    });

    $("#produtos-list").ready(function () {

        $.ajax({
            url: "../adashboard",
            method: "post",
            data: {
                query: "produto"
            },
            dataType: "json",
            success: function (data) {
                $.each(data, function(key, value){
                    var html = "<tr><td>" + value.titulo + "</td><td>" + value.descricao + "</td><td>" + value.preco + "</td><td>" + value.itensCompoem + "</td><td>" + value.vendedor + "</td><td>" + value.qtdeDisponivel+"</td><td>" + value.endLoja+ "</td><td>" + value.telefone +"</td></tr>" ;
                    $("#produtos-list tbody").append(html);
                });

            }
        });
    });
    
    $(document).on('click', '.file', function(){
        $("#image-input").click();
    });
    
    $("#image-input").change(function(ev){
        
        var form = new FormData();
        form.append('file', ev.target.files[0]);
        
        $.ajax({
            type: "POST",
            url: "https://notamaisapi.herokuapp.com/upload-photo",
            data: form,
            contentType: false,
            cache: false,
            processData: false,
            async: false,
            success: function(data){
                $("#imagem").val(data.path);
                $("#img-prod").attr('src', data.path);
            }
        });
    });
    
    $("#register-product").submit(function(e){
        e.preventDefault();
        
        var imagem = $("#imagem").val();
        var titulo = $("#titulo").val();
        var descricao = $("#descricao").val();
        var vendedor = $("#vendedor").val();
        var quantidade = $("#quantidade").val();
        var endereco = $("#endereco").val();
        var telefone = $("#telefone").val();
        var preco = $("#preco").val();
        
        if(imagem == "" || titulo == "" || descricao == "" || vendedor == "" || quantidade == "" || endereco == "" || telefone == "" || preco == ""){
            alert("Você deve preencher todos os campos");
            return false;
        }
        
        $.ajax({
            type: "POST",
            url: "../produto",
            dataType: "json",
            data: {
                imagem: imagem,
                titulo: titulo,
                descricao: descricao,
                vendedor: vendedor,
                quantidade: quantidade,
                endereco: endereco,
                telefone: telefone,
                preco: preco,
                query: "cadastro"
            }, success: function(data){
                $(location).attr('href', 'adashboard.jsp');
            }, error: function(e){
                console.log(e);
            }
        });
        
        return false;
    });
    
    $(document).on('change', '.marca',function(){
        var marca = $(this).val();
        $(location).attr('href', '?marca='+marca);
    });
});
      