<%-- 
    Document   : tarjetaweb2
    Created on : Mar 30, 2018, 1:48:05 AM
    Author     : JoseFa
https://www.cssscript.com/minimal-credit-card-input-validation-library-creditcardvalidator-js/
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="js/creditCardValidator.js" type="text/javascript"></script>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tarjeta web</title>      
    </head>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#cardError').hide();
            console.log("pagina cargada");
            $('#cardNum').on('blur', function () {
                var cardNum = $('#inputCardNum').val();
                if (!valid_credit_card(cardNum)) {
                    console.log("error");
                    $('#inputCardNum').css({'border': '1px !important', 'border-color': 'red'});
                    $('#cardError').show();
                } else {
                    $('#inputCardNum').removeAttr('style');
                    $('#cardError').hide();
                }

            });
        });
    </script>


    <body>

        <div class="card-bounding">

            <aside>Numero de tarjeta:</aside>
            <div class="card-container">
                <!--- ".card-type" is a sprite used as a background image with associated classes for the major card types, providing x-y coordinates for the sprite --->
                <div class="card-type"></div>
                <input placeholder="0000 0000 0000 0000" name="inputCardNum" id="inputCardNum" />
                <small id="cardError" class="form-text text-muted" style="color: red !important">Numero de tarjeta erroneo</small>
                <!-- The checkmark ".card-valid" used is a custom font from icomoon.io --->
                <div class="card-valid">&#xea10;</div>
            </div>

            <div class="card-details clearfix">

                <div class="expiration">
                    <aside>Fecha de vencimiento</aside>
                    <input maxlength="7" placeholder="mm/yyyy" />
                </div>

                <div class="cvv">
                    <aside>Codigo de Seguridad</aside>
                    <input placeholder="XXX"/>
                </div>                
            </div>
            <div class="card-details clearfix">
                <div class="col-md-6">
                    <label for="inputRut">Monto a pagar</label>
                </div>
                <div class="col-md-6">
                    <input type="text" name="inputRut" id="inputRut" class="form-control" placeholder="ej. '500000'" required>
                </div> 
            </div>

            <div class="col-md-6">
                <input type="button" class="btn btn-lg btn-primary btn-block" id="submit" value="Ingresar">
            </div>
        </div> 
    </body>
</html>
