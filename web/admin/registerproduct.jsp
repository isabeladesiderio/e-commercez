<jsp:include page="header-auth.jsp" />
<div class="col-sm-12 col-md-12 col-lg-12 mt-4">
    <form action="" id="register-product" enctype="multipart/form-data">
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-12 text-center">
                <p class="text-center">Imagem de Produto</p>
                <img src="https://png2.kisspng.com/20180320/izw/kisspng-computer-icons-packaging-and-labeling-box-icon-vector-production-5ab0b0a35f9c09.3216543315215289953916.png" id="img-prod" width="150" height="150" class="rounded mx-auto d-block" alt="...">
                <p>
                    <br/>
                    <input type="hidden" id="imagem" value=""/>
                    <input type="file" id="image-input" name="image-input" style="display:none;"/>
                    <button type="button" class="btn btn-default file">Procurar imagem</button>
                </p> 
            </div>
            <div class="col-sm-12 col-md-12 col-lg-12">
                <label>Titulo</label>
                <input type="text" name="titulo" class="form-control" id="titulo" placeholder="Titulo"/>
            </div>
            <div class="col-sm-12 col-md-12 col-lg-12">
                <label>Descrição</label>
                <textarea name="descricao" id="descricao" class="form-control" placeholder="Descrição do produto..."></textarea>
            </div>
            <div class="col-sm-12 col-md-3 col-lg-3">
                <label>Vendedor</label>
                <input type="text" name="vendedor" class="form-control" id="vendedor" placeholder="Vendedor"/>
            </div>
            <div class="col-sm-12 col-md-3 col-lg-3">
                <label>Quantidade</label>
                <input type="number" name="quantidade" class="form-control" id="quantidade" placeholder="Quantidade Disponível"/>
            </div>
            <div class="col-sm-12 col-md-3 col-lg-3">
                <label>Endereço da Loja</label>
                <input type="text" name="endereco" class="form-control" id="endereco" placeholder="Endereço da Loja"/>
            </div>
            <div class="col-sm-12 col-md-3 col-lg-3">
                <label>Telefone</label>
                <input type="text" name="telefone" class="form-control" id="telefone" placeholder="Telefone"/>
            </div>
            <div class="col-sm-12 col-md-12 col-lg-12">
                <label>Preço</label>
                <input type="text" name="preco" class="form-control" id="preco" placeholder="Preço"/>
            </div>
            <div class="col-sm-12 col-md-12 col-lg-12 text-center">
                <br/><input type="submit" class="btn btn-primary" value="Salvar"/>
                <a href="adashboard.jsp" class="btn">Voltar</a>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/script.js"></script>
     
   