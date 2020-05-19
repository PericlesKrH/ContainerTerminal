//Fuction to show and hide password
function Toggle() {
    var temp = document.getElementById("pas");
    if (temp.type === "password") {
        temp.type = "text";
    } else {
        temp.type = "password";
    }
}
//$(document).ready(function () {
//    $('#fpass').on('click', () => {
//        Swal.fire({
//            title: "<i>Acount</i>",
//            html: "Username: Perilee, Password: Cb9javaPT",
//            confirmButtonText: "ok"
//        }).then(function () {
//            window.location.href = "forgotPass";
//        });
//    });


    //Button Fuctions
    $("#submitBtn").mouseenter(function () {
        $("#submitBtn").css("background-color", "lightgray");
        $("#submitBtn").css("color", "black");
    });
    $("#submitBtn").mouseleave(function () {
        $("#submitBtn").css("background-color", "brown");
        $("#submitBtn").css("color", "white");
    });

//    var attempt = 3;
//    $('#submitBtn').on('click', () => {
//        var inputName = $('#uName').val();
//        var password = $('#pas').val();
//        if (inputName == 'Perilee' && password == 'Cb9javaPT') {
//            Swal.fire({
//                title: "<i>Account</i>",
//                html: "Login Successful!!",
//                confirmButtonText: "ok"
//            }).then(function () {
//                window.location.href = "/form/form.html";
//            });
//
//        } else {
//            attempt--;
//            if (attempt > 0) {
//                Swal.fire({
//                    title: "<i>Unseccussful</i>",
//                    html: "You have left " + attempt + " attempt.",
//                    confirmButtonText: "ok",
//                });
//            } else if (attempt == 0) {
//                Swal.fire({
//                    title: "<i>Unseccussful</i>",
//                    html: "No more attempts. Reclaim your password by pressing Forgot my password.",
//                    confirmButtonText: "ok",
//                });
//                $('#submitBtn').prop('disabled', true);
//            }
//        }
//    })
//
//});