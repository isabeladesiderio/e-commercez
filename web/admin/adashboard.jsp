<jsp:include page="header-auth.jsp" />
<div class="col-sm-12 col-md-12 col-lg-12 mt-4">
    <ul class="nav nav-tabs">
        <li>
            <a class="nav-link active" href="#list" data-toggle="tab">Lista de Usu�rios</a>
        </li>
        <li>
            <a class="nav-link" href="#contadores" data-toggle="tab" >Lista de Produtos</a>
        </li>
    </ul>
    <div class="tab-content ">
        <div class="tab-pane active" id="list">
            <br>
            <h2 class="title-register">Lista de Usu�rios</h2>
            <br>
            <div class="table-responsive">
                <table id="users-list" class="display table">
                    <thead>
                        <tr>
                            <th>Nome</th>
                            <th>CPF</th>
                            <th>Login</th>
                            <th>Email</th>
                            <th>A��es</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
        <div class="tab-pane" id="contadores">
            <br>
            <h2 class="title-register">
                Lista de Produtos
                <a href="registerproduct.jsp" class="btn btn-primary">Cadastrar Produto</a>
            </h2>
            <br>
            <table id="produtos-list" class="display table">
                <thead>
                    <tr>
                        <th>Titulo</th>
                        <th>Descri��o</th>
                        <th>Preco</th>
                        <th>Itens Produto</th>
                        <th>Vendedor</th>
                        <th>Quantidade</th>
                        <th>Endere�o Loja</th>
                        <th>Telefone</th>
                         <th>A��es</th>
                                            </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</div>
    <div class="space-footer"></div>
     <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>


   <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/script.js"></script>
     
   