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
            console.log("documentocargado");
            $('#inputRut').on('change', function () {
                var rut = $('#inputRut').val();
                if (!Rut(rut)) {
                    alert("rut erroneo");
                }
                console.log("rut= " + rut);
            });

            $('#inputName').on('change', function () {
                var name = $('#inputName').val();
                var stringArr = name.trim().split(" ");
                if (stringArr.length < 3) {
                    alert("Nombre debe contener al menos un nombre y los 2 apellidos");
                }
            });

            $('#inputDateOfBirth').datepicker({
            });

            $('#inputDateOfBirth').on('change', function () {
                var dateS = $('#inputDateOfBirth').val();
                var date = new Date(dateS);
                var today = new Date();
                if (date > today) {
                    alert("Fecha de nacimiento debe ser con fecha anterior a hoy");
                }
            });


        });
    </script>

    <body>
        <form class="container">
            <h1 class="h3 mb-3 font-weight-normal">Por favor ingrese sus Credenciales</h1>
            <div class="row">
                <div class="col-md-6">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="inputRut">Rut</label>
                            </div>
                            <div class="col-md-6">
                                <input type="text" name="inputRut" id="inputRut" class="form-control" placeholder="ej. '17822191-2'" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label for="inputName">Nombre</label>
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
        <script>
            function cifrar() {
                var input_pass = document.getElementById("password");
                input_pass.value = SHA1(input_pass.value);
            }


        </script>
    </body>
</html>
