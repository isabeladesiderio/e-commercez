<jsp:include page="inc/header.jsp"/>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2 col-lg-2">
            <div class="card">
                <h3>Marcas</h3>
                <input type='hidden' id='current' value='<% out.print(request.getParameter("marca")); %>'/>
                <ul class='marcas'>
                    <li>
                        <div class="lds-roller">
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-sm-12 col-md-10 col-lg-10 produtos">
            <div class="lds-roller">
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="inc/footer.jsp"/>