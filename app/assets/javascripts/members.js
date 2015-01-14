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
          console.log("rut valido");
          $('.rut').removeClass('has-error');
          $('.rut').removeClass('has-error');
          $('.error-rut-invalid').addClass("hidden");
          $('.error-rut-formato').addClass('hidden');
          
          return true;
        }else{      
          console.log("el rut  es incorrecto");
          $('.rut').addClass('has-error');
          $('.error-rut-invalid').removeClass("hidden");
          $('.error-rut-formato').addClass('hidden');
          return false;
        }
    }else{        
        console.log("el formato es incorrecto");
        $('.rut').addClass('has-error');
        $('.error-rut-invalid').addClass("hidden");
        $('.error-rut-formato').removeClass('hidden');

        return false;
    }
  }
  //----- Validación de Rut Blur ------------------
      $('#user_rut').on('blur',function(){
        var rut = $(this).val();
        validaRut(rut)
      });
  //------- Validación de Rut On Click-------------
       $('#buton-member').on('click',function(){
        var rut = $('#user_rut').val();
        if(validaRut(rut)){
          return true;
        }else{
          return false;
        }

      });
  //--------Validación de nombre Blur-----------
      $('#user_name').on('blur', function(){
        var name = $(this).val();
        if(name==''){
            $('.name').addClass('has-error');
            $('.error-name').removeClass('hidden');
            return false;
        }else{
            $('.name').removeClass('has-error');
            $('.error-name').addClass('hidden');
            return true;
        }

      });
  //-------- validacion de Nombre On click---------
    $('#buton-member').on('click', function(){
        var name = $('#user_name').val();
        if(name==''){
            $('.name').addClass('has-error');
            $('.error-name').removeClass('hidden');
            return false;
        }else{
            $('.name').removeClass('has-error');
            $('.error-name').addClass('hidden');
            return true;
        }
    });

  //---------validacion de last name Blur -----
    $('#user_last_name').on('blur', function(){
       var last_name = $(this).val();
        if(last_name==''){
            $('.last_name').addClass('has-error');
            $('.error-last_name').removeClass('hidden');
            return false;
        }else{
            $('.last_name').removeClass('has-error');
            $('.error-last_name').addClass('hidden');
            return true;
        } 

    });
  //----------Validacion de last name On Click------
    $('#buton-member').on('click', function(){
       var last_name = $('#user_last_name').val();
        if(last_name==''){
            $('.last_name').addClass('has-error');
            $('.error-last_name').removeClass('hidden');
            return false;
        }else{
            $('.last_name').removeClass('has-error');
            $('.error-last_name').addClass('hidden');
            return true;
        } 

    });

  //----------validacion de email Blur -------
    $('#user_email').on('blur',function(){
       var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        var email = $(this).val();
        if(filter.test(email)){
          $('.email').removeClass('has-error');
          $('.error-email').addClass('hidden');
          return true;
        }else{
          $('.email').addClass('has-error');
          $('.error-email').removeClass('hidden');
          return false;
        }
    });
  //-----------validacion de email On Click --------
     $('#buton-member').on('click',function(){
         var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
          var email = $('#user_email').val();
          if(filter.test(email)){
            $('.email').removeClass('has-error');
            $('.error-email').addClass('hidden');
            return true;
          }else{
            $('.email').addClass('has-error');
            $('.error-email').removeClass('hidden');
            return false;
          }
      });
  //----------validacion de address Blur-----
    $('#user_address').on('blur',function(){
      var address = $(this).val();
      if(address == ''){
          $('.address').addClass('has-error');
          $('.error-address').removeClass('hidden');
          return false;
      }else{
          $('.address').removeClass('has-error');
          $('.error-address').addClass('hidden');
          return true;
      }

    });
  //---------- validacion address On Click-----
     $('#buton-member').on('click',function(){
    var address = $('#user_address').val();
    if(address == ''){
        $('.address').addClass('has-error');
        $('.error-address').removeClass('hidden');
        return false;
    }else{
        $('.address').removeClass('has-error');
        $('.error-address').addClass('hidden');
        return true;
    }

  });  

//------------validacion teléfono "Blur"-----

 $('#user_contact_number').on('blur', function(){
    var phone = $(this).val();

      if(phone == ''){
          $('.phone').addClass('has-error');
          $('.error-phone-empty').removeClass('hidden');
          $('.error-phone-isNaN').addClass('hidden');
          $('.error-phone-length').addClass('hidden');
          return false;
      }else if(!isNaN(phone)){
          if(phone.length != 8){
            $('.phone').addClass('has-error');
            $('.error-phone-length').removeClass('hidden');
            $('.error-phone-isNaN').addClass('hidden');
            $('.error-phone-empty').addClass('hidden');
            return false;
          }
      }else{
        $('.phone').addClass('has-error');
        $('.error-phone-isNaN').removeClass('hidden');
        $('.error-phone-empty').addClass('hidden');
        $('.error-phone-length').addClass('hidden');
        return false;
      }
     $('.phone').removeClass('has-error');
     $('.error-phone-isNaN').addClass('hidden');
     $('.error-phone-empty').addClass('hidden');
     $('.error-phone-length').addClass('hidden');
     return true;
    
  });
//------------validacion teléfono "on Click"-----

$('#buton-member').on('click', function(){
    var phone = $('#user_contact_number').val();

      if(phone == ''){
          $('.phone').addClass('has-error');
          $('.error-phone-empty').removeClass('hidden');
          $('.error-phone-isNaN').addClass('hidden');
          $('.error-phone-length').addClass('hidden');
          return false;
      }else if(!isNaN(phone)){
          if(phone.length != 8){
            $('.phone').addClass('has-error');
            $('.error-phone-length').removeClass('hidden');
            $('.error-phone-isNaN').addClass('hidden');
            $('.error-phone-empty').addClass('hidden');
            return false;
          }
      }else{
        $('.phone').addClass('has-error');
        $('.error-phone-isNaN').removeClass('hidden');
        $('.error-phone-empty').addClass('hidden');
        $('.error-phone-length').addClass('hidden');
        return false;
      }
     $('.phone').removeClass('has-error');
     $('.error-phone-isNaN').addClass('hidden');
     $('.error-phone-empty').addClass('hidden');
     $('.error-phone-length').addClass('hidden');
     return true;
    
  });


});