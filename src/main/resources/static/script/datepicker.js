$(document).ready(function () {
    $("input[type=button]").datepicker({format: 'yyyy-mm-dd', autoclose: true, startDate: new Date()});
});
var arr = [];
var arr1 = [];
var subtotal = 0;
var countIndex = $("#countIndex").val();
function parseDate(input) {
    var parts = input.split("-");
    var date = new Date(parts[0], parts[1] - 1, parts[2]);
    return date;
}
function allagi(index) {
    var start = parseDate($("#datepicker" + index).val());
    var end = parseDate($("#datepicker1" + index).val());
    var days = (Math.ceil((end - start) / (1000 * 60 * 60 * 24))) - 1;
    var fee = days * 8;
    if (days <= 0) {
        $("#showDiff" + index).val("(0 days) $" + (0 * 8));
    } else {
        $("#showDiff" + index).val("(" + days + " days) $" + fee);
    }
    var addsd = (fee + parseInt($("#type" + index).val()));
    $("#showAmount" + index).val("$" + (fee + parseInt($("#type" + index).val())));
    arr[index] = addsd;
    console.log(arr);
    subtotal = 0;
    arr1 = arr.filter(function () {
        return true;
    });
    console.log(arr1);
    for (var i = 0; i < arr1.length; i++) {
        subtotal += arr1[i];
    }
    console.log("Subtotal: " + subtotal);
    var showTax = (subtotal * 24) / 100;
    var showTaxFixed = showTax.toFixed(2);
    var showTotal = subtotal + showTax;
    var showTotalFixed = showTotal.toFixed(2);
    localStorage.setItem("total",showTotalFixed);
    
    $("#showSubtotal").replaceWith("<strong id='showSubtotal'>$" + subtotal + " </strong>");
    $("#showTax").replaceWith("<strong id='showTax'>$" + showTaxFixed + " </strong>");
    $("#showTotal").replaceWith("<h4><strong id='showTotal'>" + showTotalFixed + "</strong></h4>");
}
function commitPayment() {
    console.log(arr1.length);
    console.log(arr.length);
    arr.length = countIndex;
    if ((arr1.length === arr.length) && (arr1.length > 0)) {
        swal({
            title: "Caution",
            text: "Are you sure?",
            buttons: true,
            icon: "warning"
        }).then((willCommit) => {
            if (willCommit) {
                swal("Committed Successfully!!", {
                    icon: "success"
                }).then(function () {
                    var index = $("#countIndex").val();
                    for (var i = 0; i < index; i++) {
                        $("#datepicker1" + i).prop("disabled", true);
                    }
                    $("#lala").replaceWith("<a  href='/goToPaypal' style='color:white' id='lala' >Pay now!</a>");
                    $("#commitBTN").prop("disabled", true);
                  
                    $("#paymentBTN").prop("disabled", false);
                    $("#printPay").prop("disabled", false);                    
                });
            } else {
                swal("Retype your dates.")
            }
        });
    } else {
        swal({
            title: "Caution",
            text: "Please complete all 'Paid Date' fields",
            icon: "warning"
        });
    }
}
function printingPage(areaID) {
    var printContent = document.getElementById(areaID);
    var WinPrint = window.open('', '', 'width=900,height=650');
    WinPrint.document.write(printContent.innerHTML);
    WinPrint.document.close();
    WinPrint.focus();
    WinPrint.print();
    WinPrint.close();
}
