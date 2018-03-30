<%-- 
    Document   : tarjetaWeb
    Created on : Mar 30, 2018, 1:21:30 AM
    Author     : JoseFa
<%--https://stackoverflow.com/questions/6176802/how-to-validate-credit-card-number --%>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-datepicker.css" rel="stylesheet">
        <link href="css/bootstrap-datepicker.min.css" rel="stylesheet">            
    </head>

    <%-- 
    <script type="text/javascript">
        $('#inputCreditCard').on('change', function () {
            var cardNum = $('#inputCreditCard').val();
            if (!Mod10(cardNum)) {
                alert("Numero de tarjeta no valido")
            }
        });
    </script>
    --%>
    
    <script type="text/javascript">
        /*Basically, the alorithum takes each digit, from right to left and muliplies each second
         digit by two.If the multiple is two - digits long (i.e.: 6 * 2 = 12) the two digits of
         the multiple are then added together for a new number (1 + 2 = 3).You then add up the
         string of numbers, both unaltered and new values and get a total sum.This sum is then
         divided by 10 and the remainder should be zero if it is a valid credit card.Hense the
         name Mod 10 or Modulus 10. 
         */
        function Mod10(ccNumb) {
            var valid = "0123456789"  // Valid digits in a credit card number
            var len = ccNumb.length;  // The length of the submitted cc number
            var iCCN = parseInt(ccNumb);  // integer of ccNumb
            var sCCN = ccNumb.toString();  // string of ccNumb
            sCCN = sCCN.replace(/^\s+|\s+$/g, '');  // strip spaces
            var iTotal = 0;  // integer total set at zero
            var bNum = true;  // by default assume it is a number
            var bResult = false;  // by default assume it is NOT a valid cc
            var temp;  // temp variable for parsing string
            var calc;  // used for calculation of each digit

            // Determine if the ccNumb is in fact all numbers
            for (var j = 0; j < len; j++) {
                temp = "" + sCCN.substring(j, j + 1);
                if (valid.indexOf(temp) == "-1") {
                    bNum = false;
                }
            }

            // if it is NOT a number, you can either alert to the fact, or just pass a failure
            if (!bNum) {
                /*alert("Not a Number");*/bResult = false;
            }

            // Determine if it is the proper length 
            if ((len == 0) && (bResult)) {  // nothing, field is blank AND passed above # check
                bResult = false;
            } else {  // ccNumb is a number and the proper length - let's see if it is a valid card number
                if (len >= 15) {  // 15 or 16 for Amex or V/MC
                    for (var i = len; i > 0; i--) {  // LOOP throught the digits of the card
                        calc = parseInt(iCCN) % 10;  // right most digit
                        calc = parseInt(calc);  // assure it is an integer
                        iTotal += calc;  // running total of the card number as we loop - Do Nothing to first digit
                        i--;  // decrement the count - move to the next digit in the card
                        iCCN = iCCN / 10;                               // subtracts right most digit from ccNumb
                        calc = parseInt(iCCN) % 10;    // NEXT right most digit
                        calc = calc * 2;                                 // multiply the digit by two
                        // Instead of some screwy method of converting 16 to a string and then parsing 1 and 6 and then adding them to make 7,
                        // I use a simple switch statement to change the value of calc2 to 7 if 16 is the multiple.
                        switch (calc) {
                            case 10:
                                calc = 1;
                                break;       //5*2=10 & 1+0 = 1
                            case 12:
                                calc = 3;
                                break;       //6*2=12 & 1+2 = 3
                            case 14:
                                calc = 5;
                                break;       //7*2=14 & 1+4 = 5
                            case 16:
                                calc = 7;
                                break;       //8*2=16 & 1+6 = 7
                            case 18:
                                calc = 9;
                                break;       //9*2=18 & 1+8 = 9
                            default:
                                calc = calc;           //4*2= 8 &   8 = 8  -same for all lower numbers
                        }
                        iCCN = iCCN / 10;  // subtracts right most digit from ccNum
                        iTotal += calc;  // running total of the card number as we loop
                    }  // END OF LOOP
                    if ((iTotal % 10) == 0) {  // check to see if the sum Mod 10 is zero
                        bResult = true;  // This IS (or could be) a valid credit card number.
                    } else {
                        bResult = false;  // This could NOT be a valid credit card number
                    }
                }
            }
            // change alert to on-page display or other indication as needed.
            if (bResult) {
                alert("This IS a valid Credit Card Number!");
            }
            if (!bResult) {
                alert("This is NOT a valid Credit Card Number!");
            }
            return bResult; // Return the results
        }
    </script>
    
    <script type="text/javascript">
                            
    </script>



    <body>
        <form name="Form1" class="container">
            <h1 class="h3 mb-3 font-weight-normal">Tarjeta de Credito</h1>
            <div class="row">
                <div class="col-md-6">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="inputRut">N tarjeta</label>
                            </div>
                            <div class="col-md-6">
                                <input type="text" name="CreditCard" id="inputRut" class="form-control" placeholder="ej. '4012888888881881'" required >
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label for="inputName">Tipo Tarjeta</label>
                            </div>
                            <div class="col-md-6">
                                <input type="text" name="inputName" id="inputName" class="form-control" placeholder="ej. 'Carlos Abarzua Castro'" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label for="inputDateOfBirth">Fecha de Nacimiento</label>
                            </div>
                            <div class="col-md-6">
                                <input type="text" name="inputDateOfBirth" id="inputDateOfBirth" class="form-control" placeholder="ej. '27/09/1971'" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label for="inputCreditCard">Tarjeta de Crédito</label>
                            </div>
                            <div class="col-md-6">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="inputCreditCard" id="yes" value="yes">
                                    <label class="form-check-label" for="yes">Yes</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="inputCreditCard" id="no" value="no">
                                    <label class="form-check-label" for="no">No</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label for="clientType">Tipo Cliente</label>
                            </div>
                            <div class="col-md-6">
                                <select class="form-control" id="clientType">
                                    <option>Seleccion</option>
                                    <option>Black</option>
                                    <option>Gold</option>
                                    <option>Silver</option>
                                </select>
                            </div>
                        </div>    
                        <div class="row">
                            <div class="col-md-6">
                                <input type="button" class="btn btn-lg btn-primary btn-block" id="submit" value="Ingresar">
                            </div>
                        </div>
                    </div>
                </div>             
            </div>
        </form>






        <div align="center">
            <table width="50%" border="0" cellspacing="0" cellpadding="5">
                <tr>
                    <td width="50%" align="right">Credit Card Number:   </td>
                    <td width="50%">
                        <input name="" type="text" value="4012888888881881" size="18" maxlength="16" style="border: 1px solid #000098; padding: 3px;">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="button" name="Button" style="color: #fff; background: #000098; font-weight:bold; border: solid 1px #000;" value="TEST CARD NUMBER" onClick="return Mod10(document.Form1.CreditCard.value);">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>

