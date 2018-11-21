<%@page import="classes.Produto"%>
<jsp:include page="../inc/header.jsp"/>
<% Produto produto = (Produto) request.getAttribute("produto"); %>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12 col-md-3 col-lg-3">
            <div class="card">
                <div class="img-produto">
                    <img src="<% out.print(produto.getImage()); %>"/>
                </div>
                <label>Imagem meramente ilustrativa</label>
            </div>
        </div>
        <div class="col-sm-12 col-md-9 col-lg-9">
            <div class="card">
                <h2><% out.print(produto.getTitulo()); %></h2>
                <label><a href="index.jsp?marca=tramontina"><% out.print(produto.getVendedor()); %></a></label>
                <div class="divider"></div>
                <p>
                    <input type='hidden' name='maxquantity' id='maxquantity' value='<% out.print(produto.getQtdeDisponivel()); %>'/>
                    Quantidade
                    <button class="button-add less">-</button>
                    <input type="text" name="quantity" id="quantity" value="1"/>
                    <button class="button-add plus">+</button>
                </p>
                <div class="divider"></div>
                <button class="add-cart-button">Adicionar ao carrinho</button>
            </div>
        </div>
        <div class="col-sm-12 col-md-12 col-lg-12">
            <div class="card">
                <h3>Descrição do Produto</h3>
                <p>
                    <% out.print(produto.getDescricao()); %>
                </p>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../inc/footer.jsp"/>