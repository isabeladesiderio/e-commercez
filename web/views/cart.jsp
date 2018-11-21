<%@page import="classes.Carrinho"%>
<%@page import="java.util.ArrayList"%>
<jsp:include page="../inc/header.jsp"/>
<% 
    ArrayList<Carrinho> cart = (ArrayList<Carrinho>) request.getAttribute("cart");
    float preco = 0;
%>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12 col-md-12 col-lg-12">
            <div class="card">
                <ul class="produtos">
                    <% if(cart != null){ %>
                        <% for(int i = 0; i < cart.size(); i++){ %>
                            <li>
                                <div class="img-produto-list">
                                    <img src="<% out.print(cart.get(i).getProduto().getImage()); %>"/>
                                </div>
                                <div class="detalhes-produto">
                                    <% out.print(cart.get(i).getProduto().getTitulo()); %>
                                </div>
                                <input type="hidden" name="maxquantity" id="maxquantity_<% out.print(cart.get(i).getProduto().getId()); %>" value="<% out.print(cart.get(i).getProduto().getQtdeDisponivel()); %>"/>
                                <div class="acoes-produto">
                                    <button class="button-add less-cart" id="<% out.print(cart.get(i).getProduto().getId()); %>">-</button>
                                    <input type="text" name="quantity" class="quantity" id="quantity_<% out.print(cart.get(i).getProduto().getId()); %>" value="<% out.print(cart.get(i).getQuantidade()); %>"/>
                                    <button class="button-add plus-cart" id="<% out.print(cart.get(i).getProduto().getId()); %>">+</button>
                                </div>
                            </li>
                            <% preco += (cart.get(i).getProduto().getPreco() / 100) * cart.get(i).getQuantidade(); %>
                        <% } %>
                    <% }else{ %>
                        <li class='text-center'><h1>Carrinho vazio :(</h1></li>
                    <% } %>
                </ul>
            </div>
        </div>
        <div class="col-sm-12 col-md-12 col-lg-12">
            <div class="card">
                <div class="row">
                    <div class="col-sm-12 col-md-2 col-lg-2">
                        <h2>Total: R$ <span class='total-price'><% out.print(preco); %></span></h2>
                    </div>
                    <div class="col-sm-12 col-md-10 col-md-10">
                        <button class="finalizar">Finalizar Compra</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../inc/footer.jsp"/>