<%-- 
    Document   : cadastro
    Created on : 21/11/2018, 09:53:12
    Author     : Murah
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>E-Commercez</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <br><br>
    <style type="text/css">
        
            /*    --------------------------------------------------
            :: Login Section
            -------------------------------------------------- */
        #cadastro {
            padding-top: 50px
        }
        #cadastro .form-wrap {
            width: 30%;
            margin: 0 auto;
        }
        #cadastro h1 {
            color: #1fa67b;
            font-size: 18px;
            text-align: center;
            font-weight: bold;
            padding-bottom: 20px;
        }
        #cadastro .form-group {
            margin-bottom: 25px;
        }
        #cadastro .checkbox {
            margin-bottom: 20px;
            position: relative;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            -o-user-select: none;
            user-select: none;
        }
        #cadastro .checkbox.show:before {
            content: '\e013';
            color: #1fa67b;
            font-size: 17px;
            margin: 1px 0 0 3px;
            position: absolute;
            pointer-events: none;
            font-family: 'Glyphicons Halflings';
        }
        #cadastro .checkbox .character-checkbox {
            width: 25px;
            height: 25px;
            cursor: pointer;
            border-radius: 3px;
            border: 1px solid #ccc;
            vertical-align: middle;
            display: inline-block;
        }
        #cadastro .checkbox .label {
            color: #6d6d6d;
            font-size: 13px;
            font-weight: normal;
        }
        #cadastro .btn.btn-custom {
            font-size: 14px;
            margin-bottom: 20px;
        }
        #cadastro .forget {
            font-size: 13px;
            text-align: center;
            display: block;
        }

            /*    --------------------------------------------------
                :: Inputs & Buttons
                -------------------------------------------------- */
        .form-control {
            color: #212121;
        }
        .btn-custom {
            color: #fff;
            background-color: #1fa67b;
        }
        .btn-custom:hover,
        .btn-custom:focus {
            color: #fff;
        }

            /*    --------------------------------------------------
                :: Footer
                -------------------------------------------------- */
        #footer {
            color: #6d6d6d;
            font-size: 12px;
            text-align: center;
        }
        #footer p {
            margin-bottom: 0;
        }
        #footer a {
            color: inherit;
        }
    </style>
    <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<body>
<section id="cadastro">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="form-wrap">
                    <h1>Cadastro</h1>                    
                    <form method="post" id="cadastro-form">
                         <div class="form-group">
                            <input type="cpf" id="cpf" class="form-control" placeholder="CPF" name="cpf">
                        </div>
                        <div class="form-group">
                            <input type="email" id="email" class="form-control" placeholder="Email" name="email">
                        </div>
                        <div class="form-group">
                            <input type="login" id="id" class="form-control" placeholder="Login" name="login">
                        </div>
                        <div class="form-group">
                            <input type="password" id="key" class="form-control" placeholder="Senha" name="password">
                        </div>
                         
                       
                        <div class="checkbox">
                            <span class="character-checkbox" onclick="showPassword()"></span>
                            <span class="label">Mostrar Senha</span>
                        </div>
                        <input type="submit" id="btn-login" class="btn btn-custom btn-lg btn-block" value="Acessar">
                        <a href="login.jsp">Logar</a>
                    </form>
                    <hr>
                </div>
            </div> <!-- /.col-xs-12 -->
        </div> <!-- /.row -->
    </div> <!-- /.container -->
</section>


<script type="text/javascript">
    function showPassword() {

        var key_attr = $('#key').attr('type');

        if(key_attr != 'text') {

            $('.checkbox').addClass('show');
            $('#key').attr('type', 'text');

        } else {

            $('.checkbox').removeClass('show');
            $('#key').attr('type', 'password');

        }

    }
</script>
</body>
</html>
