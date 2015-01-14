$(function(){
    $('.trademark_select').on('change', function(){
      var trademark_id = $(this).val();
      $.ajax({
        url: "/models",
        data: {trademark_id: trademark_id}
      })
      .done(function( data ) {
        var options = "<option value=''>Seleccione un modelo</option>";

        for(var i=0; i< data.models.length; i++){
          var model = data.models[i];
          options += "<option price='"+model.price+"' value='"+model.id+"'>"+model.name+"</option>"
        }

        $('.model_select').html(options);
        $('.state_select').trigger('change');
      });
    });

    $('.state_select').on('change', function(){
        var state_id = $(this).val();
      $.ajax({
        url: "/states/" + state_id,
      })
      .done(function( data ) {
        var model = $('.model_select option:selected')
        var valor_total = (parseInt(model.attr('price')) * parseInt(data.factor))/100;
        var formated_price = $.number( valor_total, 0, ',', '.' );

        $('.phone-total-price .value').text("$" + formated_price);
      });

    });

    $('.model_select').on('change', function(){
      $('.state_select').trigger('change');
    });

});

//-------------------------------------------validar RUT-----------------------------//

$(function(){

  function validaRut(rut){
    var rexp = new RegExp(/^([0-9])+\-([kK0-9])+$/);
    if(rut.match(rexp)){
        var RUT   = rut.split("-");
        var elRut = RUT[0];
        var factor  = 2;
        var suma  = 0;
        var dv;
        for(i=(elRut.length-1); i>=0; i--){
            factor = factor > 7 ? 2 : factor;
            suma += parseInt(elRut[i])*parseInt(factor++);
        }
        dv = 11 -(suma % 11);
        if(dv == 11){
          dv = 0;
        }else if (dv == 10){
          dv = "k";
        }

        if(dv == RUT[1].toLowerCase()){
          $('.form-body-customer .rut').removeClass('has-error');
          $('.form-body-customer .rut').removeClass('has-error');
          $('.form-body-customer .rut .rut-invalid').addClass("hidden");
          $('.form-body-customer .format-rut-invalid').addClass('hidden');
          
          return true;
        }else{      
          console.log("el rut  es incorrecto");
          $('.form-body-customer .rut').addClass('has-error');
          $('.form-body-customer .rut-invalid').removeClass("hidden");
          $('.form-body-customer .format-rut-invalid').addClass('hidden');
          return false;
        }
    }else{        
        console.log("el formato es incorrecto");
        $('.form-body-customer .rut').addClass('has-error');
        $('.form-body-customer .rut-invalid').addClass("hidden");
        $('.form-body-customer .format-rut-invalid').removeClass('hidden');

        return false;
    }
  }

//--- validacion rut chileno----
  $('#customer_rut').on('blur',function(){
    var rut = $(this).val();
    validaRut(rut)
  });
// ------ validacion rut chileno on click-----
  $('#buton-cliente').on('click',function(){
    var rut = $('#customer_rut').val();
    if(validaRut(rut)){
      return true;
    }else{
      return false;
    }

  });

//----validacion name empty ----
  $('#customer_name').on('blur', function(){
    var name = $(this).val();
      if(name==''){
        $('.form-body-customer .name').addClass('has-error');
        $('.form-body-customer .name-empty').removeClass("hidden");
        return false;
      }else{
        $('.form-body-customer .name').removeClass('has-error');
        $('.form-body-customer .name-empty').addClass('hidden');
        return true;
      }
  });

//---- validacion name on Click ------
  $('#buton-cliente').on('click',function(){
      var name = $('#customer_name').val();
      if(name==''){
        $('.form-body-customer .name').addClass('has-error');
        $('.form-body-customer .name-empty').removeClass("hidden");
        return false;
      }else{
        $('.form-body-customer .name').removeClass('has-error');
        $('.form-body-customer .name-empty').addClass('hidden');
        return true;
      }
});

// ---- validacion last name empty ----
  $('#customer_last_name').on('blur', function(){
    var last_name = $(this).val();
      if(last_name==''){
        $('.form-body-customer .last_name').addClass('has-error');
        $('.form-body-customer .last_name-empty').removeClass('hidden');
        return false;
      }else{
        $('.form-body-customer .last_name').removeClass('has-error');
        $('.form-body-customer .last_name-empty').addClass('hidden');
        return true;
      }
  });
  //------------- validacion last name on Click---------
  $('#buton-cliente').on('click',function(){
      var last_name = $('#customer_last_name').val();
      if(last_name==''){
        $('.form-body-customer .last_name').addClass('has-error');
        $('.form-body-customer .last_name-empty').removeClass('hidden');
        return false;
      }else{
        $('.form-body-customer .last_name').removeClass('has-error');
        $('.form-body-customer .last_name-empty').addClass('hidden');
        return true;
      }

  });

 //-------------- validacion email ------
 $('#customer_email').on('blur',function(){
  var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
  var email = $(this).val();
        
  if(filter.test(email)){
    $('.form-body-customer .email').removeClass('has-error');
    $('.form-body-customer .email-format').addClass('hidden');
    return true;

  }else{
    
    $('.form-body-customer .email').addClass('has-error');
    $('.form-body-customer .email-format').removeClass('hidden');
    return false;
  }


 });
  //------------- validacion Email on Click---------
  $('#buton-cliente').on('click',function(){
  var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
  var email = $('#customer_email').val();
        
  if(filter.test(email)){
    $('.form-body-customer .email').removeClass('has-error');
    $('.form-body-customer .email-format').addClass('hidden');
    return true;

  }else{
    
    $('.form-body-customer .email').addClass('has-error');
    $('.form-body-customer .email-format').removeClass('hidden');
    return false;
  }

  });


//---- validacion Address ------------
  $('#customer_address').on('blur',function(){
    var address = $(this).val();
      if(address==''){
        $('.form-body-customer .address').addClass('has-error');
        $('.form-body-customer .address-empty').removeClass('hidden');
        return false;
      }else{
        $('.form-body-customer .address').removeClass('has-error');
        $('.form-body-customer .address-empty').addClass('hidden')
        return true;
      }
  });
  //------------- validacion Address on Click---------
  $('#buton-cliente').on('click',function(){
    var address = $('#customer_address').val();
      if(address==''){
        $('.form-body-customer .address').addClass('has-error');
        $('.form-body-customer .address-empty').removeClass('hidden');
        return false;
      }else{
        $('.form-body-customer .address').removeClass('has-error');
        $('.form-body-customer .address-empty').addClass('hidden')
        return true;
      }

  });

//-------- validacion phone --------------isNaN(phone) ---phone.length != 8
  $('#customer_phone').on('blur', function(){
    var phone = $(this).val();

      if(phone == ''){
          $('.form-body-customer .phone').addClass('has-error');
          $('.form-body-customer .phone-empty').removeClass('hidden');
          $('.form-body-customer .phone-numero').addClass('hidden');
          $('.form-body-customer .phone-length').addClass('hidden');
          return false;
      }else if(!isNaN(phone)){
          if(phone.length != 8){
            $('.form-body-customer .phone').addClass('has-error');
            $('.form-body-customer .phone-length').removeClass('hidden');
            $('.form-body-customer .phone-numero').addClass('hidden');
            $('.form-body-customer .phone-empty').addClass('hidden');
            return false;
          }
      }else{
        $('.form-body-customer .phone').addClass('has-error');
        $('.form-body-customer .phone-numero').removeClass('hidden');
        $('.form-body-customer .phone-empty').addClass('hidden');
        $('.form-body-customer .phone-length').addClass('hidden');
        return false;
      }
     $('.form-body-customer .phone').removeClass('has-error');
     $('.form-body-customer .phone-numero').addClass('hidden');
     $('.form-body-customer .phone-empty').addClass('hidden');
     $('.form-body-customer .phone-length').addClass('hidden');
     return true;
    
  });

  //------------- validacion phone ---isNaN(phone) ---phone.length != 8 on Click---
    $('#buton-cliente').on('click',function(){
       var phone = $('#customer_phone').val();

      if(phone == ''){
          $('.form-body-customer .phone').addClass('has-error');
          $('.form-body-customer .phone-empty').removeClass('hidden');
          $('.form-body-customer .phone-numero').addClass('hidden');
          $('.form-body-customer .phone-length').addClass('hidden');
          return false;
      }else if(!isNaN(phone)){
          if(phone.length != 8){
            $('.form-body-customer .phone').addClass('has-error');
            $('.form-body-customer .phone-length').removeClass('hidden');
            $('.form-body-customer .phone-numero').addClass('hidden');
            $('.form-body-customer .phone-empty').addClass('hidden');
            return false;
          }
      }else{
        $('.form-body-customer .phone').addClass('has-error');
        $('.form-body-customer .phone-numero').removeClass('hidden');
        $('.form-body-customer .phone-empty').addClass('hidden');
        $('.form-body-customer .phone-length').addClass('hidden');
        return false;
      }
     $('.form-body-customer .phone').removeClass('has-error');
     $('.form-body-customer .phone-numero').addClass('hidden');
     $('.form-body-customer .phone-empty').addClass('hidden');
     $('.form-body-customer .phone-length').addClass('hidden');
     return true;


    });

});



