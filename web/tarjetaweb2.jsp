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
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tarjeta web</title>      
    </head>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#inputCardNum').data("oldValue", "");
            $('#inputCardNum').keydown(function (e) {
                if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110]) !== -1 ||
                    (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) ||
                    (e.keyCode >= 35 && e.keyCode <= 40)) {
                    return;
                }
                if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                    e.preventDefault();
                }
            });
            $('#cardError').hide();
            $('#inputCardNum').on('input', function (e) {
                var cardNum = $('#inputCardNum').val().replace(/\s/g, '');
                if ($('#inputCardNum').data("oldValue").length<cardNum.length){
                    var fString = ""; 
                    for(var i = 0; i<cardNum.length; i++){
                        fString += cardNum[i];
                        if((i+1) != cardNum.length && (i+1)%4 == 0){
                            fString += " ";
                        }
                    }
                    $('#inputCardNum').val(fString);
                }
                 $('#inputCardNum').data("oldValue", cardNum);
            });
            
            $('#inputCardNum').on('change', function (){
                var cardNum = $('#inputCardNum').val().replace(/\s/g, '');
                if(!checkCcValidity(cardNum)){
                    alert("Número de Tarjeta de Crédito Erronea");
                }
            });
        });
        
        function checkCcValidity(ccNumb) {
            if(ccNumb.length<16){
                return false;
            }
            console.log(ccNumb[15])
            var mightySum = 0;
            for(var i = 0; i < 15; i++){
                var currN = parseInt(ccNumb[i]);
                console.log(currN)
                if(i == 0 || i%2 == 0){
                    console.log("index is "+(i+1)+", multiplying by 2")
                    currN *=2;
                }
                if(currN > 9){
                    var rightD = currN%10;
                    var leftD = (currN-rightD)*0.1;
                    console.log("Number "+currN+" is double digit. Adding "+rightD+" and "+leftD);
                    mightySum = mightySum + rightD +leftD;
                }else{
                    console.log("Number "+currN+" is single digit. Adding "+currN);
                    mightySum += currN;
                }
            }
            console.log("Total Sum = "+mightySum);
            mightySum *= 9;
            console.log("Total Sum mult. by 9 = "+mightySum);
            mightySum = mightySum%10;
            console.log("Total Module of 10 = "+mightySum);
            if(mightySum == ccNumb[15]){
                return true;
            }else{
                return false;
            }
        }
    </script>


    <body>
        <div class="card-bounding"
             <form>
                <aside>Numero de tarjeta:</aside>
                <div class="card-container">
                    <!--- ".card-type" is a sprite used as a background image with associated classes for the major card types, providing x-y coordinates for the sprite --->
                    <div class="card-type"></div>
                    <input placeholder="0000 0000 0000 0000" name="inputCardNum" id="inputCardNum" maxlength="19"/>
                    <small id="cardError" class="form-text text-muted" style="color: red !important">Numero de tarjeta erroneo</small>
                    <!-- The checkmark ".card-valid" used is a custom font from icomoon.io --->
                    <div class="card-valid">&#xea10;</div>
                </div>

                <div class="card-details clearfix">

                    <div class="expiration">
                        <aside>Fecha de vencimiento</aside>
                        <input type="text" maxlength="7" placeholder="mm/yyyy" class="form-control"/>
                    </div>

                    <div class="cvv">
                        <aside>Codigo de Seguridad</aside>
                        <input type="text" maxlength="3" placeholder="XXX" class="form-control"/>
                    </div>                
                </div>
                <div class="card-details clearfix">
                    <div class="total_amount">
                        <aside>Monto a pagar</aside>
                        <input type="text" name="inputRut" id="inputRut" class="form-control" placeholder="ej. '500000'">
                    </div>
                    <div class="tipo_tarjeta">
                    </div>
                </div>

                <div class="col-md-6">
                    <input type="button" class="btn btn-lg btn-primary btn-block" id="submit" value="Ingresar">
                </div>
            </form>
        </div> 
    </body>
</html>
