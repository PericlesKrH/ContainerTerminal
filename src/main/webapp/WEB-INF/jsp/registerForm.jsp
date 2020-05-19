<!DOCTYPE html>
<html lang="en">

<head>
    <title>Sign up</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.10.2/css/all.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script>
    <style>
          
        body {
            background-image: url("/images/register1.jpg");
        }

        .register-form h1 {
            font-size: 42px;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin: 150px 0px;
            line-height: 60px;
        }

        .register-form .form-control {
            border: none;
            background: none;
            border-bottom: 1px solid#dc3545;
            border-radius: 0px !important;
            color: #fff;
        }

        .register-form .form-control:focus,
        .register-form .form-control:hover {
            border: none;
            margin: 0 auto;
            background: none;
            box-shadow: none;
            border-bottom: 1px solid #fff;
            color: #fff;
        }
    </style>
</head>

<body>
    <br>
    <div class="register-form mt-3 mb-3">
        <div class="container">
            <div class="row">
                <div class="col-md-6 d-none d-md-block bg-danger">
                    <h1 class="text-center pt-3">Registration<br>Form</h1>
                </div>
                <div class="col-md-6 bg-secondary">
                    <form action="/registerForm" method="POST" class="needs-validation" novalidate  onkeyup="check()" >
                        <div class="form-group">
                            <label for="uname"><i class="fas fa-user" ></i> Username</label>
                            <input type="text" class="form-control" name="uname" id="uname" maxlength="10" required>
                        </div>
                        <div class="form-group">
                            <label for="password"><i class="fas fa-lock"></i> Password</label>
                            <input type="password" class="form-control" name="pas" id="password"  maxlength="10"  required>
                        </div>
                        <div class="form-group">
                            <label for="confirmPassword"><i class="fas fa-lock"></i> Confirm Password</label>
                            <input type="password" class="form-control" id="confirmPassword" maxlength="10"  required>
                            <span id="message"></span>
                        </div>
                        <div class="form-group">
                            <label for="vat"><i class="fa fa-address-card"></i> VAT number</label>
                            <input type="text" class="form-control" name="vat" id="vat" maxlength="9" required >
                            <span id="vatmessage"></span>
                        </div>
                        <div class="form-group">
                            <label for="taxoffice"><i class="fa fa-building"></i> Tax Office</label>
                            <input type="text" class="form-control" name="doy" id="taxoffice" maxlength="15" required>
                        </div>
                        <div class="form-group">
                            <label for="address"><i class="fa fa-building"></i> Address</label>
                            <input type="text" class="form-control" name="address" id="address" maxlength="20" required>
                        </div>
                        <div class="form-group form-check">
                            <label class="form-check-label">
                                <input class="form-check-input" type="checkbox" onclick="Toggle()">Show Password
                            </label>
                        </div>
                        <button type="submit" class="btn btn-danger mb-3 mt-3 float-right">Register</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <br>
    <div style="text-align:center;"> <button type="button" class="btn btn-secondary" onclick="history.back()"><i class="fa fa-arrow-circle-left"></i> Go back</button></div>
   <script>
        // Disable form submissions if there are invalid fields
        (function() {
          'use strict';
          window.addEventListener('load', function() {
            // Get the forms we want to add validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function(form) {
              form.addEventListener('submit', function(event) {
                if (form.checkValidity() === false) {
                  event.preventDefault();
                  event.stopPropagation();
                }
                form.classList.add('was-validated');
              }, false);
            });
          }, false);
        })();
        
    //Verify password after retyping
    var check = function() {
  if (document.getElementById('password').value ==document.getElementById('confirmPassword').value) {
    document.getElementById('message').style.color = 'green';
    document.getElementById('message').innerHTML = 'matching';
  } else {
    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'not matching';
  }
}


function Toggle() {
    var temp = document.getElementById("password");
    var confirmTemp=document.getElementById("confirmPassword");
    if (temp.type === "password" && confirmTemp.type === "password" ) {
        temp.type = "text";
        confirmTemp.type="text";
    } else {
        temp.type = "password";
        confirmTemp.type="password";
    }
}

        
        </script>
</body>

</html>