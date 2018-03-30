<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="../../../../favicon.ico">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-datepicker.css" rel="stylesheet">
        <link href="css/bootstrap-datepicker.min.css" rel="stylesheet">
    </head>
    <script src="js/validarut.js" type="text/javascript"></script>
    <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="js/bootstrap-datepicker.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#rutError').hide();
            $('#nameError').hide();
            $('#dobError').hide();
            $('#inputRut').on('input', function () {
                var rut = $('#inputRut').val();
                if (!Rut(rut)) {
                    console.log("error");
                    $('#inputRut').css({'border': '1px !important', 'border-color': 'red'});
                    $('#rutError').show();
                } else {
                    $('#inputRut').removeAttr('style');
                    $('#rutError').hide();
                }

            });

            $('#inputName').on('input', function () {
                if (!validateName($('#inputName').val())) {
                    $('#inputName').css({'border': '1px !important', 'border-color': 'red'});
                    $('#nameError').show();
                }else{
                    $('#inputName').removeAttr('style');
                    $('#nameError').hide();
                }
            });

            $('#inputDateOfBirth').datepicker({
            });

            $('#inputDateOfBirth').on('change', function () {

                if ($('#inputDateOfBirth').val() == '' || !validateDate($('#inputDateOfBirth').val())) {
                    $('#inputDateOfBirth').css({'border': '1px !important', 'border-color': 'red'});
                    $('#dobError').show();
                }else{
                    $('#inputDateOfBirth').removeAttr('style');
                    $('#dobError').hide();
                }
            });
            
            $("#submit").click(function (e) {
                console.log("main fom submited");
                var isRutValid = Rut($('#inputRut').val());
                var isNameValid = validateName($('#inputName').val());
                var isDoBValid = validateDate($('#inputDateOfBirth').val());
                console.log($('#clientType').val());
                var isCliTypeValid = ($('#clientType').val() == null || $('#clientType').val() == '') ? false : true;
                if (!isRutValid || !isNameValid || !isDoBValid || !isCliTypeValid) {
                    e.preventDefault();
                    alert("Validacion ha fallado");
                    $('#inputRut').trigger('input');
                    $('#inputName').trigger('input');
                    $('#inputDateOfBirth').trigger('change');
                    return false;
                }
            }); 


        });
        
        function validateDate(dateS){
            var date = new Date(dateS);
            var today = new Date();
            if(date > today){
                return false;
            }else{
                return true;
            }
        }
        
        function validateName(name){
            var stringArr = name.trim().split(" ");
            if (stringArr.length < 3){
                return false;
            }else{
                return true;
            }
        }
    </script>

    <body>
        <form class="container" id="mainForm">
            <h1 class="h3 mb-3 font-weight-normal">Por favor ingrese sus Credenciales</h1>
            <div id="mainContainer">
                <div class="row align-items-center">
                    <div class="col-md-2 offset-md-2">
                        <label for="inputRut">Rut</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="inputRut" id="inputRut" class="form-control" placeholder="ej. '17822191-2'" required>
                        <small id="rutError" class="form-text text-muted" style="color: red !important">Rut Erroneo</small>
                    </div>
                </div>
                <div class="row align-items-center">
                    <div class="col-md-2 offset-md-2">
                        <label for="inputName">Nombre</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="inputName" id="inputName" class="form-control" placeholder="ej. 'Carlos Abarzua Castro'" required>
                        <small id="nameError" class="form-text text-muted" style="color: red !important">Nombre Erroneo. Ingrese al menos 1 nombre y 2 apellidos</small>
                    </div>
                </div>
                <div class="row align-items-center">
                    <div class="col-md-2 offset-md-2">
                        <label for="inputDateOfBirth">Fecha de Nacimiento</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="inputDateOfBirth" id="inputDateOfBirth" class="form-control" placeholder="ej. '27/09/1971'" required>
                        <small id="dobError" class="form-text text-muted" style="color: red !important">Fecha de Nacimiento erronea. Debe ser anterior al día de hoy</small>
                    </div>
                </div>
                <div class="row align-items-center">
                    <div class="col-md-2 offset-md-2">
                        <label for="inputCreditCard">Tarjeta de Crédito</label>
                    </div>
                    <div class="col-md-6">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" checked="checked" type="radio" name="inputCreditCard" id="yes" value="yes">
                            <label class="form-check-label" for="yes">Si</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="inputCreditCard" id="no" value="no">
                            <label class="form-check-label" for="no">No</label>
                        </div>
                    </div>
                </div>
                <div class="row align-items-center">
                    <div class="col-md-2 offset-md-2">
                        <label for="clientType">Tipo Cliente</label>
                    </div>
                    <div class="col-md-6">
                        <select class="form-control" id="clientType">
                            <option value="" disabled selected hidden>Selection</option>
                            <option value="black">Black</option>
                            <option value="gold">Gold</option>
                            <option value="silver">Silver</option>
                        </select>
                    </div>
                </div>    
                <div class="row align-items-center" style="margin-top: 7%">
                    <div class="col-md-4 offset-md-4">
                        <input type="button" class="btn btn-lg btn-primary btn-block" id="submit" value="Ingresar">
                    </div>
                </div>
            </div>
        </form>
        <script>
            function cifrar() {
                var input_pass = document.getElementById("password");
                input_pass.value = SHA1(input_pass.value);
            }


        </script>
    </body>
</html>

<style>
    .row{
        margin: 2% 0 2% 0
    }
    
    #mainContainer{
        margin: auto
    }
</style>
