$(function(){
  $('.company_name').on('blur', function(){
    var name = $(this).val();
    if(name == ''){
      $('.company_name-empty').removeClass('hidden');
      $('.name_field').addClass('has-error');
    }else{
      $('.company_name-empty').addClass('hidden');
      $('.name_field').removeClass('has-error');
    }
  });

  $('.company_phone').on('blur', function(){
    var phone = $(this).val();
    if(phone == ''){
      console.log("vacio");
      $('.company_phone-empty').removeClass('hidden');
      $('.company_phone-enough').addClass('hidden');
      $('.phone_field').addClass('has-error');
    }else if(phone.length != 8){
      console.log("largo");
      $('.company_phone-enough').removeClass('hidden');
      $('.company_phone-empty').addClass('hidden');
      $('.phone_field').addClass('has-error');
    }else{
      $('.company_phone-enough').addClass('hidden');
      $('.company_phone-empty').addClass('hidden');
      $('.phone_field').removeClass('has-error');
    }
  });

//-------- validacion On Click ---------

  $('#buton-company').on('click', function(){
    var name = $('.company_name').val();
    if(name == ''){
      $('.company_name-empty').removeClass('hidden');
      $('.name_field').addClass('has-error');
      return false;
    }else{
      $('.company_name-empty').addClass('hidden');
      $('.name_field').removeClass('has-error');
      return true;
    }      
  });

  $('#buton-company').on('click', function(){
    var phone = $('.company_phone').val();
    if(phone == ''){
      console.log("vacio");
      $('.company_phone-empty').removeClass('hidden');
      $('.company_phone-enough').addClass('hidden');
      $('.phone_field').addClass('has-error');
      return false;
    }else if(phone.length != 8){
      console.log("largo");
      $('.company_phone-enough').removeClass('hidden');
      $('.company_phone-empty').addClass('hidden');
      $('.phone_field').addClass('has-error');
        return false;
    }else{
      $('.company_phone-enough').addClass('hidden');
      $('.company_phone-empty').addClass('hidden');
      $('.phone_field').removeClass('has-error');
      return true;
    }


  });

});