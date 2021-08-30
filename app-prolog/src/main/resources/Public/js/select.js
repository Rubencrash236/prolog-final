const boton = document.querySelector("#myCheck");
// Agregar listener
boton.addEventListener("click", function(evento){
    var values = $('#select-meal-type').val();
    var values2 = $('#select-meal-type2').val();

    console.log(values);
    document.cookie = "servicios="+values;
    document.cookie = "otras="+values2;


});

$(document).ready(function (){
    $('.multi_select').selectpicker();

})






